import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SolidButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final EdgeInsets? padding;
  final Function()? onTap;
  final Color? backgroudColor;
  final bool inactive;
  final Widget? prefixIcon;
  final ChildLayoutHelper? child;
  final bool? loading;
  final BorderRadius? borderRadius;

  const SolidButton({
    Key? key,
    required this.text,
    this.style,
    this.padding,
    this.onTap,
    this.backgroudColor,
    this.inactive = false,
    this.prefixIcon,
    this.child,
    this.loading = false,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: this.borderRadius != null
            ? RoundedRectangleBorder(
                borderRadius: this.borderRadius!,
              )
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
        elevation: 0,
        primary: this.inactive
            ? Colors.blueGrey
            : this.backgroudColor ?? Colors.blue,
        padding: padding,
      ),
      onPressed: this.loading! ? null : this.onTap ?? () {},
      child: this.prefixIcon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                this.prefixIcon!,
                SizedBox(width: 8),
                Text(
                  this.text,
                  style: this.inactive
                      ? TextStyle(
                          color: Colors.blueGrey,
                        )
                      : style,
                ),
              ],
            )
          : Text(
              this.text,
              style: this.inactive
                  ? TextStyle(
                      color: Colors.blueGrey,
                    )
                  : style,
            ),
    );
  }
}
