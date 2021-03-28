package marks;

import java.util.ArrayList;
import java.util.TreeMap;

public class Disciplin {
	public String name;
	public DisciplinSemester semester1 = new DisciplinSemester();
	public DisciplinSemester semester2 = new DisciplinSemester();
	
	public Disciplin(String name) {
		this.name = name;
	}
	
	public void addMark(float value, float ratio, int semester, boolean isSemestrial) {
		if(semester == 1) {
			if(isSemestrial) {
				semester1.setSemestrial(value);
			}
			else {
				semester1.addMark(value, ratio);
			}
		}
		else if(semester == 2) {
			if(isSemestrial) {
				semester2.setSemestrial(value);
			}
			else {
				semester2.addMark(value, ratio);
			}
		}
		
	}
	
	public float calculateYearAverage() {
		float av1 = this.semester1.calculateAverage();
		float av2 = this.semester2.calculateAverage();
		
		if(av1 == 0) {
			return av2;
		}
		else if(av2 == 0) {
			return av1;
		}
		else {
			return (av1+av2)/2;
		}
	}

}
