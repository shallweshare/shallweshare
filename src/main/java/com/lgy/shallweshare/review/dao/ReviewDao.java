package com.lgy.shallweshare.review.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.lgy.shallweshare.review.dto.Criteria;
import com.lgy.shallweshare.review.dto.ReviewDto;

public interface ReviewDao {
	public void reviewWrite(HashMap<String, String> param);
	public ReviewDto getReviewInfo(String review_id);
	public void reviewModify(HashMap<String, String> param);
	public void reviewDelete(HashMap<String, String> param);
	public ArrayList<ReviewDto> getPersonalReviewList(HashMap<String, String> param);
	public void updateTemperatureDown(HashMap<String, String> param);
	public void updateTemperatureUp(HashMap<String, String> param);
}
