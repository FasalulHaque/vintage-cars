part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class AddProfile extends ProfileEvent {
  AddProfile({
    required this.name,
    required this.email,
    required this.age,
    required this.image,
  });

  Future<XFile?> image;
  String name;
  String email;
  String age;
}
