import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wwater/constants.dart';
import 'package:wwater/screens/welcome.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wwater/services/wrapper.dart';
// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Wwater());
}

class Wwater extends StatelessWidget {
  const Wwater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wwater',
      theme: ThemeData(
        primaryColor: wPrimaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Wrapper(),
    );
  }
}
