import 'package:flutter/material.dart';
import 'package:gofly/ui/shared/utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.color, required this.text, required this.onPressed}) : super(key: key);

  final Color? color;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8 , bottom: 8),
      child: SizedBox(
        width: screenWidth(1.2),
        height: screenWidth(7.5),
        child: FloatingActionButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          // ignore: sort_child_properties_last
          child: Text(text,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Gilroy')),
          backgroundColor: color ?? Colors.blueAccent.shade400,
          onPressed: () {
            onPressed();
          },
        ),
      ),
    );
  }
}
