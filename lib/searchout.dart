import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/AboutScreen.dart';
import 'package:flutter_application_6/Terms_service.dart';
import 'package:flutter_application_6/ToDo.dart';
import 'package:flutter_application_6/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'utils/utlis.dart';
import 'dart:io';



class outPutScrean extends StatefulWidget {
  const outPutScrean({super.key});

  @override
  State<outPutScrean> createState() => _outPutScreanState();
}

class _outPutScreanState extends State<outPutScrean> {

  File? image;
  String imageUrl='';

  final fullname = FirebaseDatabase.instance.ref("NameTable");
  final ref = FirebaseDatabase.instance.ref("posts");
  final searchFilter = TextEditingController();
  final editControler = TextEditingController();
  final DiseditControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0C0A0B),
      appBar: AppBar(
        backgroundColor: const Color(0xff93bffe),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            PopupMenuButton(
                icon: const Icon(Icons.menu),
                itemBuilder: (context)=>[
                  PopupMenuItem(
                    value: 1,
                    child: Expanded(
                      child: Container(

                          child: Column(


                            children: [

                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(imageUrl),

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
                                  child: const Text("Profile")),

                              const SizedBox(
                                height: 20,
                              ),
                              
                              Container(
                                height: 25,

                                child: Expanded(
                                  child: FirebaseAnimatedList(query: fullname,
                                      itemBuilder: (context, snapshot, animation, index) {

                                        final Email=snapshot.child('Email').value.toString();
                                        return Card(
                                          child: Text(Email,style: const TextStyle(fontSize: 15,
                                              fontWeight: FontWeight.bold),),
                                        );
                                      }),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              InkWell(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AboutScreen()));

                              },
                                child: const Text("Privicy Policy",style: TextStyle(color: Colors.blue),),),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Terms_Service()));


                              },
                                child: const Text("Terms Service",style: TextStyle(color: Colors.blue),),),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(onTap: (){

                              },
                                child: const Text("Help",style: TextStyle(color: Colors.blue),),),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                                },
                                child: Text("Log out",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,

                                  ),),
                              )

                            ],
                          ),
                        ),
                    ),

                  )
                ]),
            Center(child: Title(color: Color(0xFF0C0A0B), child: const Text("NoteIt")))
          ],
        ),

      ),
      body: Column(children: [

        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextFormField(
              controller: searchFilter,
              cursorColor: Colors.white70,

              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search,color: Colors.white,),
                  hintText: "   search Note ...",
                  hintStyle: const TextStyle(color: Colors.white,fontSize: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                          color: Colors.white70

                      )
                  )),
              style:
              const TextStyle(fontSize: 20.0, color: Colors.white,),
              onChanged: (String value) {
                setState(() {});
              }),
        ),
        SizedBox(
          height: 25,
        ),
        Expanded(
          child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {

                final title = snapshot.child('addtodo').value.toString();
                final description= snapshot.child('description').value.toString();
                final titl = snapshot.child('id').value.toString();
                final Timeedit= snapshot.child('time').value.toString();
                if (searchFilter.text.isEmpty) {
                  return Card(child: ListTile(


                      contentPadding: const EdgeInsets.only(left: 50),
                      leading: CircleAvatar(
                        child: Text(
                          snapshot.child('addtodo').value.toString().substring(0,1),
                          style: const TextStyle(fontSize: 30, color: Color(0xff438af5)),
                        ),
                      ),

                      title: Text(
                        snapshot.child('addtodo').value.toString(),
                        style: const TextStyle(fontSize: 30, color: Color(0xff438af5)),
                      ),

                      subtitle:
                      ListTile(
                        title: Text(
                          snapshot.child('description').value.toString(),
                          style: const TextStyle(
                              fontSize: 20
                          ),
                        ),
                        subtitle: Text(
                          snapshot.child('time').value.toString(),
                          style: const TextStyle(
                              fontSize: 20
                          ),) ,
                      ),


                      trailing: PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    showMydialog(title, titl,description);
                                  },
                                  leading: const Icon(Icons.edit),
                                  title: const Text('edit'),
                                )),

                            PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    ref.child(titl).remove();

                                  },
                                  leading: const Icon(Icons.delete),
                                  title: const Text('Delete'),
                                )  )
                          ])


                  ));
                } else if (title
                    .toLowerCase()
                    .contains(searchFilter.text.toLowerCase().toLowerCase())) {
                  return Card(
                    child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            snapshot.child('addtodo').value.toString().substring(0,1),
                            style: const TextStyle(fontSize: 30, color: Color(0xff438af5)),
                          ),
                        ),
                        title: Text(
                          snapshot
                              .child('addtodo')
                              .value
                              .toString(),
                          style: const TextStyle(fontSize: 30, color: Color(0xff438af5)),
                        ),
                        subtitle:
                        ListTile(
                          title: Text(
                            snapshot
                                .child('description')
                                .value
                                .toString(),
                          ),
                          subtitle: Text(snapshot
                              .child('time')
                              .value
                              .toString()),


                        ),
                        trailing: PopupMenuButton(
                            icon: const Icon(Icons.more_vert),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                  value: 1,
                                  child: ListTile(
                                    onTap: () {


                                      Navigator.pop(context);
                                      showMydialog(title, titl,description);
                                    },
                                    leading: const Icon(Icons.edit),
                                    title: const Text('Edit'),
                                  )),

                              PopupMenuItem(
                                  value: 1,
                                  child: ListTile(
                                    onTap: () {

                                      Navigator.pop(context);
                                      ref.child(titl).remove().toString();
                                    },
                                    leading: const Icon(Icons.delete),
                                    title: const Text('Delete'),
                                  )  )
                            ])

                    ),
                  );
                }
                else {
                  return Container(


                  );
                }
              }),
        ),


      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const  Color(0xff438af5),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const ToDO()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showMydialog(String title, String titl,discriptionEdit) async {
    editControler.text = title;
    DiseditControler.text=discriptionEdit;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Upadate'),
            content: Container(
              height: 300,
              child: Column(
                children: [
                  Container(
                    child: TextField(
                      controller: editControler,
                      decoration: const InputDecoration(hintText: "Title"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextField(

                        maxLines: 10,

                        controller: DiseditControler,
                        decoration: const InputDecoration(hintText: "Discription"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.child(titl).update({
                      'addtodo': editControler.text.toLowerCase(),
                      'description': DiseditControler.text.toLowerCase(),

                    }).then((value) {
                      utils().toastMessage("Updated");
                    }).onError((error, stackTrace) {
                      utils().toastMessage(error.toString());
                    });
                  },
                  child: const Text("Update")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("cancel")),
            ],
          );
        });
  }
}