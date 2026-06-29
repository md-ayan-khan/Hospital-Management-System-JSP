package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class patients {
	private int id;
	private String name;
	private String gender;
	private int age;
	private String phone;
	private String address;
	private String blood_group;
	
	public patients(String name, String gender, int age, String phone, String address, String blood_group) {
		super();
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.address = address;
		this.blood_group = blood_group;
	}
	
	
	


}
