import 'package:bankapp/app/core/exports.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChangedFunction;
  final bool obscureText;
  final Icon icon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.onChangedFunction,
    this.obscureText = false,
    required this.icon,
    this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        prefixIcon: icon,
      ),
      obscureText: obscureText,
      onChanged: onChangedFunction ?? (String text) {},
      keyboardType: keyboardType ?? TextInputType.text,
    );
  }
}
