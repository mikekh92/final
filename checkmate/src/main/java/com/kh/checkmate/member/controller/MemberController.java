package com.kh.checkmate.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.checkmate.member.model.dao.NaverLoginBO;
import com.kh.checkmate.member.model.service.MemberService;
import com.kh.checkmate.member.model.vo.Member;
import com.kh.checkmate.studyGroup.model.service.StudyGroupService;
import com.kh.checkmate.studyGroup.model.vo.StudyGroup;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private StudyGroupService studyGroupService;
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,HttpSession session,ModelAndView mv) {
		
		
		Member loginUser = memberService.loginMember(m);
		
		

		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPw(), loginUser.getUserPw())) {
			String userNick = loginUser.getUserNick();
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("userNick", userNick);
			
			//로그인한 유저가 속한 스터디그룹 조회
			ArrayList<StudyGroup> myStudyGroupList = studyGroupService.myStudyGroupList(userNick);
			session.setAttribute("myStudyGroupList", myStudyGroupList);
			
			mv.setViewName("redirect:/");
		}else {
			session.setAttribute("alertMsg", "아이디와 비밀번호를 확인해주세요.");
			mv.setViewName("member/memberLoginForm");			
		}		
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	//네이버 로그인 파트
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callbackNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {
		System.out.println("로그인 성공 callbackNaver");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
	    
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		
		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("response");			
		// 프로필 조회
		String userEmail = (String) response_obj.get("email");
		String name = (String) response_obj.get("name");
		String userId = (String) response_obj.get("id");
		String userPhone = (String) response_obj.get("mobile");
		String userProfile = (String) response_obj.get("profile_image");
		// 세션에 사용자 정보 등록
		// session.setAttribute("islogin_r", "Y");
		session.setAttribute("signIn", apiResult);
		session.setAttribute("userId", userId);
		session.setAttribute("userEmail", userEmail);
		session.setAttribute("userPhone", userPhone);
		session.setAttribute("userProfile", userProfile);
		System.out.println(apiResult);
		Member loginUser = memberService.NaverloginMember(userId);
			
		if(loginUser!=null) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
		}else {
			session.setAttribute("alertMsg", "추가 정보 입력이 필요합니다.");
			return "member/goNaverEnrollForm";
		}
		    
	}
	
	@RequestMapping("naverInsert.me")
	public String naverInsert(Member m,MultipartFile profile,HttpSession session,Model model) {
		if(!profile.getOriginalFilename().equals("")) {
			String changeName = saveFile(profile,session);
			m.setUserOriginProfile(profile.getOriginalFilename());
			m.setUserChangeProfile("resources/uploadFiles/"+changeName);
			
			int result = memberService.insertMember2(m);		
			
			if(result>0) {
				return "redirect:/";
			}else {			
				model.addAttribute("errorMsg","회원가입 실패");
				return "common/errorPage";
			}		
		}else {
			int result = memberService.insertMember(m);		
			System.out.println(m);
			if(result>0) {				
				session.setAttribute("alertMsg", "회원가입 성공");
				return "redirect:/";
			}else {			
				model.addAttribute("errorMsg","회원가입 실패");
				return "common/errorPage";
			}			
		}		
	}		
	@ResponseBody
	@RequestMapping("kakaoLogin.me")
	public String kakaoLogin(String userEmail,HttpSession session) {
		Member loginUser = memberService.KakaologinMember(userEmail);
		session.setAttribute("userEmail", userEmail);
		System.out.println(loginUser);
		if(loginUser!=null) {
			session.setAttribute("loginUser", loginUser);
			return "Y";
		}else {	
			return "N";
		}
		
	}
		
	@ResponseBody
	@RequestMapping(value="idcheck.me",produces = "text/html; charset=UTF-8")
	public String idcheck(String userId) {
	
		int result = memberService.idCheck(userId);
		
		if(result>0) {
			return "N";
		}else {
			return "Y";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="nickCheck.me",produces = "text/html; charset=UTF-8")
	public String nickCheck(String userNick) {
		
		int result = memberService.nickCheck(userNick);
		if(result>0) {
			return "N";
		}else {
			return "Y";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="emailCheck.me",produces = "text/html; charset=UTF-8")
	public String emailCheck(String userEmail) {
		
		int result = memberService.emailCheck(userEmail);
		if(result>0) {
			return "N";
		}else {
			return "Y";
		}
	}
	
	@RequestMapping("kakaoEnrollForm.me")
	public String kakaoEnrollForm() {	
		return "member/kakaoEnrollForm";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m,MultipartFile profile,HttpSession session,Model model) {
		
		System.out.println(profile.getOriginalFilename());
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPw());		
		m.setUserPw(encPwd);
		
		if(!profile.getOriginalFilename().equals("")) {
			String changeName = saveFile(profile,session);
			m.setUserOriginProfile(profile.getOriginalFilename());
			m.setUserChangeProfile("resources/uploadFiles/"+changeName);
			
			int result = memberService.insertMember2(m);		
			
			if(result>0) {
				return "redirect:/";
			}else {
				
				model.addAttribute("errorMsg","회원가입 실패");
				return "common/errorPage";
			}			
		}else {
			int result = memberService.insertMember(m);		
			
			if(result>0) {				
				
				return "redirect:/";
			}else {				
				model.addAttribute("errorMsg","회원가입 실패");
				return "common/errorPage";
			}			
		}			
	}
	
	@RequestMapping("memberEnrollForm.me")
	public String memberEnrollForm() {
		
		
		return "member/memberEnrollForm";
	}
	
	
	
	@RequestMapping(value ="memberLoginForm.me", method = { RequestMethod.GET, RequestMethod.POST })
	public String memberLoginForm(Model model, HttpSession session) {
			
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);		
		System.out.println("네이버:" + naverAuthUrl);		
		model.addAttribute("urlNaver", naverAuthUrl);
		return "member/memberLoginForm";
	}
	
	@RequestMapping("findId.me")
	public String findId() {
		return "member/findId";
	}
	
	@RequestMapping("findPwd.me")
	public String findPwd() {
		return "member/findPwd";
	}
	
	@ResponseBody
	@RequestMapping(value="findIdForm.me",produces = "text/html; charset=UTF-8")
	public String findIdForm(String userPhone) {
		System.out.println(userPhone);
		String userId = memberService.findId(userPhone);
		
		return userId;
	}
	
	@ResponseBody
	@RequestMapping(value="changePwd.me",produces = "text/html; charset=UTF-8")
	public String changePwd(Member m) {
		System.out.println(m.getUserPw());
		System.out.println(m.getUserId());
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPw());		
		m.setUserPw(encPwd);				
		int result = memberService.changePwd(m);
		System.out.println(result);
		String a = String.valueOf(result);
		return a;
	}
	
	
	
	
	public String saveFile(MultipartFile upfile,HttpSession session) {
		String originName = upfile.getOriginalFilename(); 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()*90000+10000); 
		String ext = originName.substring(originName.lastIndexOf(".")); 
		
		String changeName = currentTime+ranNum+ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/"); 
		
		try {
			upfile.transferTo(new File(savePath+changeName)); 
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return changeName;
	}
	
	@RequestMapping(value="/phoneCheck", method =RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) {
		
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
		
		if(userPhoneNumber.matches("^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$")) {
			memberService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
					
			return Integer.toString(randomNumber);
		}else {
			return "error";
		}
				
	}
	@RequestMapping("myPage.me")
	public String myPage(HttpSession session,Model model) {
		
		Member	m	 =(Member)session.getAttribute("loginUser");
		Member updateMem1 =memberService.myPage(m);	
		String [] address=updateMem1.getUserAddress().split(",");
		String addressKakao = address[0];
		String addressDetail = address[1];
						
		model.addAttribute("addressKakao", addressKakao);
		model.addAttribute("addressDetail", addressDetail);
		
		return "member/myPage";
	}
	@RequestMapping("update.me")
	public String updateMember(Member m,MultipartFile profile,HttpSession session,Model model) {
		
		if(!profile.getOriginalFilename().equals("")) {
			String changeName = saveFile(profile,session);
			m.setUserOriginProfile(profile.getOriginalFilename());
			m.setUserChangeProfile("resources/uploadFiles/"+changeName);
			
			int result = memberService.updateMember2(m);
			
			if(result>0) {
				
				Member updateMem =memberService.loginMember(m);
					
				session.setAttribute("loginUser", updateMem);							
				session.setAttribute("alertMsg", "회원 정보수정 성공");
				return "redirect:myPage.me";
			}else {
				model.addAttribute("errorMsg","회원 정보 수정실패");
				return "common/errorPage";
				
			}
					
		}else {
		
			int result =memberService.updateMember(m);
			
			if(result>0) {				
				Member updateMem =memberService.loginMember(m);

				session.setAttribute("loginUser", updateMem);					
				session.setAttribute("alertMsg", "회원 정보수정 성공");
				return "redirect:myPage.me";
			}else {
				model.addAttribute("errorMsg","회원 정보 수정실패");
				return "common/errorPage";
			}
		}
	}
	@RequestMapping("delete.me")
	public String deleteMember(String userPw,HttpSession session,Model model) {
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPw();
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		if(bcryptPasswordEncoder.matches(userPw, encPwd)) {
			
			int result = memberService.deleteMember(userId);
			
			if(result>0) {
				session.removeAttribute("loginUser");
				
				session.setAttribute("alertMsg", "이용해주셔서 감사합니다");
				return "redirect:/";
			}else {
				model.addAttribute("errorMsg","회원탈퇴실패");
				return "common/errorPage";
			}
			
		}else {
			session.setAttribute("alertMsg", "비밀번호를 잘못 입력하셨습니다.");
			return "redirect:/";
		}
	}
	@RequestMapping("updatePwd.me")
	public String updatePwd(Member m,String nowPw, HttpSession session,Model model) {
		
			String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			String userPwd =((Member)session.getAttribute("loginUser")).getUserPw();
			String encUpdatePw =bcryptPasswordEncoder.encode(m.getUserPw());
			
			if(bcryptPasswordEncoder.matches(nowPw,userPwd)){
			
			m.setUserPw(encUpdatePw);
			m.setUserId(userId);
			
			int result = memberService.updatePwd(m);
			
			if(result>0) {
				Member updateMem =memberService.loginMember(m);
				session.setAttribute("loginUser", updateMem);
				
				session.setAttribute("alertMsg", "회원 정보수정 성공");
				return "redirect:myPage.me";
			}else {
				model.addAttribute("errorMsg","회원 정보 수정실패");
				return "common/errorPage";
			}
			
			}else {
				session.setAttribute("alertMsg","비밀번호가 올바르지 않습니다.");
				return "redirect:myPage.me";
			}
	}		
}
