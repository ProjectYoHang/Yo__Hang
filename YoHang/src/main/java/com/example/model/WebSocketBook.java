package com.example.model;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Service;

@Service
//@ServerEndpoint("/book")
@ServerEndpoint("/book2")
public class WebSocketBook {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

	@OnOpen
	public void onOpen(Session s) {
		System.out.println("open session : " + s.toString());
		if(!clients.contains(s)) {
			clients.add(s);
			System.out.println("session open : " + s);
		} else {
			System.out.println("이미 연결된 session임!");
		}
	}
	
	@OnMessage
	public void onMessage(String one, Session session) throws Exception {
		System.out.println("receive message : " + one);
		for(Session s : clients) {
			System.out.println("send data : " + one);
			s.getBasicRemote().sendText(one);
		}
	}
	
	@OnClose
	public void onClose(Session s) {
		System.out.println("session close : " + s);
		clients.remove(s);
	}
}
