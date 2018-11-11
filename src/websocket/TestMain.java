package websocket;

import java.net.UnknownHostException;

import org.java_websocket.WebSocketImpl;

/**
 * The test class
 * 
 * @author Roderick
 */
public class TestMain {
	public static void main(String[] args) throws InterruptedException {
		System.out.println("test websocket");
		WebSocketImpl.DEBUG = false;
		int port = 8888; 
		WebSocket s = null;
		try {
			s = new WebSocket(port);
		} catch (UnknownHostException e) {
			System.out.println("websocket erreurï¼?");
			e.printStackTrace();
		}
		s.start();
		System.out.println("websocket start");
	}
}
