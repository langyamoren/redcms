package com.redcms.web.tld;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTag;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;
import org.apache.log4j.Logger;
import com.redcms.beans.Channel;
import com.redcms.beans.Content;
import com.redcms.util.HtmlRegexpUtil;
public class PropertyTag extends TagSupport 
{
	private static final Logger log=Logger.getLogger(PropertyTag.class);
	private static final long serialVersionUID = 3596208178831679851L;

    private String name;
    private String format;
    private int maxSize;
	@Override
	public int doStartTag() throws JspException 
	{
		return BodyTag.SKIP_BODY;
	}
	@Override
	public int doEndTag() throws JspException 
	{
		Tag parent=this.getParent();
		String result=null;
		if(parent instanceof ChannelListTag)
		{
			ChannelListTag clt=(ChannelListTag)parent;
			Channel item=clt.getItem();
			if(null!=item)
			{
                result=getValue(item);
			}
		}
		if(parent instanceof ArtListTag)
		{
			ArtListTag at=(ArtListTag)parent;
			Content item=at.getItem();
			if(null!=item)
			{
                result=getValue(item);
			}
		}
		
		if(maxSize>0)
		{
			result=HtmlRegexpUtil.getDesc(result, maxSize);
		}
		
		
		try {
			if(null!=format&&!"".equals(format))
			{
				SimpleDateFormat sf=new SimpleDateFormat(format);
			   
				pageContext.getOut().write(sf.format(sf.parse(result))); 
			}else
			{
			pageContext.getOut().write(result);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return BodyTag.EVAL_PAGE;
	}

	public String getValue(Object item)
	{
		String result=null;
		try 
		{
			String mname="get"+(char)(name.toCharArray()[0]-32)+name.substring(1);
			Method method=item.getClass().getMethod(mname, new Class[]{});
			if(null!=method&&null!=item)
			{
				Object values=method.invoke(item, new Object[]{});
				if(null!=values)result=values.toString();else result="";
			}
		}catch (Exception e) {
		   log.error("È¡ÊôÐÔ³ö´í...");
		}
		return result;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	public int getMaxSize() {
		return maxSize;
	}
	public void setMaxSize(int maxSize) {
		this.maxSize = maxSize;
	}
  
}
