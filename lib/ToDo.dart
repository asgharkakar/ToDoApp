import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_6/utils/utlis.dart';
import 'package:flutter_application_6/searchout.dart';

class ToDO extends StatefulWidget {
  const ToDO({super.key});

  @override
  State<ToDO> createState() => _ToDOState();
}

class _ToDOState extends State<ToDO> {
  final auth = FirebaseAuth.instance;
  final username = TextEditingController();
  final name = TextEditingController();

  final dataBaseRef = FirebaseDatabase.instance.ref("posts");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff93bffe),
          title: const Text(
            "Add Note",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF0C0A0B),
            ),
          ),centerTitle: true,
        ),
        backgroundColor: Color(0xFF0C0A0B),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Noteit_White.png"),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: "Title",
                    hintStyle: TextStyle(color: Color(0xff484848)),
                  ),
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: "Description",
                    hintStyle: TextStyle(color: Color(0xff484848)),
                  ),
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Color(0xff438af5),
                ),
                height: 50,
                width: 200,
                child: TextButton(
                    onPressed: () {
                      final id = DateTime.now().microsecondsSinceEpoch;
                      final Time = DateTime.now().toString().substring(0,16);
                      dataBaseRef.child(id.toString()).set({
                        'addtodo': name.text.toString(),
                        'description': username.text.toString(),
                        'id': id.toString(),
                        'time':Time.toString()
                      }).then((value) {
                        utils().toastMessage("Added your Note");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const outPutScrean()));
                      }).onError((error, stackTrace) {
                        utils().toastMessage(error.toString());
                      });
                    },
                    child: const Center(
                      child: Text(
                        "Add Note",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )),
              ),
            ],
          ),
        )
    );
  }
}