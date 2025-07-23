import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/login_screen.dart';
import 'package:flutter_application_6/searchout.dart';
import 'package:image_picker/image_picker.dart';
class Image_pic extends StatefulWidget {
  const Image_pic({super.key});

  @override
  State<Image_pic> createState() => _Image_picState();
}

class _Image_picState extends State<Image_pic> {
  File? image;
  Future pickImage()async{
    XFile? file=await ImagePicker().pickImage(source: ImageSource.camera);
    if(image==null) return;

  }
  String imageUrl='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: IconButton(onPressed: ()async{
            ImagePicker imagepicker=ImagePicker();
            XFile? file=await imagepicker.pickImage(source: ImageSource.gallery);

            String uniqeName=DateTime.now().microsecondsSinceEpoch.toString();
            Reference referenceroot=FirebaseStorage.instance.ref();
            Reference referenceDir=referenceroot.child("image");

            Reference referenceToUpload=referenceDir.child(uniqeName);
            await referenceToUpload.putFile(File(file!.path));
            imageUrl =await referenceToUpload.getDownloadURL();
          }, icon: Icon(Icons.account_circle,size: 150,),),
        ),
          InkWell(
        onTap: ()async{
          ImagePicker imagepicker=ImagePicker();
          XFile? file=await imagepicker.pickImage(source: ImageSource.gallery);

          String uniqeName=DateTime.now().microsecondsSinceEpoch.toString();
          Reference referenceroot=FirebaseStorage.instance.ref();
          Reference referenceDir=referenceroot.child("image");

          Reference referenceToUpload=referenceDir.child(uniqeName);
          await referenceToUpload.putFile(File(file!.path));
          imageUrl =await referenceToUpload.getDownloadURL();
        },
              child:Text("Add Profile",style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 30),)),
          SizedBox(height: 30,),
          InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
          },
          child: Text("Skip",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
          ))
        ],
      ),
    );
  }
}
