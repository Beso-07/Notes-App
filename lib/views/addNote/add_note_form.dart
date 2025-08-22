import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/colors/colors_list_view.dart';
import 'package:notesapp/views/widgets/custom_button.dart';
import 'package:notesapp/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  Color selectedColor = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,

      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextField(
            hint: 'title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hint: 'content',
            maxLines: 8,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(height: 20),

          ColorsListView(
            onColorSelected: (color) {
              selectedColor = color;
            },
          ),
          const SizedBox(height: 40),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var noteModel = NoteModel(
                      title: title!,
                      content: subTitle!,
                      date:
                          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                      color: selectedColor.value,
                    );

                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
