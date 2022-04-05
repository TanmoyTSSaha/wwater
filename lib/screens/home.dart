import 'package:flutter/material.dart';
import 'package:wwater/services/auth.dart';

class Home extends StatelessWidget {
  final AuthServices _auth = AuthServices();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Container(),
    );
  }
}
