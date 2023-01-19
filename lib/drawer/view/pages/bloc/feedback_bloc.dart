import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(FeedbackInitial()) {
    on<FeedbackEvent>((event, emit) async {
      if (event is FeedbackAddEvent) {
        try {
          final auth = FirebaseAuth.instance;
          final Feedback =
              FirebaseFirestore.instance.collection('Feedback_collection');
          final userId = auth.currentUser!.uid;

          var uuid = const Uuid();

          await Feedback.doc(userId).set({
            'feedback': event.feedback,
          });
        } catch (e) {}
      }
    });
  }
}
