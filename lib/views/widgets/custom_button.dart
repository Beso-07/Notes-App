import 'package:flutter/material.dart';
import 'package:notesapp/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child:
            isLoading
                ? const CircularProgressIndicator()
                : const Center(
                  child: Text('Add', style: TextStyle(color: Colors.black)),
                ),
      ),
    );
  }
}
