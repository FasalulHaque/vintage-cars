import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:vintagecars/app/app.dart';
import 'package:vintagecars/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  bootstrap(() => const App());
}
