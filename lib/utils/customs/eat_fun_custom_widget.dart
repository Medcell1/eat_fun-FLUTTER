import 'package:eat_fun/utils/utils.dart';
import 'dart:math' as math;


class CustomEatFunWidget extends StatelessWidget {
  const CustomEatFunWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            20.spaceHeight(),
            Row(
              children: [
                Image(
                  image: const AssetImage(paintFoodImageUrl),
                  height: screenHeight * 0.14,
                ),
                20.spaceWidth(),
                Transform.rotate(
                  angle: -math.pi / 6,
                  child: Image(
                    image: const AssetImage(paintBurgerImageUrl),
                    height: screenHeight * 0.14,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(paintDishImageUrl),
                  height: screenHeight * 0.14,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: CustomPaint(
            painter: CustomCircles(),
          ),
        ),
        Positioned(
          top: screenHeight * .04,
          left: screenWidth * .2,
          child: EatFunLogo(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            imageHeight:  0.14,
            eatFontSize: 50,
            funFontSize: 40,
          ),
        )
      ],
    );
  }
}


