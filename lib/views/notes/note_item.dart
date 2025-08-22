import 'package:flutter/material.dart';
import 'package:notesapp/views/editNote/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView();
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 209, 184, 114),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: const Text(
                'Flutter Tibs',
                style: TextStyle(fontSize: 26, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 8),
                child: Text(
                  'build your carrer with mahmoud bassem',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, size: 45),
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                'Aug11, 2025',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
