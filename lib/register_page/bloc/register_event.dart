part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}
  
class RegisterrEvent extends RegisterEvent {
  RegisterrEvent({
    required this.userName,
    required this.email,
    required this.mobileNumber,
    required this.password,
  });
  String userName;
  String email;
  double mobileNumber;
  String password;
}
