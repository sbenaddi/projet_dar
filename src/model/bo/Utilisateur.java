package model.bo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

@Entity
@Table(name = "USER_TABLE")
public class Utilisateur {

	@Id
	@GeneratedValue
	private int id;

	//private String firstname;
	//private String lastname;
	private String name;
	@Column(unique = true)
	private String email;
	private String password;
	private String numberphone;
	private String about;
	private String Occupation;
	private String interest;
	
	@Expose(serialize = false)
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "AVATAR_ID", nullable = true)
	private Avatar avatar;
	
	
	@Expose(serialize = false)
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user_id", cascade = CascadeType.REMOVE, orphanRemoval = true)
	private List<Annonce> annonces;
	
	@Expose(serialize = false)
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user_id", cascade = CascadeType.REMOVE, orphanRemoval = true)
	private List<Evenement> evenements;

	@Expose(serialize = false)
	@ManyToMany(mappedBy = "users_inter")
	private List<Evenement> events_inter;

	public List<Evenement> getEvenements() {
		return evenements;
	}

	public void setEvenements(List<Evenement> evenements) {
		this.evenements = evenements;
	}
	public List<Annonce> getAnnonces() {
		return annonces;
	}

	public void setAnnonces(List<Annonce> annonces) {
		this.annonces = annonces;
	}


	public List<Evenement> getEvents_inter() {
		return events_inter;
	}

	public void setEvents_inter(List<Evenement> events_inter) {
		this.events_inter = events_inter;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getOccupation() {
		return Occupation;
	}

	public void setOccupation(String occupation) {
		Occupation = occupation;
	}

	public String getNumberphone() {
		return numberphone;
	}

	public void setNumberphone(String numberphone) {
		this.numberphone = numberphone;
	}

	public Avatar getAvatar() {
		return avatar;
	}

	public void setAvatar(Avatar avatar) {
		this.avatar = avatar;
	}

}

