package com.sk.ppk.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sk.ppk.model.User;
import com.sk.ppk.util.PageData;
import com.sk.ppk.model.Page;
@Repository
public interface UserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated Wed Apr 27 22:30:15 CST 2016
     */

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated Wed Apr 27 22:30:15 CST 2016
     */
    int insert(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated Wed Apr 27 22:30:15 CST 2016
     */
    int insertSelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated Wed Apr 27 22:30:15 CST 2016
     */
    User selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated Wed Apr 27 22:30:15 CST 2016
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user
     *
     * @mbggenerated Wed Apr 27 22:30:15 CST 2016
     */
    int updateByPrimaryKey(User record);
    
	User selectUserByUP(User user)throws Exception;
	int selectCount(User user)throws Exception;
	void insertUser(User user)throws Exception;
	List<User> selectUserByCondition(String keyword);
	Integer selectUserCount();
	List<User> selectUserPage(Page page);
	void stopUser(Integer id);
	List<User> listAllUser();
	
	List<User> selectAllinfo(Map pagemap);
	
	int selectUserCount(Map pagemap)throws Exception;
	
	int deleteByPrimaryKey(Integer id)throws Exception;
	
	void deleteAll() throws Exception;
	
	List<User> validateUser(String username);

}