package com.lgy.shallweshare.users.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.lgy.shallweshare.users.dao.UsersDao;
import com.lgy.shallweshare.users.dto.KakaoDTO;
import com.lgy.shallweshare.users.dto.UsersDto;
import com.lgy.shallweshare.users.kakao.MemberRepository;

import lombok.extern.slf4j.Slf4j;
@Service("UsersService")
@Slf4j
public class UsersServiceImpl implements UsersService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MemberRepository mr;
	
//	=============== 유저 정보 받아오기(개인) ===============
	@Override
	public UsersDto getUserInfo(int u_id) {
		log.info("@# Service: getUserInfo");
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		UsersDto user = dao.getUserInfo(u_id);
		
		return user;
	}

//	=============== 로그인 ===============
	@Override
	public ArrayList<UsersDto> signIn(HashMap<String, String> param) {
		log.info("@# UserServiceImpl.signIn() start");
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		ArrayList<UsersDto> dtos= dao.signIn(param);
		log.info("@# UserServiceImpl.signIn() end");		
		return dtos;
	}

	
	@Override
	public void signUp(HashMap<String, String> param) {
		log.info("@# UserServiceImpl.signUp() start");
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		dao.signUp(param);
		log.info("@# UserServiceImpl.signUp() end");	
	}

//아이디 찾기 : 회원가입시 사용
	@Override
		public int idChk(String u_sns_id) {
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		return dao.idChk(u_sns_id);
	}

//	회원 정보 찾기
	@Override
	public ArrayList<UsersDto> userSearch(HashMap<String, String> param) {
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		ArrayList<UsersDto> dtos= dao.userSearch(param);
		return dtos;
	}
	
	// 일반 회원정보 수정
		@Override
		public void userModify(HashMap<String, String> param) {
			UsersDao dao = sqlSession.getMapper(UsersDao.class);
			dao.userModify(param);
		}
	
	
//	kakao에서 액세스 토큰값 얻어오기
	@Override
	public String getAccessToken(String authorize_code) {
		 String access_Token = "";
	        String refresh_Token = "";
	        String reqURL = "https://kauth.kakao.com/oauth/token";

	        try {
	            URL url = new URL(reqURL);

	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로

	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);

	            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            
				sb.append("grant_type=authorization_code");
				sb.append("&client_id=97b3eb27ba108e2e3f48aa5cbed11254"); // REST_API키 
				sb.append("&redirect_uri=http://localhost:8181/shallweshare/users/kakaoLogin"); // REDIRECT_URI
				sb.append("&code=" + authorize_code);
				bw.write(sb.toString());
				bw.flush();
				
//			    결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

	            System.out.println("access_token : " + access_Token);
	            System.out.println("refresh_token : " + refresh_Token);

	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return access_Token;
	}


//	액세스 토큰을 이용해서 유저 정보 불러오기
	@Override
	public KakaoDTO getUserInfo(String access_Token) {
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String name = properties.getAsJsonObject().get("nickname").getAsString();
            String id = kakao_account.getAsJsonObject().get("email").getAsString();
            String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
            System.out.println("@### ServeiceImpl gender1===>>"+ gender);
            
            if(gender.equals("female")) {
            	gender="F";
            }else if(gender.equals("male")) {
            	gender="M";
            }
            System.out.println("@### gender===>>"+ gender);
            userInfo.put("name", name);
            userInfo.put("id", id);
            userInfo.put("gender", gender);

        } catch (IOException e) {
            e.printStackTrace();
        }
        
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@userInfo=======>"+userInfo);
        KakaoDTO result = mr.findkakao(userInfo);
        
        System.out.println("S:" + result);
        
        if(result==null) {
        	
        	mr.kakaoinsert(userInfo);
        	return mr.findkakao(userInfo);
        	
        } else {
        	return result;
        }
       
	}


//	첫 가입(추가정보가 없을 경우) 추가가입 (update로)
	@Override
	public void kakaoSignUp(HashMap<String, String> param) {
		mr.kakaoSignUp(param);
	}


// 카카오회원 정보 수정
	@Override
	public void kakaoUserModify(HashMap<String, String> param) {
		mr.kakaoUserModify(param);
	}



	@Override
	public ArrayList<KakaoDTO> kakaoUserSearch(HashMap<String, String> param) {
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		ArrayList<KakaoDTO> dtos= dao.kakaoUserSearch(param);
		return dtos;
	}


//	일반 유저 탈퇴
	@Override
	public void userDel(HashMap<String, String> param) {
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		dao.userDel(param);
	}

//	카카오 유저 로그아웃
	@Override
	public void kakaologout(String access_Token) {
		 String reqURL = "https://kapi.kakao.com/v1/user/logout";
		 
		    try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
		        
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);
		        
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        
		        String result = "";
		        String line = "";
		        
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        System.out.println(result);
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		}

//	카카오 유저 탈퇴 (카카오 연결 끊기)
	public void kakaounlink(String access_Token, HashMap<String, String> param) {
	    String reqURL = "https://kapi.kakao.com/v1/user/unlink";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        System.out.println("@@#####@@@@kakaounlink SImpl ==> access_Token===>"+access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	@Override
	public void logout(HttpSession session) {
		 session.invalidate();
	}

	@Override
	public int nickChk(String u_nickname) {
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		return dao.nickChk(u_nickname);
	}

	@Override
	public int nickModifyChk(HashMap<String, String> param) {
		UsersDao dao = sqlSession.getMapper(UsersDao.class);
		return dao.nickModifyChk(param);
	}




}
