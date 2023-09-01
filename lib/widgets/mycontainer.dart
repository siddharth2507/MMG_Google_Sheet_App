import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget{
  final Widget? child;
  final Color? color;
  final GestureTapCallback? onTap;
  final double? width,height;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final DecorationImage? image;
  final Gradient? gradient;
  final BoxShape? shape;


  const MyContainer({
    this.child,
    this.width,
    this.shape,
    this.height,
    this.onTap,
    this.color,
    this.borderRadius,
    this.gradient,
    this.border,
    this.image,
    Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        margin: EdgeInsets.zero,
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: border,
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius,
          image:image,
          gradient: gradient,
          color: color,
        ),
        child: child,
      ),
    );
  }


}