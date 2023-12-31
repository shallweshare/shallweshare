package com.lgy.shallweshare.users.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsersDto {
	 private int u_id; 
	 private String u_role;
	 private String u_login_platform;
	 private String u_sns_id;
	 private String u_pwd;
	 private String u_name;
	 private String u_nickname;
	 private String u_phoneNum;
	 private String u_gender;
	 private String u_email;
	 private String u_bank_account;
	 private String u_authentication;
	 private float u_temperature;
	 private Date u_created;
}
