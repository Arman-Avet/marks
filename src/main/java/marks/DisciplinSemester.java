package marks;

import java.util.ArrayList;

public class DisciplinSemester {
	
	ArrayList<Mark> marks = new ArrayList<Mark>();
	Float semestrial = null;
	
	public void setSemestrial(Float value) {
		this.semestrial = value;
	}
	
	public void addMark(float value, float ratio) {
		this.marks.add(new Mark(value, ratio));
	}
	
	public Float calculateAverage() {
		float marksSum = 0;
		float marksCount = 0;
		for (Mark mark : marks) {
			marksSum += mark.value*mark.ratio;
			marksCount += mark.ratio;
		}
		if(marksCount>0) {
		
			float marksAvg = marksSum/marksCount;
			float result = 0;
			if(semestrial!=null) {
				result = (marksAvg +semestrial)/2;
			}
			else {
				result = marksAvg;
			}
			return result;
		}
		else {
			return (float)0;
		}
	}
}
