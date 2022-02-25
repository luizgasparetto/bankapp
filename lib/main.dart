import 'package:bankapp/app/core/exports.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Registery.setUp();

  runApp(const MyApp());
}
