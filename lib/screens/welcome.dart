import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wwater/constants.dart';
import 'package:wwater/screens/login.dart';
import 'package:wwater/screens/registration.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //This for removing the system status bar color.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("asset/image/UI-Design.png"),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: [
            Positioned(
                left: height10 * 2,
                top: height10 * 4.5,
                child: bigText(
                  text: 'wwater',
                )),
            Positioned(
              left: height10 * 2,
              right: height10 * 2,
              bottom: height10 * 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bigText(
                    text: 'Welcome',
                    size: 40,
                  ),
                  const SizedBox(height: height10 * 0.5),
                  smallText(
                    text:
                        'We deliver water at any point of the Earth in 30 minutes',
                  ),
                  const SizedBox(height: height10 * 2),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: wSecondaryColor,
                        fontSize: height10 * 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(height10 * 0.5),
                      ),
                      minimumSize: const Size(height10 * 32, height10 * 4.5),
                    ),
                  ),
                  const SizedBox(height: height10 * 2),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Registration(),
                        ),
                      );
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height10 * 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: wSecondaryColor,
                      onPrimary: Colors.white,
                      side: const BorderSide(
                        color: Colors.white60,
                        width: height10 * 0.2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(height10 * 0.5),
                      ),
                      minimumSize: const Size(height10 * 32, height10 * 4.5),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
