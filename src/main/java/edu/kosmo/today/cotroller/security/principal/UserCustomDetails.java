package edu.kosmo.today.cotroller.security.principal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import edu.kosmo.today.vo.AuthVO;
import edu.kosmo.today.vo.UserVO;
import lombok.Getter;
import lombok.Setter;


//스프링 시큐리티가 로그인 요청을 가로채서 로그인을 진행학 완료가 되면 UserDetails 타입의 오브젝트를
//스프링 시큐리티의 고유한 세션 저장소에 저장을 해 준다. 그 때 저장되는 게 UserDtails타입의 PrincipalDetail(현재 클래스)
@Setter
@Getter
public class UserCustomDetails implements UserDetails, OAuth2User{
	
	private static final long serialVersionUID = 1L;

	//====================================================
	private  UserVO user;//컴포지션 - 객체를 품고 있는 것.
	private Map<String, Object> attributes;//구글 정보.
	private AuthVO auth;
	//=======================================================



	//일반 시큐리티 로그인 사용
	public UserCustomDetails(UserVO user) {
		System.out.println("프린시펄이 왜 생성되지 않지??");
		this.user= user;
		System.out.println("프린시펄을 생성하라!!!");

	}
	//구글 로그인 사용
	public UserCustomDetails(UserVO user,Map<String, Object> attributes) {
		this.user= user;
		this.attributes = attributes;
	}

	public UserCustomDetails(String password, String username, Collection<? extends GrantedAuthority> authorities,
			 boolean accountNonExpired, boolean accountNonLocked,
			boolean credentialsNonExpired, boolean enabled) {
		if (((username == null) || "".equals(username))) {
			throw new IllegalArgumentException(
					"Cannot pass null or empty values to constructor");
		}
		
	}


	@Override
	public String getPassword() { 
		return user.getMpassword();}

	@Override
	public String getUsername() { 
		return user.getMid();}
	
	@Override
	public  Collection<? extends GrantedAuthority> getAuthorities() {
		
		//ArrayList는 컬렉션 타입
		//Collection<GrantedAuthority> authorities = new ArrayList<>();
		
		//	authorities.add(new GrantedAuthority() {	
		//		@Override
		//		public String getAuthority() {
		//			return auth.getAuth(); 
		//		}
		//	});
			
			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();	
			
			
			for (AuthVO auth: user.getAuthList()){
				authorities.add(new SimpleGrantedAuthority(auth.getAuth()));
			}

		
		return authorities;
	}
	
	//계정이 만료되지 않았는지 리턴(true:만료 안 됨)
	@Override
	public boolean isAccountNonExpired() { return true;}
	
	//계정이 잠겨있지 않았는지 리턴한다.(true: 잠기지 않음) 
	@Override
	public boolean isAccountNonLocked() { return true;}
	
	//비밀번호가 만료되지 않았는지 리턴한다.(true: 만료 안 됨)
	@Override
	public boolean isCredentialsNonExpired() { return true;}
	
	//계정이 활성화(사용가능)인지 리턴한다.(true: 활성화)
	@Override
	public boolean isEnabled() { return true ;}
	
	//계정의 권한을 리턴. 타입이 컬렉션, GrantedAuthority를 상속해야.

	//-------------OAuth2User를 상속받아서 오버라이딩한 함수------------

	@Override
	public Map<String, Object> getAttributes() {
		// TODO Auto-generated method stub
		return attributes;
	}

	@Override
	public String getName() {
		return user.getMnum()+"";
	}	


	

	/*
	  @Override public Collection<? extends GrantedAuthority> getAuthorities() {
	  //ArrayList는 컬렉션 타입 Collection<GrantedAuthority> collectors = new
	  ArrayList<>(); collectors.add(new GrantedAuthority() {
	   //자바는 메서드를 add에 못 넣지만 객체는 넣을 수 있어. 
	   //그런데 GrantedAuthority()는 메서드가 getAuthority()하나야 
	   //굳이 메서드를 한 번 감싸야 해. 그래서 자바 1.8부터는 람다식을 지
	  
	  @Override public String getAuthority() {//new GrantedAuthority() 할 때 오버라이딩.
	  return "ROLE_" + user.getRole();
	  //스프링에서 롤을 받을 때 규칙. ROLE_USER. 
	  //그냥 ROLE이라고 하면 인식을 못해. 
	  } }); return collectors; }
	 */
}
