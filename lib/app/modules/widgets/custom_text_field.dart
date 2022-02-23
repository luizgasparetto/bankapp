import 'package:bankapp/app/shared/core/exports.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function(String)? onChangedFunction;
  final bool obscureText;
  final Icon icon;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.onChangedFunction,
    this.obscureText = false,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}
