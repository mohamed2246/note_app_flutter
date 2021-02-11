import 'package:flutter/material.dart';
import 'package:note_app_flutter/views/note_list.dart';

import 'Inhereted_Widget/node_inhereted_widget.dart';

void main() {
  runApp( App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoteInhiretedWidget(
      MaterialApp(
        home: NoteList(),
        title: 'Notes',
      ),
    );
  }
}


