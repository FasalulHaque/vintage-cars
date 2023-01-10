import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is AddProfile) {
        final profile =
            FirebaseFirestore.instance.collection('profile_collection');
        final auth = FirebaseAuth.instance;
        try {
          var uuid = const Uuid();
          var profileId = uuid.v4();

          final userId = auth.currentUser!.uid;
          XFile? image = await event.image;

          final refernce = FirebaseStorage.instance
              .ref()
              .child('cars_image')
              .child(image!.name);

          final file = File(image.path);
          await refernce.putFile(file);
          final imagelink = await refernce.getDownloadURL();
          await profile.doc(profileId).set({
            'name': event.name,
            'email': event.email,
            'age': event.age,
            'booking_id': profileId,
            'user_id': userId,
            'image': imagelink,
          });

          emit(ProfileAddSucess());
        } catch (e) {
          emit(ProfileAddFiled());
        }
      }
    });
  }
}
