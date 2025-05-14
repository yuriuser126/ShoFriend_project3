package com.boot.service;

import java.util.List;
import java.util.Map;

import com.boot.dto.ReviewDTO;

public interface ReviewService {
	void saveReview(ReviewDTO dto);
	List<ReviewDTO> getReviews(int productId);
	Map<String, Integer> getRatingCounts(int productId); // 별점별 갯수
	Double getAverageRating(int productId); // 평균	
}
