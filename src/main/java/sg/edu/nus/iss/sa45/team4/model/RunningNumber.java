package sg.edu.nus.iss.sa45.team4.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="runningnumbers")
public class RunningNumber {
	
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	public int getValues() {
		return values;
	}
	public void setValues(int values) {
		this.values = values;
	}
	@Id
	private String table;
	private int values;
	
}
