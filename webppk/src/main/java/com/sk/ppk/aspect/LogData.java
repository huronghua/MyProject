package com.sk.ppk.aspect;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.sk.ppk.dao.JournalMapper;
import com.sk.ppk.model.Journal;
import com.sk.ppk.model.User;

@Component
@Aspect
public class LogData {
	@Autowired
	private JournalMapper journalMapper;	
	//用户操作栏
	@After("execution(* com.sk.ppk.dao.UserMapper.insertSelective(..))")
	public void logAddUser(){
		Journal journal = getJournal();
		journal.setColumn("用户管理");
		journal.setOperater("添加");
		journalMapper.insertSelective(journal);
		System.out.println("执行了添加用户的方法");
	}
	@After("execution(* com.sk.ppk.dao.UserMapper.updateByPrimaryKeySelective(..))")
	public void logeditUser(JoinPoint point){
		Journal journal = getJournal();
		journal.setColumn("用户管理");
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String url = request.getRequestURI();; 
		  //取得最后一个/的下标  
		  int index = url.lastIndexOf("/");  
		  //substring(int beginIndex)返回一个新的字符串，它是此字符串的一个子字符串。  
		  String newString = url.substring(index + 1);   
		if(newString.equals("user_save")){
			journal.setOperater("编辑");
		}
		else{
			String USE = request.getParameter("USE").trim();
			if(USE.equals("启用")){
				journal.setOperater("启用");
			}
			else{
				journal.setOperater("不启用");
			}
			
		}
		journalMapper.insertSelective(journal);
	}
	@After("execution(* com.sk.ppk.dao.UserMapper.deleteByPrimaryKey(..))")
	public void logdeleteUser(){
		Journal journal = getJournal();
		journal.setColumn("用户管理");
		journal.setOperater("删除");
		journalMapper.insertSelective(journal);
		System.out.println("执行了删除用户的方法");
	}
	//角色操作栏
	@After("execution(* com.sk.ppk.dao.RoleMapper.insertRole(..))")
	public void logAddRole(){
		Journal journal = getJournal();
		journal.setColumn("角色管理");
		journal.setOperater("添加");
		journalMapper.insertSelective(journal);
		System.out.println("执行了添加角色的方法");
	}
	
	@After("execution(* com.sk.ppk.dao.RoleMapper.updateByPrimaryKeySelective(..))")
	public void logeditRole(){
		Journal journal = getJournal();
		journal.setColumn("角色管理");
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String url = request.getRequestURI();; 
		  //取得最后一个/的下标  
		  int index = url.lastIndexOf("/");  
		  //substring(int beginIndex)返回一个新的字符串，它是此字符串的一个子字符串。  
		  String newString = url.substring(index + 1);   
		if(newString.equals("save_role")){
			journal.setOperater("编辑");
		}
		else{
			String USE = request.getParameter("USE").trim();
			if(USE.equals("启用")){
				journal.setOperater("启用");
			}
			else{
				journal.setOperater("不启用");
			}
			
		}
		journalMapper.insertSelective(journal);
		System.out.println("执行了冻结角色的方法");
	}
	
	@After("execution(* com.sk.ppk.dao.RoleMapper.deleteByPrimaryKey(..))")
	public void logdeleteRole(){
		Journal journal = getJournal();
		journal.setColumn("角色管理");
		journal.setOperater("删除");
		journalMapper.insertSelective(journal);
		System.out.println("执行了删除角色的方法");
	}
	
	//样式操作栏
	@After("execution(* com.sk.ppk.dao.StyleinformationMapper.deleteByPrimaryKey(..))")
	public void logdeleteStyle(){
		Journal journal = getJournal();
		journal.setColumn("样式管理");
		journal.setOperater("删除");
		journalMapper.insertSelective(journal);
		System.out.println("执行了删除样式的方法");
	}
	@After("execution(* com.sk.ppk.dao.StyleinformationMapper.insertStyle(..))")
	public void logAddStyle(){
		Journal journal = getJournal();
		journal.setColumn("样式管理");
		journal.setOperater("添加");
		journalMapper.insertSelective(journal);
		System.out.println("执行了添加样式的方法");
	}
	
	@After("execution(* com.sk.ppk.dao.StyleinformationMapper.updateByPrimaryKeySelective(..))")
	public void logeditStyle(JoinPoint point){
		Journal journal = getJournal();
		journal.setColumn("样式管理");
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String url = request.getRequestURI();; 
		  //取得最后一个/的下标  
		  int index = url.lastIndexOf("/");  
		  //substring(int beginIndex)返回一个新的字符串，它是此字符串的一个子字符串。  
		  String newString = url.substring(index + 1);   
		if(newString.equals("style_edit")){
			journal.setOperater("编辑");
		}
		else{
			String USE = request.getParameter("USE").trim();
			if(USE.equals("启用")){
				journal.setOperater("启用");
			}
			else{
				journal.setOperater("不启用");
			}
			
		}
		journalMapper.insertSelective(journal);
	}
	// 模板操作栏
	@After("execution(* com.sk.ppk.dao.TemplateinformationMapper.insert(..))")
	public void logAddTemplate(){
		Journal journal = getJournal();
		journal.setColumn("模板管理");
		journal.setOperater("添加");
		journalMapper.insertSelective(journal);
		System.out.println("执行了添加模板的方法");
	}
	
	@After("execution(* com.sk.ppk.dao.TemplateinformationMapper.updateStatus(..))")
	public void logeditTemplate(){
		Journal journal = getJournal();
		journal.setColumn("模板管理");
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String url = request.getRequestURI();; 
		  //取得最后一个/的下标  
		  int index = url.lastIndexOf("/");  
		  //substring(int beginIndex)返回一个新的字符串，它是此字符串的一个子字符串。  
		  String newString = url.substring(index + 1);   
		if(newString.equals("template_save")){
			journal.setOperater("编辑");
		}
		else{
			String USE = request.getParameter("USE").trim();
			if(USE.equals("启用")){
				journal.setOperater("启用");
			}
			else{
				journal.setOperater("不启用");
			}
			
		}
		journalMapper.insertSelective(journal);
		System.out.println("执行了冻结模板的方法");
	}
	
	@After("execution(* com.sk.ppk.dao.TemplateinformationMapper.deleteByPrimaryKey(..))")
	public void logdeleteTemplate(){
		Journal journal = getJournal();
		journal.setColumn("模板管理");
		journal.setOperater("删除");
		journalMapper.insertSelective(journal);
		System.out.println("执行了删除模板的方法");
	}
	
	//动态操作栏
	@After("execution(* com.sk.ppk.dao.DynamicinformationMapper.insert(..))")
	public void logAddDynamic(){
		Journal journal = getJournal();
		journal.setColumn("动态管理");
		journal.setOperater("添加");
		journalMapper.insertSelective(journal);
		System.out.println("执行了添加动态的方法");
	}
	@After("execution(* com.sk.ppk.dao.DynamicinformationMapper.updateStatus(..))")
	public void logeditDynamic(){
		Journal journal = getJournal();
		journal.setColumn("动态管理");
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String url = request.getRequestURI();; 
		  //取得最后一个/的下标  
		  int index = url.lastIndexOf("/");  
		  //substring(int beginIndex)返回一个新的字符串，它是此字符串的一个子字符串。  
		  String newString = url.substring(index + 1);   
		if(newString.equals("dynamic_save")){
			journal.setOperater("编辑");
		}
		else{
			String USE = request.getParameter("USE").trim();
			if(USE.equals("启用")){
				journal.setOperater("启用");
			}
			else{
				journal.setOperater("不启用");
			}
			
		}
		journalMapper.insertSelective(journal);
		System.out.println("执行了冻结动态的方法");
	}
	
	@After("execution(* com.sk.ppk.dao.DynamicinformationMapper.deleteByPrimaryKey(..))")
	public void logdeleteDynamic(){
		Journal journal = getJournal();
		journal.setColumn("动态管理");
		journal.setOperater("删除");
		journalMapper.insertSelective(journal);
		System.out.println("执行了删除动态的方法");
	}

	private Journal getJournal(){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		String host = request.getRemoteHost();
		String operater = (String) request.getSession().getAttribute("creatuser");
		Date date = new Date();
		Journal journal = new Journal();
		journal.setIpaddress(host);
		journal.setUser(operater);
		journal.setCreatetime(date);
		return journal;
	}
	
}
