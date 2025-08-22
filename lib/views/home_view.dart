import 'package:flutter/material.dart';
import 'package:notesapp/constant.dart';
import 'package:notesapp/views/addNote/add_note_bottom_sheet.dart';
import 'package:notesapp/views/notes/notes_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesView(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 8),
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (contex) {
                return AddNodeBottomSheet();
              },
            );
          },
          child: Icon(Icons.add, color: Colors.black, size: 45),
        ),
      ),
    );
  }
}
