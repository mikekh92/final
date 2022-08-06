package com.kh.checkmate.reservation.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.checkmate.member.model.vo.Member;
import com.kh.checkmate.reservation.model.service.ReservationService;
import com.kh.checkmate.reservation.model.vo.Reservation;


@Controller
public class ReservationController {

	@Autowired
	private ReservationService reservationService;


	@RequestMapping("reservation.ro")
		public String homeController(Locale locale, Model model) {
		
			ArrayList<Reservation> list =reservationService.home();
			
			model.addAttribute("list",list);
			return "reservation/selectAllReservation";
		}
	@ResponseBody
	@RequestMapping(value="reserveRoomSize.ro",produces="application/json; charset=UTF-8")
	public String selectRoomSize (String roomCenterName) {

		ArrayList<Reservation> list = reservationService.selectRoomSize(roomCenterName);
	
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value="reserveRoomName.ro",produces="application/json; charset=UTF-8")
	public String selelctRoomName(String roomCenterName,int roomSize) {

		Reservation r = new Reservation();
		r.setRoomCenterName(roomCenterName);
		r.setRoomSize(roomSize);
		ArrayList<Reservation>list = reservationService.selectRoomName(r);
		
		return new Gson().toJson(list);
	}
	@RequestMapping("insertReservation.ro")
	public String insertReservation (Reservation r, Model model,HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		r.setReservationUser(userNo);		
		int roomNo = reservationService.selectRoomNo(r); 
		r.setRoomNo(roomNo);
		
		ArrayList<Reservation> reservationList = reservationService.selectReservationList(r);
		
		int[] timeList = new int[13];
		for(int i = 9; i < timeList.length+9 ;i++) {
			timeList[i-9] = i;
		}
		
		for(int i = 0; i < reservationList.size(); i++) {
			System.out.println(i + " i값");
			for(int j = 0; j < reservationList.get(i).getReservationUsedTime();j++) {
				if (timeList[reservationList.get(i).getReservationStartTime()+j-9] != 0) {
					timeList[reservationList.get(i).getReservationStartTime()+j-9] = 0;	
				}
			}
		} // 9~21시간 대 중에 해당 날짜, 해당 방에 예약한 것이 있으면 0으로 만드는 preprocessing

		
		int flag = 0;
		
		for(int i = 0; i < r.getReservationUsedTime();i++) {
			if(timeList[r.getReservationStartTime()+i-9] != 0) {
				continue;
			}
			else {
				flag = 1; // timeList에 0인 값이 예약하려는 시간대라는 의미. 즉, 이미 예약된 시간이다.
				break;
			}			
		}
		
		
	if(flag == 0) {
		int result = reservationService.insertReservation(r);
		
		session.setAttribute("alertMsg", "예약성공");
		return "redirect:reservation.ro";	
	}
		else { // 하나라도 겹치는 시간대가 있다면 바로 return
			session.setAttribute("alertMsg","예약실패");
			return "redirect:reservation.ro";
		}
	}
	@RequestMapping("selectMyReservation.ro")
	public String selectMyReservation (Reservation r,HttpSession session) {
	
		int userNo=((Member)session.getAttribute("loginUser")).getUserNo();
		r.setReservationUser(userNo);
		
		ArrayList <Reservation> myList = reservationService.selectMyReservation(r);
		int  listCount = reservationService.selectListCount(r); 
		
		session.setAttribute("myList", myList);
		session.setAttribute("listCount", listCount);
		return "redirect:myPage.me";
	}
	@ResponseBody
	@RequestMapping(value="deleting.ro",produces="application/json; charset=UTF-8")
	public String deleteReservation (String [] values) {
		
		int[] reservationNoDelete = new int [values.length];
		
		for(int i=0; i<values.length; i++) {
			reservationNoDelete[i]=Integer.parseInt(values[i]);
		}
		
		int result = reservationService.deleteReservation(reservationNoDelete);
		
		return new Gson().toJson(result);
	}
	
}


