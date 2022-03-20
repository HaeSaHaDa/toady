package edu.kosmo.today.cotroller.security.Oauth2Principal.provider;

import java.util.Map;

import lombok.Data;
@Data
public class NaverUserInfo implements OAuth2UserInfo{

	private Map<String, Object> attributes;
	
    public NaverUserInfo(Map<String, Object> attributes) {
        this.attributes = attributes;
    }
    
    @Override
    public Map<String, Object> getAttributes(){
    	return attributes;
    }
	
    @Override
    public String getProviderId() {
        return (String) attributes.get("id");
    }

    @Override
    public String getName() {
        return (String) attributes.get("name");
    }

    @Override
    public String getEmail() {
        return (String) attributes.get("email");
    }

	@Override
	public String getProvider() {
		return "naver";
	}

}
