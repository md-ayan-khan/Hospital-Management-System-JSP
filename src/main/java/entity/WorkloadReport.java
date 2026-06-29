package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WorkloadReport {
	    private String departmentName;
	    private int totalDoctors;
	    private int totalPatients;
}
