package edu.kosmo.today.cotroller.security.Oauth2Principal;

import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import edu.kosmo.today.cotroller.security.Oauth2Principal.provider.GoogleUserInfo;
import edu.kosmo.today.cotroller.security.Oauth2Principal.provider.KakaoUserInfo;
import edu.kosmo.today.cotroller.security.Oauth2Principal.provider.NaverUserInfo;
import edu.kosmo.today.cotroller.security.Oauth2Principal.provider.OAuth2UserInfo;
import edu.kosmo.today.cotroller.security.principal.UserCustomDetails;
import edu.kosmo.today.mapper.UserMapper;
import edu.kosmo.today.vo.UserVO;


@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService{

	@Autowired(required=true)
	private UserMapper userMapper;

	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// userRequest 는 code를 받아서 accessToken을 응답 받은 객체
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		
		System.out.println("getClientRegistration: " + userRequest.getClientRegistration()); // registrationId로 어떤 OAuth로 로그인 했는지 확인 가능.
		System.out.println("getAccessToken: " + userRequest.getAccessToken().getTokenValue());
		
		OAuth2User oAuth2User = super.loadUser(userRequest);
		
		System.out.println("getAttributes: " + oAuth2User.getAttributes());
		
		return processOAuth2User(userRequest, oAuth2User);
		
	}

	private OAuth2User processOAuth2User(OAuth2UserRequest userRequest, OAuth2User oAuth2User) {

		// Attribute를 파싱해서 공통 객체로 묶는다. 관리가 편함.
		OAuth2UserInfo oAuth2UserInfo = null;
		if (userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			System.out.println("구글 로그인 요청~~");
			oAuth2UserInfo = new GoogleUserInfo(oAuth2User.getAttributes());
		} else if (userRequest.getClientRegistration().getRegistrationId().equals("naver")){
			System.out.println("네이버 로그인 요청~~");
			oAuth2UserInfo = new NaverUserInfo((Map)oAuth2User.getAttributes().get("response"));
		} else if (userRequest.getClientRegistration().getRegistrationId().equals("kakao")){
			System.out.println("카카오 로그인 요청~~");
			oAuth2UserInfo = new KakaoUserInfo((Map)oAuth2User.getAttributes().get("kakao_account"));
			System.out.println("이메일 타기" + oAuth2UserInfo.getEmail());
		} else {
			System.out.println("우리는 구글과 페이스북만 지원해요 ㅎㅎ");
		}

		//System.out.println("oAuth2UserInfo.getProvider() : " + oAuth2UserInfo.getProvider());
		//System.out.println("oAuth2UserInfo.getProviderId() : " + oAuth2UserInfo.getProviderId());
		//회원가입 정보======================================
		/*
		 * String provider = null;
		 * 
		 * if(oAuth2UserInfo.getProviderId()==null) { String provider =
		 * oAuth2UserInfo.getProviderId(); }else { String provider =
		 * oAuth2UserInfo.getProviderId().substring(0,15); }
		 */
		
		String email = oAuth2UserInfo.getEmail();
		String mid = oAuth2UserInfo.getProvider() +"_" + email;

		//회원 여부, 구글 아이디 검색=====================================
		UserVO member = userMapper.getUser(mid);		
		System.out.println("객체 찾기");
		if (member==null) {
					
			member=UserVO.builder().mid(mid).memail(email).build();
			
			System.out.println("======소셜 회원가입============================");
			
			userMapper.socialSave(member);
			userMapper.insertAuthority(member);
			
			System.out.println("=======소셜 객체 생성==========================");
			
			UserVO user = userMapper.getUser(mid);
			System.out.println("회원가입 정보: " + user );

			return new UserCustomDetails(user, oAuth2User.getAttributes());

		} else {
			// user의 패스워드가 null이기 때문에 OAuth 유저는 일반적인 로그인을 할 수 없음.			
			System.out.println("======소셜 로그인 ============================");

			UserVO user = userMapper.getUser(mid);
			
			System.out.println("회원가입 정보: " + user );
			return new UserCustomDetails(user, oAuth2User.getAttributes());

		}

	}
}
