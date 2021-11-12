package courseList;

public class CourseList {

	private int classCode; // 강의코드
	private String className; // 강의 제목
	private String professorName; // 교수명
	private String phoneNumber; // 휴대전화
	private String laboratory; // 연구실
	private String credit; // 학점
	private String course; //이수구분
	private String lectureOverview; // 강의개요
	private String note; // 비고
	private String userCode;
	
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	private int bbsAvailable;
		
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getProfessorName() {
		return professorName;
	}
	public void setProfessorName(String professorName) {
		this.professorName = professorName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getLaboratory() {
		return laboratory;
	}
	public void setLaboratory(String laboratory) {
		this.laboratory = laboratory;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getLectureOverview() {
		return lectureOverview;
	}
	public void setLectureOverview(String lectureOverview) {
		this.lectureOverview = lectureOverview;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getClassCode() {
		return classCode;
	}
	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}


}
