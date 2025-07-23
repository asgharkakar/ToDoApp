import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/searchout.dart';
import 'package:flutter_application_6/singup_screen.dart';
import 'utils/utlis.dart';

class login extends StatefulWidget {
  const login({
    super.key,
  });

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final dataBaseRef = FirebaseDatabase.instance.ref("NameTable");

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
          "Login",
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
                _auth.signInWithEmailAndPassword(
                  email: emailControlor.text.toString(),
                  password: passwordControlor.text.toString(),
                ).then((value) {
                  utils().toastMessage("Logged in");
                  final name = "difneUsername";
                  dataBaseRef.child(name).set({
                    'Email': emailControlor.text.toString(),
                  }).then((value) {}).onError((error, stackTrace) {
                    utils().toastMessage(error.toString());
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const outPutScrean()),
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
                    "Login",
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
                const Text("Create an Account"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const signup()));
                    },
                    child: const Text("Sign up",style: TextStyle(color: Colors.blue),))
              ],
            )
          ],
        ),
      ),
    );
  }
}