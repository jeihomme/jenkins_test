package com.iwonsoft.unit;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint(value="/unit.iwonsoft.com/unit-socket")
public class UnitSocket {
	
	private static final List<Session> sessionList=new ArrayList<Session>();
	
	public UnitSocket() {
	}
	

    public static List<Session> getSessionList() {		
        return sessionList;
    }
    
	/**
	 * 새로운 소켓을 생성한다.
	 * @param session
	 */
	@OnOpen
    public void onOpen(Session session) {	
        sessionList.add(session);	
        try {
//            final Basic basic = session.getBasicRemote();
            session.getBasicRemote().sendText("join,"+session.toString().split("@")[1]);

            String sessionStr = "";
            for(Session sessionSelect : UnitSocket.sessionList) {
        		sessionStr += ","+sessionSelect.toString().split("@")[1];
            }
            System.out.println(" session : " + session.toString().split("@")[1]);
            System.out.println(" sessionList.toString() : " + sessionList.toString());
            session.getBasicRemote().sendText("sessionList"+sessionStr);
            
        }catch (Exception e) {
        	System.out.println("#UnitSocket - onOpen - error : "+ e.getMessage());
        }
    }
	
	 /**
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self,  String message) {    	
        try {
            for(Session session : UnitSocket.sessionList) {
                if(!self.getId().equals(session.getId())) {
//                	session.getBasicRemote().sendText(message);
                	session.getBasicRemote().sendText("msg,"+session.toString().split("@")[1]);
//                    System.out.println(" sessionList.toString() : " + sessionList.toString());
//                  org.apache.tomcat.websocket.WsSession@290fbb52
//                    System.out.println(" session : " + session.toString().split("@")[1]);
                }
            }
        }catch (Exception e) {
        	System.out.println("#UnitSocket - sendAllSessionToMessage - error : "+ e.getMessage());
        }
    }
    
    /**
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("msg,"+session.toString().split("@")[1]);
//            System.out.println(" sessionList.toString() : " + sessionList.toString());

            String sessionStr = "";
            for(Session sessionSelect : UnitSocket.sessionList) {
        		sessionStr += ","+sessionSelect.toString().split("@")[1];
            }
//            System.out.println(" sessionList.toString() : " + sessionList.toString());
//            System.out.println(" session : " + session.toString().split("@")[1]);
            basic.sendText("sessionList"+sessionStr);
                    
//          org.apache.tomcat.websocket.WsSession@290fbb52
        }catch (Exception e) {
        	System.out.println("#UnitSocket - onMessage - error : "+ e.getMessage());
        }
        sendAllSessionToMessage(session, message);
    }
    
    /**
     * 에러가 발생한 경우 함수
     * @param e
     * @param session
     */
    @OnError
    public void onError(Throwable e,Session session) {        
    }
    
    /**
     * 소켓을 종료한다.
     * @param session
     */
    @OnClose
    public void onClose(Session session) {
//			basic.sendText("out,"+session.toString().split("@")[1]);
	        sessionList.remove(session);
//            System.out.println(" sessionList.toString() : " + sessionList.toString());
//            org.apache.tomcat.websocket.WsSession@290fbb52
//            System.out.println(" session : " + session.toString().split("@")[1]);
    }
}
