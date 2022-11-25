import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_bloc.dart';

import '../model/notes.dart';

import '../bloc/monitor_bloc.dart';

class ListCart extends StatelessWidget {
  ListCart({Key? key}) : super(key: key);

  final List colors = [Colors.orange, Colors.red, Colors.yellow];
  final List icons = [Icons.ac_unit_outlined, Icons.access_alarm_rounded];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonitorBloc, MonitorState>(
      builder: (context, state) => getNoteListView(state.noteCollection),
    );

    /*return getNoteListView(NoteCollection()
      ..updateOrInsertNoteOfId(
          "1",
          Note.withData(
            title: "aasdfghjkl",
            description: "a",
          )));*/
  }

  ListView getNoteListView(NoteCollection noteCollection) {
    return ListView.builder(
        itemCount: noteCollection.length(),
        itemBuilder: (context, position) => ListTile(
              onTap: () {
                //print(noteCollection.getIdAtIndex(position));
                BlocProvider.of<ManageBloc>(context).add(UpdateRequest(
                  noteId: noteCollection.getIdAtIndex(position),
                  previousNote: noteCollection.getNoteAtIndex(position),
                ));
              },
              leading: ClipRRect(
                  child: Image.asset(
                noteCollection.getNoteAtIndex(position).description,
                width: 100,
              )),
              trailing: GestureDetector(
                  onTap: () {
                    BlocProvider.of<ManageBloc>(context).add(DeleteEvent(
                        noteId: noteCollection.getIdAtIndex(position)));
                  },
                  child: const Icon(Icons.delete)),
              title: Text(noteCollection.getNoteAtIndex(position).title),
              subtitle: const Text('Item'),
            ));
  }
}
