import 'package:flutter/material.dart';
import 'package:notesapp/views/colors/color_item.dart';

class ColorsListView extends StatefulWidget {
  final ValueChanged<Color> onColorSelected; // 👈 callback

  const ColorsListView({super.key, required this.onColorSelected});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int selectedIndex = 0;

  final List<Color> colors = [
    Color(0xff03dffc),
    Color(0xff8ed660),
    Color(0xff434166),
    Color(0xffcc6265),
    Color(0xffcc5733),
    Color(0xff32d996),
    Color(0xff03fce8),
    Color(0xffde5c4e),
    Color(0xffa6b037),
    Color(0xff3e50c7),
    Color(0xff8a6538),
    Color(0xffb03188),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ColorItem(
            color: colors[index],
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onColorSelected(colors[index]);
            },
          );
        },
      ),
    );
  }
}
