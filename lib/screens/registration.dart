import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wwater/constants.dart';
import 'package:wwater/screens/welcome.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  // late String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
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
                          validator: (_name) {
                            if (_name!.isEmpty) {
                              return "Name field can't be Empty!";
                            } else if (_name.length >= 3 &&
                                _name.length <= 30) {
                              return "Please enter a valid Name";
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
                          controller: _password,
                          validator: (password) {
                            if (password!.length > 6) {
                              return null;
                            } else {
                              return "Password must be greater than 6 Characters!";
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
                          controller: _confirmPassword,
                          validator: (confirmPassword) {
                            if (confirmPassword == _password) {
                              return null;
                            } else {
                              return "Your Password didn't matched!";
                            }
                          },
                        ),
                        const SizedBox(height: height10 * 4),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Welcome(),
                                ),
                              );
                            } else {
                              return;
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
