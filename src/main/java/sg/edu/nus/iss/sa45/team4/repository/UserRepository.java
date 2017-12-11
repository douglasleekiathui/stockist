package sg.edu.nus.iss.sa45.team4.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sg.edu.nus.iss.sa45.team4.model.User;

public interface UserRepository extends JpaRepository<User, String>{
	@Query("SELECT u FROM User u WHERE u.user=:un AND u.password=:pwd")
	User findUserByNamePwd(@Param("un") String uname, @Param("pwd") String pwd);
	
	@Query("SELECT u FROM User u WHERE u.user=:u")
	User findUserByUsername(@Param("u") String user);

}
