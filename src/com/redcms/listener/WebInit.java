package com.redcms.listener;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


/**
 * Application Lifecycle Listener implementation class WebInit
 *
 */
@WebListener
public class WebInit implements ServletContextListener {
    ServletContext sc=null;

    public WebInit() {}

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)
    {
    	sc=sce.getServletContext();
    
    	
    	
    	//ModelDao modelDao=(ModelDao)DaoFactory.getDao(ModelDao.class);
    	//sc.setAttribute("modelDao",modelDao);
    	Properties info=new Properties();
    	try {
			info.loadFromXML(new FileInputStream(sc.getRealPath("WEB-INF/info.xml")));
		} catch (InvalidPropertiesFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	sc.setAttribute("webinfo", info);
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {}
	
}
