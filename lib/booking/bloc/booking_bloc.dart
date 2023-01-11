import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<BookingEvent>((event, emit) async {
      if (event is bookingAddEvent) {
        try {
          final auth = FirebaseAuth.instance;
          const uuid = Uuid();
          final bookingId = uuid.v4();
          final booking =
              FirebaseFirestore.instance.collection('booking_collection');
          final userId = auth.currentUser!.uid;

          await booking.doc(bookingId).set({
            'cars_name': event.carName,
            'cars_price': event.price,
            'user_color': event.color,
            'fund': event.fund,
            'your_name': event.yname,
            'cars_place': event.place,
            'contact_number': event.number,
            'image': event.image,
            'user_id': userId,
            'bookingId': bookingId
          });
          emit(BookingAddSucess());
        } catch (e) {
          emit(BookingAddFiled());
        }
      }
    });
  }
}
