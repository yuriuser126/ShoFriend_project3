package com.boot.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
* 추상클래스 로그인 서비스
* 25/04/08 성유리 로그인 dto
*/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerDTO {
	private int id;
	private String name;
	private String email;
	private String password;
	private String phone;
	private String address;
	private String address1;
	private int zipcode;
	private Timestamp created_at;
}