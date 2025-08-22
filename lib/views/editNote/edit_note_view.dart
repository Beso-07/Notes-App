import 'package:flutter/material.dart';
import 'package:notesapp/views/editNote/edit_note_body_view.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:EditNoteBodyView() ,
    );
  }
}