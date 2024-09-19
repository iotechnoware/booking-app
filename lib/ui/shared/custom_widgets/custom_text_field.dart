import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gofly/ui/shared/colors.dart';

class PasswordVisibilityController extends GetxController {
  RxBool hidePassword = true.obs;

  void togglePasswordVisibility() {
    hidePassword.value = !hidePassword.value;
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key, required this.hitText, this.borderColor, this.textColor, this.backColor, this.labelText, required this.controller, this.keyboardType, this.validator, required this.isPassword,}) : super(key: key);

  final String hitText;
  final Color? borderColor;
  final Color? textColor;
  final bool isPassword;
  final Color? backColor;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {

    bool hidePassword = true;

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 1 ,horizontal: 18),
      child: TextFormField(
        validator: widget.validator,
        // textInputAction: TextInputAction.next,
        // autofocus: true,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword ? IconButton(
            onPressed: ()
            {
              setState(() {hidePassword =! hidePassword;});
            },
            icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility , color: AppColors.mainBlueColor,),
          ) : const SizedBox.shrink(),
          // errorStyle: TextStyle(color: AppColors.mainOrangeColor),
          filled: true,
          fillColor: widget.backColor ?? AppColors.textFieldColor,
          hintText: widget.hitText,
          contentPadding: const EdgeInsetsDirectional.symmetric(vertical: 25 ,horizontal: 30),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: widget.borderColor ?? AppColors.transparentColor)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: widget.borderColor ?? AppColors.transparentColor),
          ),

        ),
        style: TextStyle(color: widget.textColor ?? Colors.black45),
      ),
    );
  }
}
