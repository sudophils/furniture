import 'package:flutter/material.dart';

import '../util/constants.dart';

class FurnitureMenuItem extends StatelessWidget {
  final IconData icon;
  final bool? isSelected;
  final Function() onTap;

  const FurnitureMenuItem(
      {Key? key, required this.icon, this.isSelected, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(right: 16, left: 16),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: isSelected == true ? primaryColor : iconBackdropColor,
              shape: BoxShape.circle),
          child: Center(
            child: Icon(
              icon,
              color: isSelected == true ? activeIconColor : primaryColor,
            ),
          ),
        ));
  }
}
