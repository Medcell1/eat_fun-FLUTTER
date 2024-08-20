import 'package:eat_fun/views/view.dart';

extension NumApi on num {
   spaceHeight() => SizedBox(
        height: toDouble(),
      );

   spaceWidth() => SizedBox(
        width: toDouble(),
      );
}
