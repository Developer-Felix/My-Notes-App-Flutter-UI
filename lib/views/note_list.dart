import 'package:flutter/material.dart';
import 'package:mynotes/models/note_for_list.dart';
import 'package:mynotes/views/note_delete.dart';
import 'package:mynotes/views/note_modify.dart';


class NoteList extends StatelessWidget {
  
  final notes = [
    new NoteForListing(
     noteID : "1",
     noteTitle : "test",
     createdDateTime : DateTime.now(),
     lastEditDateTime : DateTime.now()
    ),
    new NoteForListing(
     noteID : "2",
     noteTitle : "test",
     createdDateTime : DateTime.now(),
     lastEditDateTime : DateTime.now()
    ),
    new NoteForListing(
     noteID : "3",
     noteTitle : "test",
     createdDateTime : DateTime.now(),
     lastEditDateTime : DateTime.now()
    ),
    new NoteForListing(
     noteID : "4",
     noteTitle : "test",
     createdDateTime : DateTime.now(),
     lastEditDateTime : DateTime.now()
    ),
  ];
  // const NoteList(this.notes,{ Key? key }) : super(key: key);
  String formatDateTime(DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Of Notes"),),
      floatingActionButton: FloatingActionButton
      (onPressed: () 
        {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => NoteModify()));
        }, 
      child: Icon(Icons.add),),
      body:  ListView.separated(
        itemBuilder: (_, index){
          return Dismissible(
            key: ValueKey(notes[index].noteID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {},
            confirmDismiss: (direction)  async
            {

              final result = await showDialog(
                context: context, 
                builder: (_) => NoteDelete()
                );
                print(result);
                return result;
            },
            child: ListTile(
            title: Text(notes[index].noteTitle,style: TextStyle(color: Theme.of(context).primaryColor),),
            subtitle: Text("Last edited on ${formatDateTime(notes[index].lastEditDateTime)}"),
            onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (_) => NoteModify( noteID: notes[index].noteID,))); },
          )
             ,);
        }, 
        separatorBuilder:(_,__) => Divider(height: 1,color: Colors.green,), 
        itemCount: notes.length),
    );
  }
}