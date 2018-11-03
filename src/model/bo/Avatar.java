package model.bo;

import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "AVATAR")
public class Avatar {

	@Id
	@GeneratedValue
	private long id;

	@Column(name = "NAME")
	private String name;

	@Lob
    @Column(name="IMAGE", nullable=false, columnDefinition="mediumblob")
	private byte[] image;

	public Avatar() {
		super();
	}

	public Avatar(String name, byte[] image) {
		super();
		this.name = name;
		this.image = image;
	}
	
	public String getBase64Image() {
		return Base64.getEncoder().encodeToString(image);
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

}
