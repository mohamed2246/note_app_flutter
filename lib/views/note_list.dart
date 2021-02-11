import 'package:flutter/material.dart';
import 'package:note_app_flutter/Inhereted_Widget/node_inhereted_widget.dart';
import 'package:note_app_flutter/Providers/note_providers.dart';
import 'package:note_app_flutter/views/note.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: FutureBuilder(
          future: NoteProvider.getNoteList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final notes = snapshot.data;
              return ListView.builder(
                itemBuilder: (contect, index) {
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contect) =>
                                  Note(NoteMode.Editing, notes[index])));
                      setState(() {});
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, bottom: 30.0, left: 13.0, right: 22.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _NoteTitle(notes[index]['title']),
                            Container(
                              height: 4,
                            ),
                            _NoteText(notes[index]['text']),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: notes.length,
              );
            }return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Note(NoteMode.Adding, null)));
          setState(() {

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _NoteTitle extends StatefulWidget {
  final String _title;

  _NoteTitle(this._title);

  @override
  __NoteTitleState createState() => __NoteTitleState();
}

class __NoteTitleState extends State<_NoteTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget._title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _NoteText extends StatefulWidget {
  final String _text;

  _NoteText(this._text);

  @override
  __NoteTextState createState() => __NoteTextState();
}

class __NoteTextState extends State<_NoteText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget._text,
      style: TextStyle(
        color: Colors.grey.shade600,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
