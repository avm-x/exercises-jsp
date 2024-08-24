package beans;

import java.io.Serializable;

public class BeanEx7 implements Serializable {
	private String music;
	
	public BeanEx7() {
		this.music = "Corridos Belicos";
	}
	
	public void setMusic(String musicValue) {
		this.music = musicValue;
	}
	
	public String getMusic() {
		return this.music;
	}
}
