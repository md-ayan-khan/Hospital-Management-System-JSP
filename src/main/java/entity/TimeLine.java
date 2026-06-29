package entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TimeLine {
		
	private int timelineId;
	private int patientId;
	private String eventType;
	private String title;
	private String description;
	private int referenceId;
	private Integer doctorId;
	private String eventDate;
	
	public int getPatientId() {
	    return patientId;
	}

	public void setPatientId(int patientId) {
	    this.patientId = patientId;
	}
	
		public TimeLine(String eventType, String title, String description, String eventDate) {
			super();
			this.eventType = eventType;
			this.title = title;
			this.description = description;
			this.eventDate = eventDate;
		}

	   
	}
