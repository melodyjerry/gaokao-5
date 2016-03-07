package shixun.gaokao.pojo;

public class Profession {
	private String proCode;
	private String proName;
	private String proIntroductionPage;//页面包括专业介绍和就业情况
	private int proHeat; //百分制
	
	public String getProCode() {
		return proCode;
	}
	public void setProCode(String proCode) {
		this.proCode = proCode;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProIntroductionPage() {
		return proIntroductionPage;
	}
	public void setProIntroductionPage(String proIntroductionPage) {
		this.proIntroductionPage = proIntroductionPage;
	}
	public int getProHeat() {
		return proHeat;
	}
	public void setProHeat(int proHeat) {
		this.proHeat = proHeat;
	}
	
}
