import 'package:flutter/material.dart';

//primary
const Color backgroundColor = Color(0xFFFAFAFA);
const Color backgroundColor2 = Color(0xFFF6F6F6);
const Color backgroundColor3 = Color(0xFFF2F2F2);
const Color backgroundWhite = Color(0xFFFFFFFF);
const Color black = Color(0xFF1E1F20);
const Color goGreen = Color(0xFF0EAD69);
const Color grayBlue = Color(0xFF9393AA);
const Color border = Color(0xFFE0E0E0);
const Color dodgerBlue = Color(0xFF1DA1F2);
const Color blue800 = Color(0xFF1E40AF);
const Color blueCrayola = Color(0xFF2574FF);
const Color orange = Color(0xFFFE9870);
const Color tiffanyBlue = Color(0xFF12B2B3);
const Color yellow500 = Color(0xFFEAB308);
const Color color2 = Color(0xFF56E0E0);
const Color color3 = Color(0xFF38F399);
const Color color4 = Color(0xFF004080);
const Color color5 = Color(0xFF20A085);
const Color neonFuchsia = Color(0xFFFA4169);
const Color isabelline = Color(0xFFF0F0F0);
const Color mediumTurquoise = Color(0xFF53D0EC);
const Color blue100 = Color.fromRGBO(219, 234, 254, 1);
const Color bdazzledBlue = Color(0xFF3B5998);
const Color malachite = Color(0xFF00D65B);
const Color greenDeep = Color.fromRGBO(33, 202, 117, 1);
const Color blueDocument = Color.fromRGBO(32, 140, 233, 1);
const Color blue = Color.fromRGBO(29, 161, 242, 1);
const Color yellow100 = Color.fromRGBO(254, 249, 195, 1);
const Color yellow800 = Color.fromRGBO(133, 77, 14, 1);
const Color redLight = Color.fromRGBO(250, 65, 105, 1);
const Color bg = Color.fromRGBO(250, 250, 250, 1);
LinearGradient linear = LinearGradient(
  colors: [tiffanyBlue.withOpacity(0.8), color2],
  begin: FractionalOffset.bottomLeft,
  end: FractionalOffset.topRight,
);

LinearGradient linear2 = const LinearGradient(
  colors: [tiffanyBlue, malachite],
  begin: FractionalOffset.bottomLeft,
  end: FractionalOffset.topRight,
);

//Grey shade
const Color grey1100 = Color(0xFF1F2933);
const Color grey1000 = Color(0xFF323F4B);
const Color grey900 = Color(0xFF3E4C59);
const Color grey800 = Color(0xFF52606D);
const Color grey700 = Color(0xFF616E7C);
const Color grey600 = Color(0xFF7B8794);
const Color grey500 = Color(0xFF9AA5B1);
const Color grey400 = Color(0xFFCBD2D9);
const Color grey300 = Color(0xFFE4E7EB);
const Color grey200 = Color(0xFFF5F7FA);
const Color grey100 = Color(0xFFFFFFFF);

extension CustomColorTheme on ThemeData {
  //text
  Color get color1 => brightness == Brightness.light ? grey700 : grey500;
  Color get color2 => brightness == Brightness.light ? grey800 : grey400;
  Color get color3 => brightness == Brightness.light ? grey900 : grey300;
  Color get color4 => brightness == Brightness.light ? grey1000 : grey200;
  Color get color5 => brightness == Brightness.light ? grey1100 : grey100;
  Color get color6 => brightness == Brightness.light ? grey100 : grey1100;
  Color get color7 => brightness == Brightness.light ? grey200 : grey1000;
  Color get color8 => brightness == Brightness.light ? grey300 : grey900;
  Color get color9 => brightness == Brightness.light ? grey400 : grey800;
  Color get color10 => brightness == Brightness.light ? grey500 : grey700;
  Color get color11 => brightness == Brightness.light ? black : grey100;
  Color get color12 => brightness == Brightness.light ? grey100 : black;

  //google map
  RadialGradient get colorGoogle => brightness == Brightness.light
      ? const RadialGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 0.0001),
            Color.fromRGBO(255, 255, 255, 0.2),
            Color.fromRGBO(255, 255, 255, 0.3),
            Color.fromRGBO(255, 255, 255, 0.4),
            Color.fromRGBO(255, 255, 255, 1),
          ],
        )
      : const RadialGradient(
          colors: [
            Color.fromRGBO(31, 41, 51, 0.0001),
            Color.fromRGBO(31, 41, 51, 0.2),
            Color.fromRGBO(31, 41, 51, 0.3),
            Color.fromRGBO(31, 41, 51, 0.4),
            Color.fromRGBO(31, 41, 51, 1),
          ],
        );
}
