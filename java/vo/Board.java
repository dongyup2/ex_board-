package vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Board {
	private int bno;
	private String title; // 100
	private String content; //1000
	private String writer; // 20
	private Timestamp regdate;
	private Timestamp moddate;
	//private int cnt;
	private int replyCnt;
}
