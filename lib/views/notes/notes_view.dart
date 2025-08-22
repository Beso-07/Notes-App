import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/show_notes_cubit/shownotes_cubit.dart';
import 'package:notesapp/views/widgets/custom_appbar.dart';
import 'package:notesapp/views/notes/note_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShownotesCubit(),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Column(
          children: [
            SizedBox(height: 10),
            CustomAppbar(title: 'Notes', icon: Icons.search),
            Expanded(child: NoteListView()),
          ],
        ),
      ),
    );
  }
}
