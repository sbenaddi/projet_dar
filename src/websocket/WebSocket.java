package websocket;

import java.net.InetSocketAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;

import model.service.UtilsService;

public class WebSocket extends WebSocketServer {

	private UtilsService utilsService = new UtilsService();
	
	
	private static final String SYSTEM_CODE = "SYS:";
	private static final String USER_CODE = "USER:";
	private static final SimpleDateFormat SF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	int j = 0;
	int h = 0;
	int e = 0;
	int l = 0;

	public WebSocket(InetSocketAddress address) {
		super(address);
		System.out.println("address : " + address);
	}

	public WebSocket(int port) throws UnknownHostException {
		super(new InetSocketAddress(port));
		System.out.println("port : " + port);
	}

	@Override
	public void onClose(org.java_websocket.WebSocket conn, int message,
			String reason, boolean remote) {
		userLeave(conn);
	}

	@Override
	public void onError(org.java_websocket.WebSocket conn, Exception message) {
		System.out.println("Socket :" + message.toString());
		e++;
	}

	@Override
	public void onMessage(org.java_websocket.WebSocket conn, String message) {
		System.out.println("onMessage:" + message);
		
		if (WebSocketPool.containConnection(conn)) {
			WebSocketPool.sendMessageToUser(
					conn, utilsService.getNotifications());
			
			/*
			 USER_CODE + "<font style='color:green'>"
							+ WebSocketPool.getUserByKey(conn) + "  "
							+ SF.format(new Date()) + "</font>" + "</br>"
							+ message
							
							
							
					USER_CODE + "<font style='color:blue'>"
							+ WebSocketPool.getUserByKey(conn) + "  "
							+ SF.format(new Date()) + "</font>" + "</br>"
							+ message
			 */
			WebSocketPool.sendMessageToOtherUsers(
					conn, utilsService.getNotifications());
		} else {
			message = message.toString();
			if (message != null) { 
				this.userjoin(message.toString(), conn);
			}
		}
	}

	@Override
	public void onOpen(org.java_websocket.WebSocket conn,
			ClientHandshake handshake) {
		System.out.println("onOpen Socket conn:" + conn);
		l++;
	}

	public void userjoin(String user, org.java_websocket.WebSocket conn) {
		String joinMsg = SYSTEM_CODE + "[msg]" + user + "msg?";
		WebSocketPool.sendMessage(joinMsg);
		WebSocketPool.addUser(user, conn); 
		WebSocketPool.sendMessage(SYSTEM_CODE + "msg"
				+ WebSocketPool.getOnlineUser().toString());
	}

	public void userLeave(org.java_websocket.WebSocket conn) {
		String user = WebSocketPool.getUserByKey(conn);
		boolean b = WebSocketPool.removeUser(conn);
		if (b) {
			String joinMsg = SYSTEM_CODE + "[msg]" + user + "msg";
			WebSocketPool.sendMessage(joinMsg);
		}
	}
}
