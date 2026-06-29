package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class doctors {
	private int doctor_id;
	private String doctor_name;
	private String  specialization;
	private String phone;
	private String email;
	private int department_id;
	public doctors(String doctor_name, String specialization, String phone, String email, int department_id) {
		super();
		this.doctor_name = doctor_name;
		this.specialization = specialization;
		this.phone = phone;
		this.email = email;
		this.department_id = department_id;
	}

	
}
