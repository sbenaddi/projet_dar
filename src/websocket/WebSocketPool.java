package websocket;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.java_websocket.WebSocket;

public class WebSocketPool {
	private static final Map<WebSocket, String> userconnections = new HashMap<WebSocket, String>();
	private static final List<String> onlineUsers = new ArrayList<>();

	public static String getUserByKey(WebSocket conn) {
		return userconnections.get(conn);
	}

	public static int getUserCount() {
		return userconnections.size();
	}

	public static WebSocket getWebSocketByUser(String user) {
		Set<WebSocket> keySet = userconnections.keySet();
		synchronized (keySet) {
			for (WebSocket conn : keySet) {
				String cuser = userconnections.get(conn);
				if (cuser.equals(user)) {
					return conn;
				}
			}
		}
		return null;
	}

	public static boolean containUser(String user) {
		return onlineUsers.contains(user);
	}

	public static void addUser(String user, WebSocket conn) {
		userconnections.put(conn, user); 
		onlineUsers.add(user);
	}

	public static Collection<String> getOnlineUser() {
		List<String> setUsers = new ArrayList<String>();
		Collection<String> setUser = userconnections.values();
		for (String u : setUser) {
			setUsers.add(u);
		}
		return setUsers;
	}

	public static boolean removeUser(WebSocket conn) {
		if (userconnections.containsKey(conn)) {
			userconnections.remove(conn);// 移除连接
			onlineUsers.remove(userconnections.get(conn));
			return true;
		} else {
			return false;
		}
	}

	public static void sendMessageToUser(WebSocket conn, String message) {
		if (null != conn) {
			conn.send(message);
		}
	}

	public static void sendMessageToOtherUsers(WebSocket conn, String message) {
		Set<WebSocket> keySet = userconnections.keySet();
		synchronized (keySet) {
			for (WebSocket connTmp : keySet) {
				if (conn == connTmp) {
					continue;
				}
				String user = userconnections.get(connTmp);
				if (user != null) {
					connTmp.send(message);
				}
			}
		}
	}

	public static void sendMessage(String message) {
		Set<WebSocket> keySet = userconnections.keySet();
		synchronized (keySet) {
			for (WebSocket conn : keySet) {
				String user = userconnections.get(conn);
				if (user != null) {
					conn.send(message);
				}
			}
		}
	}

	public static void forceOffLine(String username) {
		if (onlineUsers.contains(username)) {
			for (Map.Entry<WebSocket, String> entry : userconnections
					.entrySet()) {
				if (username.equals(entry.getValue())) {
					entry.getKey().closeConnection(30001, "closeConnection");
					break;
				}
			}
		}
	}

	public static boolean containConnection(WebSocket conn) {
		return userconnections.containsKey(conn);
	}
}
