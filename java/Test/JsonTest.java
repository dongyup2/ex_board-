package Test;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;

import vo.Json;



public class JsonTest {
	Map<Integer, Json> map = new HashMap<>();
	
	map.put(1, new Json("id1","홍길동","hong","naver@naver","부산"));
	map.put(2, new Json("id2","심청이","sim","youtube@naver","미국"));
	map.put(3, new Json("id3","돌쇠","dol","google@naver","러시아"));
	
	JSONArray jsonArray = new JSONArray(map);
	
}
