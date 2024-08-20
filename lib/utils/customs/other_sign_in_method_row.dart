import 'package:eat_fun/utils/utils.dart';
class OtherSignInMethodRow extends StatelessWidget {
  const OtherSignInMethodRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          googleImage,
        ),
        10.spaceWidth(),
        Image.asset(
          faceBookImage,
        ),
      ],
    );
  }
}
