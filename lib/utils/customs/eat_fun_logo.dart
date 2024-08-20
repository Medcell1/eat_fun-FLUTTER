import 'package:eat_fun/utils/utils.dart';
class EatFunLogo extends StatelessWidget {
  const EatFunLogo({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.eatFontSize,
    required this.funFontSize,
    required this.imageHeight,
  });

  final double screenHeight;
  final double screenWidth;
  final double eatFontSize;
  final double funFontSize;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.2,
      width: screenWidth * 0.7,
      child: Stack(
        children: [
          Positioned(
            top: screenHeight * .06,
            child: CustomText(
              fontFamily: 'Righteous',
              textStyle: TextStyle(
                fontSize: eatFontSize,
                color: Colors.white,
              ),
              text: 'Eat.',
            ),
          ),
          Positioned(
            left: screenWidth * .16,
            child: Image(
              image: const AssetImage(cutleryImage),
              height: screenWidth * imageHeight,
            ),
          ),
          Positioned(
            top: screenHeight * 0.11,
            left: screenWidth * .22,
            child: CustomText(
              fontFamily: 'Rowdies',
              textStyle: TextStyle(
                fontSize: funFontSize,
                color: Colors.white,
              ),
              text: 'Fun',
            ),
          ),
        ],
      ),
    );
  }
}
