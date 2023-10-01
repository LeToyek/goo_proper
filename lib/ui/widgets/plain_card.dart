import 'package:flutter/material.dart';
import 'package:goo_proper/config/theme.dart';

class PlainCard extends StatelessWidget {
  Widget? child;
  Color? color;
  Padding? padding;
  BorderRadius? borderRadius;
  void Function()? onTap;
  PlainCard(
      {super.key,
      this.child,
      this.color,
      this.padding,
      this.borderRadius,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color ?? secondaryColor,
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(12)),
        ),
        child: child,
      ),
    );
  }
}
