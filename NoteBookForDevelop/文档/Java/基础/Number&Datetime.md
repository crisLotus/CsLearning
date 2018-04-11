https://github.com/wxyyxc1992/ProgrammingLanguage-Series/blob/master/Java/%E5%9F%BA%E7%A1%80%E7%AF%87/%E5%9F%BA%E6%9C%AC%E7%B1%BB%E5%9E%8B/%E6%97%B6%E9%97%B4%E4%B8%8E%E6%97%A5%E6%9C%9F%E5%A4%84%E7%90%86.md

# Number
```
int i = Integer.parseInt("10");
Assert.assertEquals(10, i);

NumberFormat nf = NumberFormat.getInstance(Locale.CHINA);
Assert.assertEquals("1,234,567,890", nf.format(1234567890));
```

# Datetime
## Date, Calendar
```
Calendar.Builder builder =new Calendar.Builder();
Calendar calendar1 = builder.build();

Date date = calendar.getTime();

int year =calendar.get(Calendar.YEAR);
int month=calendar.get(Calendar.MONTH)+1;
int day =calendar.get(Calendar.DAY_OF_MONTH);
int hour =calendar.get(Calendar.HOUR_OF_DAY);
int minute =calendar.get(Calendar.MINUTE);
int seconds =calendar.get(Calendar.SECOND);
```
## SimpleDateFormat
```
Date dNow = new Date();
SimpleDateFormat ft = new SimpleDateFormat("E yyy.MM.dd 'at' hh:mm:ss a zzz");
System.out.println(ft.format(dNow));
```
