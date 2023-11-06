class Flight
{
  final String companyname;
  final String from;
  final String to;
  final int day;
  final int month;
  final int year;
  final String seattype;
  final int period;
  final int takeofftime;
  final int landtime;
  final int price;
  final String coupon;

  Flight ({
    required this.companyname, required this.takeofftime, required this.landtime, required this.price, required this.year, required this.coupon,required this.day,required this.from,required this.month,required this.period,required this.seattype,required this.to
  });
}