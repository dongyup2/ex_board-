package config;

import dao.BoardDao;
import dao.ReplyDao;
import lombok.Getter;
import services.BoardService;

@Getter
public class ServletContextConfig {
	private static ServletContextConfig instance = null;
	
	/*
	 * Custom IoC (객체관리)
	 */
	
	//Repository
	private BoardDao boardDao;
	private ReplyDao replyDao;
	//Service
	private BoardService boardService;
	
	private ServletContextConfig() {}
	
	public static ServletContextConfig getInstance() {
		if(instance == null) {
			instance = new ServletContextConfig();
			instance.setIoC();
		}
		
		return instance;
	}
	
	private void setIoC() {
		if() {
			
		}
	}
	
}
