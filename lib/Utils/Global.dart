import 'package:flutter/material.dart';
import 'package:xylophone/Objects/ThemeObject.dart';

String appleAppId = "1591322712";
String appName = 'Dido Xylophone';
String appShortDescription = '';
String versionName = '1.0.0';
String website = 'www.stormdeve.com';
String androidAppPackage = "com.stormdeve.age_calculator.age_calculator";

String supportEmail = 'fake1122mail@gmail.com';

List<ThemeObject> themList = [
  ThemeObject(
      id: 0, themeName: 'ayesha', imageName: 'images/themes/ayesha.png'),
  ThemeObject(
      id: 1, themeName: 'danish', imageName: 'images/themes/danish.png'),
  ThemeObject(id: 2, themeName: 'muaz', imageName: 'images/themes/muaz.png'),
];

Widget backButtonView({required BuildContext context}) {
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: Container(
      height: 50,
      width: 70,
      decoration: const BoxDecoration(
        color: Color(0x30000000),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 35,
      ),
    ),
  );
}
