import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/show_notes_cubit/shownotes_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/notes/note_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final notes = BlocProvider.of<NotesCubit>(context).notes ?? [];

    List<NoteModel> filteredNotes =
        query.isEmpty
            ? []
            : notes
                .where(
                  (note) =>
                      note.title.toLowerCase().startsWith(query.toLowerCase()),
                )
                .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Search Notes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search by title...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child:
                  query.isEmpty
                      ? const Center(child: Text('Type to search notes...'))
                      : filteredNotes.isEmpty
                      ? const Center(child: Text('No matching notes found'))
                      : ListView.builder(
                        itemCount: filteredNotes.length,
                        itemBuilder: (context, index) {
                          final note = filteredNotes[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: NoteItem(note: note),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
