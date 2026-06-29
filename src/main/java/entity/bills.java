package entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class bills {
	private int bill_id;
    private int patient_id;
  
    private int appointment_id;
    private double total_amount;
    private String payment_status;
    private Date bill_date;
	public bills(int patient_id, int appointment_id, double total_amount, String payment_status, Date bill_date) {
		super();
		this.patient_id = patient_id;
		this.appointment_id = appointment_id;
		this.total_amount = total_amount;
		this.payment_status = payment_status;
		this.bill_date = bill_date;
	}
    
    

}
