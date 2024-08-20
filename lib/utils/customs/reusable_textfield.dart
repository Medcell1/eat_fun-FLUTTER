import 'package:eat_fun/utils/utils.dart';
class ReusableTextField extends StatelessWidget {
  final String hintText;

  const ReusableTextField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: primaryColor,
      style: GoogleFonts.rosario(
        textStyle: const TextStyle(
          fontSize: 14,
        ),
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: formBorderColor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.rosario(
          textStyle: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
