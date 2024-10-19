import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gofly/ui/shared/colors.dart';


class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key, this.hitText, this.borderColor, this.textColor, this.backColor, this.labelText, required this.controller, this.keyboardType, this.validator, this.iconImage,}) : super(key: key);

  final String? hitText;
  final Color? borderColor;
  final Color? textColor;
  final Color? backColor;
  final String? labelText;
  final String? iconImage;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(top: 5 , bottom: 5),
      child: TextField(
        controller: widget.controller,
        style: const TextStyle(color: Colors.black,fontFamily: "gilroy"),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          hintStyle: const TextStyle(color: Colors.black,fontFamily: "gilroy"),
          fillColor: Colors.white,
          hintText: widget.hitText,
          labelText: widget.labelText,
          labelStyle:const TextStyle(color: Colors.black,fontFamily: "gilroy"),
          prefixIcon:
          Image.asset("assets/old_images/${widget.iconImage}.png", scale: 24,color: Colors.black,),
        ),
      ),
    );
  }
}
