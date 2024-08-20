import 'package:eat_fun/utils/utils.dart';

class CustomText extends StatelessWidget {
  final String fontFamily;
  final String text;
  final TextStyle textStyle;

  const CustomText(
      {super.key,
       this.fontFamily = "Rosario",
      required this.textStyle,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.getFont(
          fontFamily,
          textStyle: textStyle,
        ));
  }
}
