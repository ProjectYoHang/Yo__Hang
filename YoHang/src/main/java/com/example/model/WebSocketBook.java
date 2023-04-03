package com.example.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Service
// serverEndpoint 어노테이션으로 웹소켓 요청을 받는 endpoint로 만듬
@ServerEndpoint("/room/{roomType}")
public class WebSocketBook {
	// 접속된 클라이언트 websocket session을 관리하는 List
	// ArrayList는 Vector와 달리 자체적으로 동기화를 지원하지 않기 때문에 여러 스레드에서 같이 여러번 들어오면 서로가 알고 있는 정보가 일치하지 않게 됨
	// 따라서, Arraylist에 동기화 기능을 지원하기 위해서 synchronizedList 메서드를 사용해서 모든 클라이언트들이 같은 정보를 받을 수 있게 함
	// 그래야, a->b, b->a 로 같은 형태의 데이터를 받을 수 있어 한 쪽이 체크했을 때 다른 한쪽도 체크되는 양방향이 가능함
	// Arraylist 동기화 지원 방법 : List list = Collections.synchronizedList(new Arraylist());
	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());
	
	// 웹소켓으로 브라우저가 접속하면 실행되는 메서드
	@OnOpen
	public void onOpen(Session userSession, @PathParam("roomType") String roomType) {
		System.out.println("open session : " + userSession.toString() + "/" + roomType);
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
		
		//String[] result = msg.split(" ", 6);
		
		//String username = result[1].substring(1, result[1].length()-1);
		//String roomNum = result[4];
		
		// 메세지를 보낸 클라이언트한테는 아무것도 안보냄 / 그외의 클라이언트들에게는 전송받은 데이터에 따라 구분해서 데이터 보냄
		// forEach문의 경우 체크해제도 잘 실행되는데 반해, 향상된 for문은 체크해제의 경우가 실행 안됨
		//for(Session session : clients) {
		// List, Map 등을 순회(Iterate)하는 메서드 : https://codechacha.com/ko/java-foreach/ 참고
		clients.forEach(session -> {	
		
			if(session == userSession) {
				//session.getBasicRemote().sendText("{\"username\":\"" + username + "\",\"checked\":\"" + roomNum + "\"}");
				return;
			} 
			else {
				try {
					// json 형태로 다시 클라이언트로 보냄
					session.getBasicRemote().sendText(msg);
					
					// 클라이언트로부터 json형태로 데이터를 체크/체크해제의 경우로 분리해서 받아오므로 구분할 필요가 없음.... => 그런 줄 알았는데 아래와 같이 if문으로 조건 분리안하면 체크해제가 안되네....
					//if(msg.contains("checked") == true) {
						//session.getBasicRemote().sendText("{\"username\":\"" + username + "\",\"checked\":\"" + roomNum + "\"}");
					//} else if(msg.contains("un") == true) {
						//session.getBasicRemote().sendText("{\"username\":\"" + username + "\",\"unchecked\":\"" + roomNum + "\"}");
					//}
					
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
	
	@OnError
	public void onError(Throwable t) {
		t.printStackTrace();
	}
}

