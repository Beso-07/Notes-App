import 'package:flutter/material.dart';
import 'package:notesapp/views/widgets/custom_appbar.dart';
import 'package:notesapp/views/widgets/note_list_view.dart';

class CustomBodyView extends StatelessWidget {
  const CustomBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Column(
        children: [
          SizedBox(height: 10),
          CustomAppbar(title: 'Notes', icon: Icons.search),
          Expanded(child: NoteListView()),
        ],
      ),
    );
  }
}
