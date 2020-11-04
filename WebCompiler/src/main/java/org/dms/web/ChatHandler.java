package org.dms.web;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.dms.web.domain.ChatVO;
import org.dms.web.domain.CommentsVO;
import org.dms.web.service.ChatService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;



@Controller
public class ChatHandler extends TextWebSocketHandler {
	//세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    @Autowired
    private ChatService chatService;

    private static Logger logger = LoggerFactory.getLogger(ChatHandler.class);

    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        logger.info("{} 연결됨", session.getId()); 
    }

    
    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
  
        ObjectMapper objectMapper = new ObjectMapper();
        ChatVO vo = objectMapper.readValue(message.getPayload(), ChatVO.class);

        vo.setChat_date(Timestamp.valueOf(LocalDateTime.now()));
        vo.setChat_content(vo.getChat_content().replace("<br>", "\r\n"));
        chatService.insertChat(vo);

        String chatJson = objectMapper.writeValueAsString(vo);
        //모든 유저에게 메세지 출력
        for(WebSocketSession sess : sessionList){
        	sess.sendMessage(new TextMessage(chatJson));   
        }
    }

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        logger.info("{} 연결 끊김.", session.getId());
    }
    

}