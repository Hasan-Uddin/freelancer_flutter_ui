import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_flutter_ui/core/utils/responsive.dart';
import '../../core/constants.dart';

class CategoryTile extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? iconPath;
  const CategoryTile({
    super.key,
    required this.label,
    this.icon,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final size_w = Responsive.scaleWidth(context, 108);
    final size_h = Responsive.scaleWidth(context, 95);
    Widget iconWidget;

    //Detect icon source (SVG asset, normal image, or IconData)
    if (iconPath != null) {
      if (iconPath!.endsWith('.svg')) {
        iconWidget = SvgPicture.asset(
          iconPath!,
          width: Responsive.scaleWidth(context, 24),
          height: Responsive.scaleWidth(context, 24),
        );
      } else {
        iconWidget = Image.asset(
          iconPath!,
          width: Responsive.scaleWidth(context, 24),
          height: Responsive.scaleWidth(context, 24),
          fit: BoxFit.contain,
        );
      }
    } else {
      iconWidget = Icon(icon, size: Responsive.scaleWidth(context, 24));
    }

    return Padding(
      padding: EdgeInsets.only(right: Responsive.scaleWidth(context, 10)),
      child: IntrinsicHeight(
        child: Container(
          width: size_w,
          height: size_h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Consts.cardRadius),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.scaleWidth(context, 12),
            vertical: Responsive.scaleWidth(context, 12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              iconWidget,
              Text(
                label,
                style: TextStyle(fontSize: Responsive.scaleWidth(context, 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
