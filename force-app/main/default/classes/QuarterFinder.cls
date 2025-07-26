public class QuarterFinder {
	public static Integer getQuarterFromDate(Date inputDate) {
        Integer month = inputDate.month();
        return (Integer) Math.ceil(month / 3.0);
    }
}