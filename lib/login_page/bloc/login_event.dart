part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LoginnEvent extends LoginEvent {
  LoginnEvent({
    required this.email,
    required this.password
  });


  String email;
  String password;
}
