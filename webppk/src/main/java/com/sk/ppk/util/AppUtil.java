package com.sk.ppk.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.util.JSONPObject;

/** 接口参数校验
 * @author:	fsl
 * 修改日期：2015/11/2
 */
public class AppUtil
{
	/**
	 * @param pd
	 * @param map
	 * @return
	 */
	public static Object returnObject(PageData pd, Map map){
		if(pd.containsKey("callback")){
			String callback = pd.get("callback").toString();
			return new JSONPObject(callback, map);
		}else{
			return map;
		}
	}
}
