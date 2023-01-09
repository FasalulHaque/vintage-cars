part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}

class bookingAddEvent extends BookingEvent {
  bookingAddEvent(
      {required this.yname,
      required this.place,
      required this.number,
      required this.carName,
      required this.price});

  String yname;
  String place;
  String number;
  String carName;
  String price;
}
