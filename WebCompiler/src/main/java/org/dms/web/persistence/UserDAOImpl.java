package org.dms.web.persistence;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.ibatis.session.SqlSession;
import org.dms.web.domain.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "org.dms.web.mapper.Mapper";

	@Override
	public void insert(UserVO user) throws Exception {
		// TODO Auto-generated method stub		
		/*byte[] imageInByte;
        
		BufferedImage originalImage = ImageIO.read(new File("C:/ddonggov.png"));
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(originalImage, "png", baos);
		baos.flush();
		 
		imageInByte = baos.toByteArray();
		
		user.setUser_img(imageInByte);
		*/
		sqlSession.insert(namespace + ".user_insert", user);
	}

	@Override
	public List<UserVO> readList() throws Exception {
		// TODO Auto-generated method stub
		List<UserVO> userList=new ArrayList<UserVO>();
		userList = sqlSession.selectList(namespace + ".user_selectAll");
		for(int i = 0; i<userList.size(); i++) {
			String introduce = userList.get(i).getUser_introduce();
//			introduce.replace("�엯�땲�떎", "諛붽엥�떎");
			System.out.println(i + ": " + introduce);
			userList.get(i).setUser_introduce(introduce);
		}
		return userList;
	}

	@Override
	public UserVO read(String id) throws Exception {
		UserVO user = sqlSession.selectOne(namespace + ".user_selectById", id);
		return user;
	}

	@Override
	public void delete(String id) throws Exception {
		sqlSession.delete(namespace + ".user_deleteById", id);
	}

	@Override
	public int update(UserVO user) throws Exception {		
		return sqlSession.update(namespace + ".user_update", user);
	}
	
	@Override
	public int saveImg(UserVO user) throws Exception {
		return sqlSession.update(namespace + ".save_img", user);
		
	}

	@Override
	public UserVO read(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		UserVO user = sqlSession.selectOne(namespace + ".user_selectForLogin", vo);
		return user;	
	}

}
