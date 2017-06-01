package com.redcms.web.tld;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.Properties;
import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTag;
import javax.servlet.jsp.tagext.TagSupport;
import com.redcms.beans.Content;
import com.redcms.dao.ContentDao;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.dao.core.DaoFactory;
import com.redcms.page.PageDiv;

public class ArtListTag extends TagSupport 
{
	private static final long serialVersionUID = -6434916795473121496L;
    
	private int channelId; //类别id
	private boolean page=false;//是否分页
	private String orderby;//排序
	private int top;//取前几条
	private int from;
	private String model;
	private int pageNo;
	private int pageSize;
	private String sql;
	private Iterator<Content> it=null;
	private Content item=null;
	private PageDiv<Content> pd=null;
	
	@Override
	public int doAfterBody() throws JspException 
	{

		if(null!=it&&it.hasNext())
		{
			item=it.next();
			it.remove();
			return BodyTag.EVAL_BODY_AGAIN;
		}else
		{
			return BodyTag.SKIP_BODY;
		}
		
		
	}

	@Override
	public int doEndTag() throws JspException 
	{
		sql=null;
		channelId=0;
		model=null;
		orderby=null;
		top=0;
		pageNo=0;
		pageSize=0;
		it=null;
		item=null;
		pd=null;
		from=0;
		return BodyTag.EVAL_PAGE;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int doStartTag() throws JspException 
	{
	     pd=(PageDiv<Content>)this.pageContext.getAttribute("pd",PageContext.REQUEST_SCOPE);
	     if(null!=pd&&null!=pd.getList()&&pd.getList().size()>0)
	     {
	    	 it=pd.getList().iterator();
	     }else
	     {
				 int pageNo=1;
			     String sno=this.pageContext.getRequest().getParameter("pageNo");
				 if(null!=sno&&!"".equals(sno)&&sno.matches("\\d+"))
				 {
					 pageNo=Integer.parseInt(sno);
				 }
				
				//如果没有设置分页的话
				if(pageSize==0)
				{
					ServletContext sc=this.pageContext.getServletContext();
					Properties p=(Properties)sc.getAttribute("webinfo");
					String re=null;
					if(null!=p)
					{
						re=p.getProperty("pageSize");
					    pageSize=Integer.parseInt(re);
					}
				}
				
				ContentDao cd=(ContentDao)DaoFactory.getDao(ContentDao.class);
				if(null==sql||"".equals(sql.trim()))
				{
					if(getChannelId()>0)
					{
						sql="select t.name channelName,t.path path,c.* from "+model+" c,channel t where t.id=c.channel_id and c.channel_id="+channelId;
					}else
					{
						sql="select t.name channelName,t.path path,c.* from "+model+" c,channel t where t.id=c.channel_id";
					}
					if(null!=orderby&&!"".equals(orderby.trim()))
					{
						sql=sql+" order by c."+orderby;
					}else
					{
						sql=sql+" order by c.id desc";
					}
					if(top>0&&page==false)
					{
						sql=sql+" limit "+from+","+top;
					}
				}
				try 
				{
					if(page==false)
					{
						//sql=sql+" limit "+(pageNo-1)*pageSize+","+pageSize+"";
						it=cd.getAll(Content.class, sql, new Object[]{}).iterator();
					}else
					{
						 pd= cd.getByPage(Content.class, sql, pageNo, pageSize, new Object[]{});
						this.pageContext.setAttribute("pd", pd,PageContext.REQUEST_SCOPE);
						it=pd.getList().iterator();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally
				{
					ConnectionManager.getInstance().closeConnection();
				}
	    }
		
		if(null!=it&&it.hasNext())
		{
			item=it.next();
			return BodyTag.EVAL_BODY_INCLUDE;
		}else
		{
			return BodyTag.SKIP_BODY;
		}
	}

	public int getChannelId() {
		return channelId;
	}

	public void setChannelId(int channelId) {
		this.channelId = channelId;
	}

	public boolean isPage() {
		return page;
	}

	public void setPage(boolean page) {
		this.page = page;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public int getTop() {
		return top;
	}

	public void setTop(int top) {
		this.top = top;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public Iterator<Content> getIt() {
		return it;
	}

	public void setIt(Iterator<Content> it) {
		this.it = it;
	}

	public Content getItem() {
		return item;
	}

	public void setItem(Content item) {
		this.item = item;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public PageDiv<Content> getPd() {
		return pd;
	}

	public void setPd(PageDiv<Content> pd) {
		this.pd = pd;
	}

	public int getFrom() {
		return from;
	}

	public void setFrom(int from) {
		this.from = from;
	}

	
}
