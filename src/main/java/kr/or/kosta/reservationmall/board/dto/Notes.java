package kr.or.kosta.reservationmall.board.dto;
/**
 * Notes 쪽지 보내기 
 * @author 이혜림
 *
 */
public class Notes {

	private String id;
	private String userId;
	private String question;
	private String answer;
	private String date;
	private String checked;
	
	
	public Notes(String id, String userId, String question, String answer, String date, String checked) {
		super();
		this.id = id;
		this.userId = userId;
		this.question = question;
		this.answer = answer;
		this.date = date;
		this.checked = checked;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	
}
