import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wwater/constants.dart';
import 'package:wwater/screens/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wwater/services/auth.dart';
import 'package:wwater/services/user.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  bool showPassword = true;

  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
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
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: height10,
              top: height10 * 4,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: height10 * 2,
              top: height10 * 4.1,
              child: bigText(text: 'wwater'),
            ),
            Positioned(
              left: height10 * 2,
              top: height10 * 15,
              child: bigText(text: 'Welcome \nBack!'),
            ),
            Positioned(
              bottom: height10 * 0,
              left: height10 * 3,
              child: Container(
                padding: const EdgeInsets.all(height10 * 2),
                height: height10 * 41,
                width: height10 * 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(height10 * 2),
                    topRight: Radius.circular(height10 * 2),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      bigText(
                        text: 'Login',
                        textColor: wSecondaryColor,
                      ),
                      const SizedBox(height: height10 * 4),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person_outline),
                          iconColor: wPrimaryColor,
                          label: Text('Email'),
                          contentPadding: EdgeInsets.all(5),
                        ),
                        onChanged: (_email) {
                          setState(() => email = _email);
                        },
                        validator: (_email) => !EmailValidator.validate(_email!)
                            ? "Enter valid Email!"
                            : null,
                      ),
                      const SizedBox(height: height10 * 2),
                      TextFormField(
                        obscureText: showPassword,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  showPassword = !showPassword;
                                },
                              );
                            },
                            child: showPassword
                                ? const Icon(Icons.visibility_outlined)
                                : const Icon(Icons.visibility_off_outlined),
                          ),
                          icon: const Icon(Icons.key_outlined),
                          iconColor: wPrimaryColor,
                          label: const Text('Password'),
                          contentPadding: const EdgeInsets.all(5),
                        ),
                        onChanged: (_passsword) {
                          setState(() => password = _passsword);
                        },
                        validator: (_password) {
                          if (_password!.length < 6) {
                            return "Password must be atleast of 6 \nCharacters.";
                          } else if (_password.isEmpty) {
                            return "Password can't be Empty!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: height10 * 2),
                      Align(
                        alignment: Alignment.centerRight,
                        child: smallText(
                          text: 'Forget Password?',
                          textColor: wSecondaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: error != null
                            ? Text(error,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 12.0))
                            : null,
                      ),
                      const SizedBox(height: height10 * 2),
                      const SizedBox(height: height10 * 2),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic userCredential = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (userCredential == null) {
                              setState(() => error =
                                  "Couldn't Sign In with these Credentials!");
                            }
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: height10 * 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: wSecondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(height10 * 0.5),
                          ),
                          minimumSize:
                              const Size(height10 * 32, height10 * 4.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> signIn(String emailController, String passwordController) async {
  //   try {
  //     if (_formKey.currentState!.validate()) {
  //       return await _auth
  //           .signInWithEmailAndPassword(
  //               email: emailController, password: passwordController)
  //           .then(
  //             (uid) => {
  //               Fluttertoast.showToast(msg: "Login Successful!"),
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => const Home(),
  //                 ),
  //               ),
  //             },
  //           );
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //       msg: e.toString(),
  //     );
  //     return;
  //   }
  // }
}
