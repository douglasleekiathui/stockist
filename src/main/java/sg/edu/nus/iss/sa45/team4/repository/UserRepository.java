package sg.edu.nus.iss.sa45.team4.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import sg.edu.nus.iss.sa45.team4.model.User;

public interface UserRepository extends JpaRepository<User, String>{

}
