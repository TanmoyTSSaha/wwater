import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wwater/services/user.dart';
import 'package:wwater/screens/home.dart';
import 'authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    print(user);

    // return user == null ? const Authenticate() : Home();
    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
