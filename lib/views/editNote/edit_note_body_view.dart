import 'package:flutter/material.dart';
import 'package:notesapp/views/widgets/custom_appbar.dart';
import 'package:notesapp/views/widgets/custom_text_field.dart';

class EditNoteBodyView extends StatelessWidget {
  const EditNoteBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Column(
        children: [
          SizedBox(height: 10),
          CustomAppbar(title: 'Edit', icon: Icons.check),
          SizedBox(height: 20),
          CustomTextField(hint: 'title'),
          SizedBox(height: 30),
          CustomTextField(hint: 'content', maxLines: 8),
        ],
      ),
    );
  }
}
