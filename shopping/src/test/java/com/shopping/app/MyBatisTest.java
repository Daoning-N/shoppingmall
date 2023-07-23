//root-context.xml에 sqlSession을 이용한 mybatis의 동작 테스트

package com.shopping.app;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession; //mybatis 작업
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test; //test 어너테이션
import org.junit.runner.RunWith; //현재 클래스를 junit에서 사용할 스프링으로 연결
import org.springframework.test.context.ContextConfiguration; //context 환경파일
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner; //스프링 연동

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})

public class MyBatisTest {
	@Inject
	private SqlSessionFactory sqlFactory; //sqlSessionFactory = mybatis에 정의된 클래스

	@Test
	public void testFactory() {
		System.out.println(sqlFactory);
	}

	@Test
	public void testSession() throws Exception {
		try {
			SqlSession session = sqlFactory.openSession();
			System.out.println(session);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
