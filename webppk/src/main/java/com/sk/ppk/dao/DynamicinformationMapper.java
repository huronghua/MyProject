package com.sk.ppk.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sk.ppk.model.Dynamicinformation;
import com.sk.ppk.model.Role;
import com.sk.ppk.model.Styleinformation;

public interface DynamicinformationMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dynamicinformation
     *
     * @mbggenerated Thu Jun 09 21:08:22 CST 2016
     */
    int insert(Dynamicinformation record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dynamicinformation
     *
     * @mbggenerated Thu Jun 09 21:08:22 CST 2016
     */
    int insertSelective(Dynamicinformation record);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table dynamicinformation
     *
     * @mbggenerated Thu Jun 09 21:08:22 CST 2016
     */
	int selectCount(Map pagemap)throws Exception;
	
	/**取得所有数据
	 * @return
	 * @throws Exception
	 */
	public List<Dynamicinformation> selectAlldynamicinfo(Map pagemap);
	
	Dynamicinformation selectByPrimaryKey(Integer id);
	/**更新数据
	 * @return
	 * @throws Exception
	 */
	public void updateByPrimaryKey(Dynamicinformation dynamicinformation)throws Exception;
	
	/**更新数据
	 * @return
	 * @throws Exception
	 */
	public void updatestatusByPrimaryKey(Dynamicinformation dynamicinformation)throws Exception;
	
	public int deleteByPrimaryKey(Integer id)throws Exception;
	
	public List<Dynamicinformation> selectAlldynamiclist(Map pagemap);
}