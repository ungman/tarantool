package org.springframework.samples.petclinic.permission;

import org.springframework.data.tarantool.repository.Query;
import org.springframework.data.tarantool.repository.TarantoolRepository;


public interface UserRepository extends TarantoolRepository<User, String> {

	@Query(function = "find_user_by_login")
	User findUserByLogin(String login);
}
