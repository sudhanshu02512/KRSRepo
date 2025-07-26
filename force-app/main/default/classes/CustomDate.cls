public class CustomDate {
	
    private static void findFirstDate(Date startDate,Date endDate,List<String> weekDays){
        DateTime myDateTime = (DateTime) startDate;
		String startDateDay = myDateTime.format('E');
		//Get Start Date Weight
    }
    
    private static void getDayWeight(String weekDay){
        
    }
    
    public static String getWeekDay(Date inputDate){
        DateTime inputDateTime = (DateTime) inputDate;
		String inputDateDay = inputDateTime.format('E');
		return inputDateDay;   
    }
}