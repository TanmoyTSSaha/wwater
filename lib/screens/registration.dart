import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wwater/constants.dart';
import 'package:wwater/screens/home.dart';
import 'package:wwater/services/auth.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  // late String _password;
  final AuthServices _auth = AuthServices();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = '';
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String error = '';
  // String _password = '';
  // String _confirmPassword = '';
  bool showPassword = true;
  bool showConfirmPassword = true;

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
              child: bigText(text: 'Welcome \nUser'),
            ),
            Positioned(
              bottom: height10 * 0,
              left: height10 * 3,
              child: Container(
                padding: const EdgeInsets.all(height10 * 2),
                height: height10 * 50,
                width: height10 * 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(height10 * 2),
                    topRight: Radius.circular(height10 * 2),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        bigText(
                          text: 'Register',
                          textColor: wSecondaryColor,
                        ),
                        const SizedBox(height: height10 * 3),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person_outline),
                            iconColor: wPrimaryColor,
                            label: Text('Name'),
                            contentPadding: EdgeInsets.all(5),
                          ),
                          onChanged: (name) {
                            setState(() {
                              _name = name;
                            });
                          },
                          validator: (_name) {
                            if (_name!.isEmpty) {
                              return "Name field can't be Empty!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: height10 * 2),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person_outline),
                            iconColor: wPrimaryColor,
                            label: Text('Username'),
                            contentPadding: EdgeInsets.all(5),
                          ),
                          onChanged: (username) {
                            setState(() {
                              _username = username;
                            });
                          },
                          validator: (_username) {
                            if (_username!.isEmpty) {
                              return "Username field can't be Empty!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: height10 * 2),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.email_outlined),
                            iconColor: wPrimaryColor,
                            label: Text('Email'),
                            contentPadding: EdgeInsets.all(5),
                          ),
                          onChanged: (email) {
                            setState(() {
                              _email = email;
                            });
                          },
                          validator: (_email) =>
                              !EmailValidator.validate(_email!)
                                  ? "Enter a valid Email"
                                  : null,
                        ),
                        const SizedBox(height: height10 * 2),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          obscureText: showPassword,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                                debugPrint(showPassword.toString());
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
                          onChanged: (password) {
                            setState(() {
                              _password = password;
                            });
                          },
                          validator: (password) {
                            if (password!.length > 6) {
                              return null;
                            } else {
                              return "Password must be atleast of 6 Characters!";
                            }
                          },
                        ),
                        const SizedBox(height: height10 * 2),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          obscureText: showConfirmPassword,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showConfirmPassword = !showConfirmPassword;
                                });
                                debugPrint(showConfirmPassword.toString());
                              },
                              child: showConfirmPassword
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined),
                            ),
                            icon: Icon(Icons.key_outlined),
                            iconColor: wPrimaryColor,
                            label: Text('Confirm Password'),
                            contentPadding: EdgeInsets.all(5),
                          ),
                          validator: (confirmPassword) {
                            if (confirmPassword == _password) {
                              return null;
                            } else {
                              return "Your Password didn't matched!";
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                          child: error != null
                              ? Text(error,
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 14.0))
                              : null,
                        ),
                        const SizedBox(height: height10 * 2),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              dynamic userCredential =
                                  await _auth.registerWithEmailAndPassword(
                                      _email, _password);
                              if (userCredential == null) {
                                setState(() => error =
                                    'Please give your valid Credential!');
                              } else {
                                return;
                              }
                            }
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
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(height10 * 0.5),
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
            ),
          ],
        ),
      ),
    );
  }
}
