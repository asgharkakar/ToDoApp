import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/login_screen.dart';
import 'utils/utlis.dart';

class signup extends StatefulWidget {
  const signup({
    super.key,
  });

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final firstnameControlor = TextEditingController();

  final lastnameControlor = TextEditingController();

  final emailControlor = TextEditingController();

  final passwordControlor = TextEditingController();
  bool loading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    emailControlor.dispose();
    passwordControlor.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff93bffe),
        title: const Text(
          "Sign up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF0C0A0B),
          ),
        ),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: firstnameControlor,
                        decoration: const InputDecoration(
                            hintText: "First Name",
                            prefixIcon: Icon(Icons.person_2_outlined)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter first name";
                          }
                          return null;
                        }),
                    TextFormField(
                        controller: lastnameControlor,
                        decoration: const InputDecoration(
                            hintText: "Last Name",
                            prefixIcon: Icon(Icons.person_add_alt_1_outlined)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter last name";
                          }
                          return null;
                        }),
                    TextFormField(
                        controller: emailControlor,
                        decoration: const InputDecoration(
                            hintText: "Email", prefixIcon: Icon(Icons.email_outlined)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter email";
                          }
                          return null;
                        }),
                    TextFormField(
                        obscureText: true,
                        controller: passwordControlor,
                        decoration: const InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password_outlined)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter password";
                          }
                          return null;
                        }),
                  ],
                )),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                _auth.createUserWithEmailAndPassword(
                  email: emailControlor.text.toString(),
                  password: passwordControlor.text.toString(),
                ).then((value) {
                  utils().toastMessage("Signed up");

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const login()),
                  );
                }).onError((error, stackTrace) {
                  utils().toastMessage(error.toString());
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff438af5)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              child: Container(
                height: 30,
                width: 100,
                child: const Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have Accout"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const login()));
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}