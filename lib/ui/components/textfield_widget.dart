import 'package:eriell_app/ui/style/app_style.dart';
import 'package:flutter/cupertino.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String labelText;
  final bool? obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: CupertinoTextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        placeholder: labelText,
        placeholderStyle: AppStyle.fontStyle.copyWith(
          fontSize: 14,
        ),
        scrollPadding: const EdgeInsets.all(
          15,
        ),
      ),
    );

  }
}


    // TextField(
    //   keyboardType: keyboardType,
    //   controller: controller,
    //   obscureText: obscureText ?? false,
    //   decoration: InputDecoration(
    //     labelText: labelText,
    //     focusedBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(color: AppColors.borderColor, width: 2),
    //       borderRadius: BorderRadius.circular(6),
    //     ),
    //     enabledBorder: OutlineInputBorder(
    //       borderSide: const BorderSide(color: AppColors.borderColor, width: 2),
    //       borderRadius: BorderRadius.circular(6),
    //     ),
    //   ),
    // );