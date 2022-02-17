import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerMenuItem extends StatelessWidget {
  final String title;
  final String asset;
  final VoidCallback onTap;

  const DrawerMenuItem({
    Key? key,
    required this.title,
    required this.asset,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      onTap: onTap,
      leading: SvgPicture.asset(
        asset,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white54,
        ),
      ),
    );
  }
}
