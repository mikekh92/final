package com.kh.checkmate.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor 
@AllArgsConstructor 
@Setter
@Getter
@ToString
@EqualsAndHashCode 
@Data
public class Member {
	private int userNo;
	private String userName;
	private String userId;
	private String userPw;
	private String userNick;
	private String userEmail;
	private String userPhone;
	private Date enrollDate;
	private String status;
	private String userAddress;
	private String userAddressDetail;
	private String userOriginProfile;
	private String userChangeProfile;
}
