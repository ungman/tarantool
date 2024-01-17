package org.springframework.samples.petclinic.permission;

import org.springframework.data.tarantool.core.mapping.Field;
import org.springframework.data.tarantool.core.mapping.Tuple;
import org.springframework.samples.petclinic.model.BaseEntity;

@Tuple("users")
public class User extends BaseEntity {

	@Field(name = "login")
	private String login;

	@Field(name = "post")
	private String post;

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	@Override
	public String toString() {
		return "User{" +
			"login='" + login + '\'' +
			", post='" + post + '\'' +
			'}';
	}
}
