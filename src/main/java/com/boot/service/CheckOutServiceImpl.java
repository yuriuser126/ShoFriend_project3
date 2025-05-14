package com.boot.service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.boot.dao.OrdersDAO;
import com.boot.dto.OrderItemDTO;
import com.boot.dto.OrdersDTO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service("CheckOutService")
public class CheckOutServiceImpl implements CheckOutService{
	
    private static final String HOST = "https://kapi.kakao.com";
    private static final String ADMIN_KEY = "KakaoAK 81ab368bf14242468daa66fd3bde4ece";
    private String tid;
    
    @Autowired
    private SqlSession sqlSession;
    
    @Autowired
    private HttpSession session; // HttpSession 주입
    
    @Override
    public String kakaoPayReady(int totalAmount, String itemName, int quantity) {

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", ADMIN_KEY);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        String partnerOrderId = "order_" + System.currentTimeMillis();
        String partnerUserId = "user_" + UUID.randomUUID().toString();
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("cid", "TC0ONETIME"); // 테스트 CID
        params.add("partner_order_id", partnerOrderId);
        params.add("partner_user_id", partnerUserId);
        params.add("item_name", itemName);
        params.add("quantity", String.valueOf(quantity));
        params.add("total_amount", String.valueOf(totalAmount));
        params.add("vat_amount", String.valueOf(Math.round(totalAmount * 0.1)));
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:8485/pay/success");
        params.add("cancel_url", "http://localhost:8485/pay/cancel");
        params.add("fail_url", "http://localhost:8485/pay/fail");

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<>(params, headers);

        try {
        	log.info("try1=>");
            ResponseEntity<Map> response = restTemplate.postForEntity(
                HOST + "/v1/payment/ready", body, Map.class);
            
            this.tid = (String) response.getBody().get("tid");
            log.info("response=>"+response);
            session.setAttribute("partnerOrderId", partnerOrderId); // partnerOrderId 세션에 저장 (선택 사항)
            session.setAttribute("partnerUserId", partnerUserId);   // partnerUserId 세션에 저장

            return (String) response.getBody().get("next_redirect_pc_url");

        } catch (Exception e) {
            e.printStackTrace();
            return "/pay/fail";
        }
    }
    @Override
    public String kakaoPayApprove(String pgToken) {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", ADMIN_KEY);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", tid); // 결제 준비 단계에서 받은 tid
        params.add("partner_order_id", (String) session.getAttribute("partnerOrderId"));
        params.add("partner_user_id", (String) session.getAttribute("partnerUserId"));
        params.add("pg_token", pgToken);

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<>(params, headers);

        try {
            ResponseEntity<String> response = restTemplate.postForEntity(
                HOST + "/v1/payment/approve", body, String.class);

            return "success";

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
	@Override
	public int createOrder(OrdersDTO orderDTO, List<OrderItemDTO> orderItems) {
        OrdersDAO orderDAO = sqlSession.getMapper(OrdersDAO.class);
        
     // partnerOrderId 생성 (예시: 날짜 + 고유 ID)
        String partnerOrderId = (String) session.getAttribute("partnerOrderId");
        orderDTO.setPartner_order_id(partnerOrderId);
        orderDTO.setOrder_status("pending"); // 기본 주문 상태 설정

        orderDAO.insertOrder(orderDTO);
        int orderId = orderDTO.getId(); // 자동 생성된 주문 ID 가져오기

        // 주문 아이템 저장
        for (OrderItemDTO item : orderItems) {
            item.setOrder_id(orderId);
            orderDAO.insertOrderItem(item);
        }

        return orderId;
    }

}
