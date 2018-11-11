package listener;

import java.net.UnknownHostException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.java_websocket.WebSocketImpl;

import websocket.WebSocket;

public class WebContextListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("WebContextListener websocket");
		WebSocketImpl.DEBUG = false;
		int port = 18888; 
		WebSocket s = null;
		try {
			s = new WebSocket(port);
		} catch (UnknownHostException e) {
			System.out.println("erreur websocket ?");
			e.printStackTrace();
		}
		s.start();
		System.out.println("start websocket ?");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("contextDestroyed");
	}

}