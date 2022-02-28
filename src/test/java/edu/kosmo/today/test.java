package edu.kosmo.today;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class PetsHouseDBConTest {

	private static final String driver = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
	private static final String url = "jdbc:log4jdbc:oracle:thin:@146.56.137.240:1521/xe";
	private static final String user = "today_gym";
	private static final String pw = "today_gym";

	@Test
	void contextLoads() throws ClassNotFoundException {

		Class.forName(driver);

		try (Connection con = DriverManager.getConnection(url, user, pw)) {
			log.info("DB 연결 SUCCESS");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}