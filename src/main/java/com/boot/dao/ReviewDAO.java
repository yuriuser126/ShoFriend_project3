package com.boot.dao;

import java.util.List;
import java.util.Map;

import com.boot.dto.ReviewDTO;

public interface ReviewDAO {
	void insertReview(ReviewDTO dto);
	List<ReviewDTO> getReviews(int productId);
	List<Map<String, Object>> getRatingCounts(int productId);
	Double getAverageRating(int productId);	
}
