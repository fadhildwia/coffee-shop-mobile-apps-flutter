import 'package:coffee_shop_mobile_apps/utils/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

Widget buildSvgIcon(String iconName, Color color, bool isActive,
    {double width = 24, double height = 24}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(
        '${AssetPath.iconPath}/$iconName.svg',
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        width: width,
        height: height,
      ),
      const SizedBox(height: 5),
      Container(
        width: 10,
        height: 5,
        decoration: BoxDecoration(
          color: isActive ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(2.5),
        ),
      ),
    ],
  );
}
