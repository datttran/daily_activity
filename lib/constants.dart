import 'dart:convert';

DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);
List<String> dateFormatter(DateTime date) {
  dynamic dayData = '{ "1" : "Monday", "2" : "Tuesday", "3" : "Wednesday", "4" : "Thursday", "5" : "Friday", "6" : "Saturday", "7" : "Sunday" }';

  dynamic monthData =
      '{ "1" : "January", "2" : "February", "3" : "March", "4" : "April", "5" : "May", "6" : "June", "7" : "July", "8" : "August", "9" : "September", "10" : "October", "11" : "November", "12" : "December" }';
  var result;

  return [json.decode(dayData)['${date.weekday}'], date.day.toString(), json.decode(monthData)['${date.month}'], date.year.toString()];
}

List<String> dateFormat = dateFormatter(DateTime.now());

//String user = 'Unknown';
String user = 'Dat';
