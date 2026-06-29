package entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor

public class appointments {
	private int appointment_id;
	private int patient_id;
	private int doctor_id;
	private Date appointment_date;
	private String appointment_time;
	
	private String status;
	private String reason;
	public appointments(int patient_id, int doctor_id, Date appointment_date, String appointment_time, String status,
			String reason) {
		super();
		this.patient_id = patient_id;
		this.doctor_id = doctor_id;
		this.appointment_date = appointment_date;
		this.appointment_time = appointment_time;
		this.status = status;
		this.reason = reason;
	}
	
	

}
