package com.sk.ppk.dao;

import java.util.List;
import java.util.Map;

import com.sk.ppk.model.Page;
import com.sk.ppk.model.Role;
import com.sk.ppk.model.Styleinformation;
import com.sk.ppk.model.User;

public interface RoleMapper {
	int deleteByPrimaryKey(Integer id)throws Exception;

	int insert(Role record);

	int insertSelective(Role record);

	Role selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Role record);

	int updateByPrimaryKey(Role record);

	List<Role> listAllRole();

	void stopRole(Integer id);

	List<Role> selectRoleByCondition(Role role);

	Integer selectRoleCount();

	List<Role> selectRolePage(Page page);
	
	/**查询所有角色
	 * @return
	 * @throws Exception
	 */
	public List<Role> selectAllroleinfo(Map pagemap);
	
	int selectCount(Map pagemap)throws Exception;
	
	void insertRole(Role role)throws Exception;
	
	/**查询所有角色
	 * @return
	 * @throws Exception
	 */
	public void saverole(Role role)throws Exception;
	/**删除所有角色
	 * @return
	 * @throws Exception
	 */
	public void deleteAllRole()throws Exception;
}