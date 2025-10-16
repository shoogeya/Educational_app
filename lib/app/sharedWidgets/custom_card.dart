import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.color,
    this.child,
    this.customBorderRadius,
    this.border,
    this.shape,
    this.isShowCardShadow = true,
    this.elevation,
    this.margin,
    this.shadowColor,
    this.borderRadius,
  }) : super(key: key);

  final Color? color, shadowColor;
  final Widget? child;
  final bool? isShowCardShadow;
  final RoundedRectangleBorder? shape;
  final BoxBorder? border;
  final double? elevation;
  final double? borderRadius;
  final BorderRadiusGeometry? customBorderRadius;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: isShowCardShadow == true
            ? ((elevation ?? 6) <= 0)
            ? []
            : [
          BoxShadow(
            color: shadowColor ?? Colors.grey.withOpacity(0.5),
            //color of shadow
            spreadRadius: elevationValue.toDouble(),
            blurRadius: borderRadius?.r ?? 12.r,
            offset: const Offset(0, 0), // changes position of shadow
            // offset: Offset(0, 2), // changes position of shadow
          ),
        ]
            : [],
        borderRadius: customBorderRadius ??
            BorderRadius.circular(
              borderRadius?.r ?? 12.r,
            ),
        border: border,
      ),
      child: Card(
        margin: margin ?? EdgeInsets.zero,
        elevation: elevation,
        shadowColor: Colors.black38,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderOnForeground: true,
        color: color ?? Colors.white,
        surfaceTintColor: color ?? Colors.white,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius?.r ?? 12.r,
              ),
            ),
        child: child,
      ),
    );
  }

  double get elevationValue {
    if (elevation == null) {
      return (8.2) / 1000;
    } else {
      return (num.tryParse(elevation.toString()) ?? 8.2) / 1000;
    }
  }
}
