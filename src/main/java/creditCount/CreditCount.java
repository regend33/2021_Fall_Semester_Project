package creditCount;

public class CreditCount {
	private String userMajor; // �а� �����ϱ����� primary key
							// ȸ�������� �� option���� value���� �а����� ����, �� ���� ���� ����
	private int CScomp; // �����ʼ�
	private int CSchoice; // ���缱��
	private int MJcomp; // �����ʼ�
	private int MJchoice; //��������
	private int MSC; // ���б���
	private int chapel; // ä��
	
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
