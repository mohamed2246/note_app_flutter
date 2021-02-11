import 'package:flutter/material.dart';
import 'package:note_app_flutter/Inhereted_Widget/node_inhereted_widget.dart';
import 'package:note_app_flutter/Providers/note_providers.dart';

enum NoteMode { Editing, Adding }

class Note extends StatefulWidget {
  final NoteMode noteMode;

  //final int index;
  final Map<String, dynamic> note;

  Note(this.noteMode, this.note);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  TextEditingController _titleControler = TextEditingController();
  TextEditingController _textControler = TextEditingController();

  List<Map<String, String>> get _nodes => NoteInhiretedWidget.of(context).notes;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (widget?.noteMode == NoteMode.Editing) {
      _titleControler.text = widget.note['title'];
      _textControler.text = widget.note['text'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.noteMode == NoteMode.Adding ? 'Add Note' : 'Edit Node'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _titleControler,
              decoration: InputDecoration(hintText: 'Note Title'),
            ),
            Container(
              height: 8,
            ),
            TextField(
              controller: _textControler,
              decoration: InputDecoration(hintText: 'Note Text'),
            ),
            Container(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _NoteButton('Save', Colors.blue, () {
                  final title = _titleControler.text;
                  final text = _textControler.text;

                  if (widget?.noteMode == NoteMode.Adding) {
                    NoteProvider.insertNote({
                      'title': title,
                      'text': text,
                    });
                  } else if (widget?.noteMode == NoteMode.Editing) {
                    NoteProvider.UpdateNote({
                      'id': widget.note['id'],
                      'title': _titleControler.text,
                      'text': _textControler.text,
                    });
                  }
                  Navigator.pop(context);
                }),
                _NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _NoteButton('Delete', Colors.red, () async {
                        await NoteProvider.DeleteNote(widget.note['id']);

                        Navigator.pop(context);
                        }),
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NoteButton extends StatelessWidget {
  final String _text;

  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 60,
      height: 50,
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(color: Colors.white),
      ),
      color: _color,
    );
  }
}
