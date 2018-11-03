package model.bo;

import java.util.Base64;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Entity;

@Entity
@Table(name = "PHOTO_TABLE")
public class Photo {

	@Id
	@GeneratedValue
	private int id;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "annonce_id", referencedColumnName = "id", nullable = false)
	private Annonce annonce_id;
    @Column(name="base64Image", nullable=false, columnDefinition="longtext")

	private String base64Image;
	
	public Photo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Photo(byte[] image, Annonce annonce_id) {
		super();
		this.annonce_id = annonce_id;
		base64Image = Base64.getEncoder().encodeToString(image);

	}
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}

	public String getBase64Image() {
		return base64Image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	public Annonce getAnnonce_id() {
		return annonce_id;
	}

	public void setAnnonce_id(Annonce annonce_id) {
		this.annonce_id = annonce_id;
	}

}
