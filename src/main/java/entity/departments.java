package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class departments {
	private int department_id;
	private String department_name;
	private String location;

	public departments(String department_name, String location) {
		super();
		this.department_name = department_name;
		this.location = location;
	}

}
