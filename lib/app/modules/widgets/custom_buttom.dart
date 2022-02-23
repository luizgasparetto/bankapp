import 'package:bankapp/app/shared/core/exports.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function()? onPressedFunction;
  final Color? textColor;
  final double fontSize;

  const CustomButton({
    Key? key,
    required this.text,
    required this.color,
    this.onPressedFunction,
    this.textColor,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressedFunction ?? () {},
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Text(
            text,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              color: textColor ?? Theme.of(context).primaryColorDark,
              fontSize: fontSize,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
