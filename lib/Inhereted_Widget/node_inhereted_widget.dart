import 'package:flutter/material.dart';

class NoteInhiretedWidget extends InheritedWidget {

        final notes =[
          {'title':' ldkfnwelifn inoivhnfwenf ldkfnwelifn inoivhnfwenf ldkfnwelifn inoivhnfwenfldkfnwelifn inoivhnfwenf',
            'text':'ldkfnwelifn inoivhnfwenfldkfnwelifn inoivhnfwenf'
          },

          {'title':'ldkfnwelifn inoivhnfwenfldkfnwelifn inoivhnfwenfldkfnwelifn inoivhnfwenf',
            'text':'ldkfnwelifn inoivhnfwenf'
          },

          {'title':'ldkfnwelifn inoivhnfwenfldkfnwelifn inoivhnfwenfldkfnwelifn inoivhnfwenfldkfnwelifn inoivhnfwenf',
            'text':'ldkfnwelifn inoivhnfwenfldkfnwelifn inoivhnfwenfinoivhnfwenfinoivhnfwenfinoivhnfwenf'
          },

        ];

        NoteInhiretedWidget(Widget child) : super(child: child);

        static NoteInhiretedWidget of(BuildContext context) {
          return context.dependOnInheritedWidgetOfExactType<NoteInhiretedWidget>();
        }

  @override
  bool updateShouldNotify( NoteInhiretedWidget old) {
   return old.notes != notes ;
  }
}