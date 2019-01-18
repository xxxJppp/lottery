package com.lottery.servlet;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.WsOutbound;

import com.xl.lottery.util.LotWebUtil;

public class WebSocketMessageInbound extends MessageInbound {

	//当前连接的用户名称
	private final String user;

	public WebSocketMessageInbound(String user) {
		this.user = user;
	}

	public String getUser() {
		return this.user;
	}

	//建立连接的触发的事件
	@Override
	protected void onOpen(WsOutbound outbound) {
		// 触发连接事件，在连接池中添加连接
		//JSONObject result = new JSONObject();
		//result.element("type", "user_join");
		//result.element("user", this.user);
		//向所有在线用户推送当前用户上线的消息
		//WebSocketMessageInboundPool.sendMessage(result.toString());
		
		//result = new JSONObject();
		//result.element("type", "get_online_user");
		//result.element("list", WebSocketMessageInboundPool.getOnlineUser());
		
//		Map<String, HttpSession> map = LotWebUtil.getSessionMap();
//		Set<String> keys = map.keySet();
//		for(String key:keys){
//			if(map.get(key)==null){
//				map.remove(key);
//			}
//		}
//		int sessions = map.keySet().size();
//		StringBuffer uns = new StringBuffer("");
//		for(String un : map.keySet()){
//			if(uns.length()==0){
//				uns.append(un);
//			}else{
//				uns.append(","+un);
//			}
//		}
		
		//向连接池添加当前的连接对象
		WebSocketMessageInboundPool.addMessageInbound(this);
		//WebSocketMessageInboundPool.sendMessage("onLineUserCount:"+sessions+";onLineUserNames:"+uns);
		//向当前连接发送当前在线用户的列表
		//WebSocketMessageInboundPool.sendMessageToUser(this.user, result.toString());
	}

	@Override
	protected void onClose(int status) {
		// 触发关闭事件，在连接池中移除连接
		WebSocketMessageInboundPool.removeMessageInbound(this);
		//JSONObject result = new JSONObject();
		///result.element("type", "user_leave");
		//result.element("user", this.user);
		//向在线用户发送当前用户退出的消息
		//WebSocketMessageInboundPool.sendMessage(result.toString());
	}

	@Override
	protected void onBinaryMessage(ByteBuffer message) throws IOException {
		throw new UnsupportedOperationException("Binary message not supported.");
	}

	//客户端发送消息到服务器时触发事件
	@Override
	protected void onTextMessage(CharBuffer message) throws IOException {
		//向所有在线用户发送消息
		WebSocketMessageInboundPool.sendMessage(message.toString());
	}
}