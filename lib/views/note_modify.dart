import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  // const NoteModify({ Key? key }) : super(key: key);

   final String? noteID;

   bool get isEditing => noteID != null;
   NoteModify({this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( noteID == null ? "Create Note" : "Update Note"),),
      //appBar: AppBar(title: Text( isEditing ? "Update Note" : "Create Note" ),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
        children: [
          TextField(
            decoration : InputDecoration(hintText: "Note Title")
          ),

          Container(height: 8,),


          TextField(
            decoration : InputDecoration(hintText: "Note Content")
          ),

          Container(height: 16,),


          SizedBox(
            width: double.infinity,
            height: 35,
            child: ElevatedButton(
            onPressed: () {
              // if(isEditing){
              //   //update note in api
              // }
              // else{
              //   //create note in api
              // }
              Navigator.of(context).pop();
            },
            child: Text("Submit",style: TextStyle(color: Colors.white),) ,
            
            // color: Theme.of(context).primaryColor,
            ),
          )
 
        ],
      ),
        )
    );
  }
}