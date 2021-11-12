package creditCount;

public class CreditCount {
	private String userMajor; // 학과 구별하기위한 primary key
							// 회원가입할 때 option으로 value값을 학과별로 지정, 그 값을 통해 구별
	private int CScomp; // 교양필수
	private int CSchoice; // 교양선택
	private int MJcomp; // 전공필수
	private int MJchoice; //전공선택
	private int MSC; // 공학기초
	private int chapel; // 채플
	
	public String getUserMajor() {
		return userMajor;
	}
	public void setUserMajor(String userMajor) {
		this.userMajor = userMajor;
	}
	public int getCScomp() {
		return CScomp;
	}
	public void setCScomp(int cScomp) {
		CScomp = cScomp;
	}
	public int getCSchoice() {
		return CSchoice;
	}
	public void setCSchoice(int cSchoice) {
		CSchoice = cSchoice;
	}
	public int getMJcomp() {
		return MJcomp;
	}
	public void setMJcomp(int mJcomp) {
		MJcomp = mJcomp;
	}
	public int getMJchoice() {
		return MJchoice;
	}
	public void setMJchoice(int mJchoice) {
		MJchoice = mJchoice;
	}
	public int getMSC() {
		return MSC;
	}
	public void setMSC(int mSC) {
		MSC = mSC;
	}
	public int getChapel() {
		return chapel;
	}
	public void setChapel(int chapel) {
		this.chapel = chapel;
	}
	
}
