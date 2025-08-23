import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/show_notes_cubit/shownotes_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/colors/colors_list_view.dart';
import 'package:notesapp/views/widgets/custom_appbar.dart';
import 'package:notesapp/views/widgets/custom_text_field.dart';

class EditNoteBodyView extends StatefulWidget {
  const EditNoteBodyView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteBodyView> createState() => _EditNoteBodyViewState();
}

class _EditNoteBodyViewState extends State<EditNoteBodyView> {
  String? title, content;
  late Color selectedColor;
  @override
  void initState() {
    super.initState();
    selectedColor = Color(widget.note.color);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Column(
        children: [
          const SizedBox(height: 10),
          CustomAppbar(
            title: 'Edit',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.color = selectedColor.value;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            autofocus: true,
            hint: '',
            initialValue: widget.note.title,

            onChanged: (value) {
              title = value;
            },
          ),
          SizedBox(height: 30),
          CustomTextField(
            hint: '',
            initialValue: widget.note.content,
            maxLines: 8,
            onChanged: (value) {
              content = value;
            },
          ),

          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ColorsListView(
              initialColor: selectedColor,
              onColorSelected: (color) {
                selectedColor = color;
              },
            ),
          ),
        ],
      ),
    );
  }
}
