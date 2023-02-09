package com.example.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Service;

@Service
//@ServerEndpoint("/book")
// serverEndpoint 어노테이션으로 웹소켓 요청을 받는 endpoint로 만듬
@ServerEndpoint("/book2")
public class WebSocketBook {
	// 접속된 클라이언트 websocket session을 관리하는 List
	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());
	
	// 웹소켓으로 브라우저가 접속하면 실행되는 메서드
	@OnOpen
	public void onOpen(Session userSession) {
		System.out.println("open session : " + userSession.toString());
		if(!clients.contains(userSession)) {
			// 클라이언트가 접속하면 websocket 세션을 List에 저장
			clients.add(userSession);
			System.out.println("session open : " + userSession);
		} else {
			System.out.println("이미 연결된 session임!");
		}
	}
	
	// 웹소켓으로 메세지가 오면 실행되는 메서드
	@OnMessage
	public void onMessage(String msg, Session userSession) throws Exception {
		System.out.println("클라이언트로부터 받은 메세지 : " + msg);
		
		String[] result = msg.split(" ", 6);
		
		String username = result[1].substring(1, result[1].length()-1);
		String roomNum = result[4];
		
		// 메세지를 보낸 클라이언트한테는 아무것도 안보냄 / 그외의 클라이언트들에게는 전송받은 데이터에 따라 구분해서 데이터 보냄
		//for(Session session : clients) {
		clients.forEach(session -> {	
		
			if(session == userSession) {
				//session.getBasicRemote().sendText("{\"username\":\"" + username + "\",\"checked\":\"" + roomNum + "\"}");
				return;
			} 
			else {
				try {
					// json 형태로 다시 클라이언트로 보냄
					if(msg.contains("checked") == true) {
						session.getBasicRemote().sendText("{\"username\":\"" + username + "\",\"checked\":\"" + roomNum + "\"}");
					} else if(msg.contains("un") == true) {
						session.getBasicRemote().sendText("{\"username\":\"" + username + "\",\"unchecked\":\"" + roomNum + "\"}");
					}
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		});
		
	}
	
	@OnClose
	public void onClose(Session userSession) {
		System.out.println("session close : " + userSession);
		clients.remove(userSession);
	}
	
	
}
