import 'package:flutter/material.dart';
import 'package:notesapp/constant.dart';
import 'package:notesapp/views/widgets/add_note_model_sheet.dart';
import 'package:notesapp/views/widgets/custom_body_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBodyView(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 8),
        child: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (contex) {
                return AddNodeModelSheet();
              },
            );
          },
          child: Icon(Icons.add, color: Colors.black, size: 45),
        ),
      ),
    );
  }
}
