package com.sk.ppk.util;

public class PathUtil {

    /**
     * @param args
     */
    public static void main(String[] args) throws Exception {
        PathUtil p = new PathUtil();
        System.out.println(p.getWebClassesPath());
        System.out.println(p.getWebInfPath());
        System.out.println(p.getWebRoot());
    }

    public String getWebClassesPath() {
        String path = getClass().getProtectionDomain().getCodeSource()
                .getLocation().getPath();
        return path;

    }

    public String getWebInfPath() throws IllegalAccessException {
        String path = getWebClassesPath();
        if (path.indexOf("WEB-INF") > 0) {
            path = path.substring(0, path.indexOf("WEB-INF") + 8);
        } else {
            throw new IllegalAccessException("路径获取错误");
        }
        return path;
    }

    public String getWebRoot() throws IllegalAccessException {
        String path = getWebClassesPath();
        if (path.indexOf("WEB-INF") > 0) {
            path = path.substring(0, path.indexOf("WEB-INF/classes"));
        } else {
            throw new IllegalAccessException("路径获取错误");
        }
        return path;
    }

    /*
	 * Java文件操作 获取文件扩展名
	 *
	 *  Created on: 2011-8-2
	 *      Author: blueeagle
     */
    public static String getExtensionName(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length() - 1))) {
                return filename.substring(dot + 1);
            }
        }
        return filename;
    }

    /*
	 * Java文件操作 获取不带扩展名的文件名
	 *
	 *  Created on: 2011-8-2
	 *      Author: blueeagle
     */
    public static String getFileNameNoEx(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length()))) {
                return filename.substring(0, dot);
            }
        }
        return filename;
    }
}
