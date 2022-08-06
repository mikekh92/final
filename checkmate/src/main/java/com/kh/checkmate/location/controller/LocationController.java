package com.kh.checkmate.location.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.checkmate.location.model.service.LocationService;
import com.kh.checkmate.location.model.vo.Location;


@Controller
public class LocationController {

	@Autowired
	private LocationService LocationService;
	
	@RequestMapping("location.lo")
	public String selectList(float locationLatitude, float locationLongitude, int userNo) {
		
		Location l = new Location();
		l.setLocationLatitude(locationLatitude);
		l.setLocationLongitude(locationLongitude);
		l.setUserNo(userNo);
		
		int listCount = LocationService.selectListCount(l);
		
		// 없을때 (최초 로그인)
		if(listCount == 0) {
			int result = LocationService.insertCoordinate(l);
		} else { // 있을때 업데이트
			int result = LocationService.updateCoordinate(l);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("locationMap.lo")
	public String selectMap() {

		return "location/location";
	}
	
	@RequestMapping("locationMapList.lo")
//	@RequestMapping(value="locationMapList.lo",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String selectMapList() {
		ArrayList<Location> list = LocationService.selectMapList();
		
		String data = "";
		for(int i=0; i<list.size(); i++) {
			if(i==0 && list.size()>0) {
				data = "{\n  \"positions\" : [\n    {\n    \"lng\": "+list.get(i).getLocationLongitude()+",\n    \"lat\": "+list.get(i).getLocationLatitude()+"\n    } ,";
			} else if(i>0 && i<list.size()-1) {
				data += " {\n    \"lng\": "+list.get(i).getLocationLongitude()+",\n    \"lat\": "+list.get(i).getLocationLatitude()+"\n    } ,";
			} else if(i==list.size()-1) {
				data += " {\n    \"lng\": "+list.get(i).getLocationLongitude()+",\n    \"lat\": "+list.get(i).getLocationLatitude()+"}\n  ]\n}";
			}
		}
		
	    File myFile = new File("D:\\github\\checkmate\\checkmate\\src\\main\\webapp\\resources\\kakaoMap/kakaoMap.json");
	    try {
	    	if(myFile.exists()){
	    		myFile.delete();
	    	}
	    	myFile.createNewFile();
	        BufferedWriter writer = new BufferedWriter(new FileWriter(myFile));
	        writer.write(data);
	        writer.close();
	    } catch (IOException e) {
	      e.printStackTrace();
	      System.out.println("예외 처리");
	      System.out.println("파일을 처리하는 과정에서 오류가 발생했습니다.");
	    }
	    
//		return new Gson().toJson(list);
		return "";
	}
}
