import 'package:flutter/material.dart';
import 'package:flutter_application_6/AboutScreen.dart';
import 'package:flutter_application_6/Terms_service.dart';
import 'package:flutter_application_6/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0A0B),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 180),
          Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Noteit_White.png"),
              ),
            ),
          ),
          SizedBox(height: 150),
          const Text(
            "Welcome to NOTEit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Read our",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const AboutScreen()));
                  },
                  child: const Text(
                    ' Privacy policy.',
                    style:
                    TextStyle(color: Colors.blue, fontSize: 15),
                  )),
              const Text(
                'Tap on "Agree and continue"',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "to accept the",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Terms_Service()));
                  },
                  child: Text(
                    ' Terms of Service.',
                    style:
                    TextStyle(color: Colors.blue, fontSize: 15),)
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap:() {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>const login()));
                  },
                  child: Container(
                    height: 50,
                    width: 270,
                    decoration: BoxDecoration(
                        color: Color(0xff438af5),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Center(
                      child: Text("Agree and continue",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                    ),
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}