import 'package:eat_fun/utils/utils.dart';
class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final dynamic onTap;
  const CustomPrimaryButton({
    super.key, required this.text,  this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 40,
        ),
        child:  CustomText(
          text: text,
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
