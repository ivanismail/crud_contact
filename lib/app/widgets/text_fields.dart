import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SolidTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Color? backgroudColor, textHintColor, textLabelColor;
  final EdgeInsets? padding, margin;
  final String? hintText, labelText;
  final FocusNode? focusNode;
  final Function(String)? onChange;
  final bool readOnly;
  final VoidCallback? onTap;

  const SolidTextField({
    Key? key,
    this.suffixIcon,
    this.backgroudColor,
    this.textHintColor,
    this.padding,
    this.hintText,
    this.labelText,
    this.textLabelColor,
    this.margin,
    this.focusNode,
    this.onChange,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      decoration: BoxDecoration(
        color: this.backgroudColor,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: this.padding ??
          EdgeInsets.symmetric(
            horizontal: 12,
          ),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              style: TextStyle(color: Colors.white),
              onTap: this.onTap,
              readOnly: this.readOnly,
              focusNode: focusNode,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: this.hintText,
                hintStyle: TextStyle(
                  color: this.textHintColor,
                ),
                labelStyle: TextStyle(
                  color: this.textLabelColor,
                ),
                labelText: this.labelText,
              ),
              onChanged: this.onChange,
            ),
          ),
        ],
      ),
    );
  }

  static Widget label(String label) => SolidTextField(
        margin: EdgeInsets.only(bottom: 12),
        backgroudColor: Colors.grey[200],
        textLabelColor: Colors.grey[700],
        labelText: label,
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ).copyWith(top: 12),
      );
}

class OutlineTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Color? backgroudColor, textHintColor, textLabelColor;
  final EdgeInsets? padding, margin;
  final String? hintText, labelText, helperText;
  final double height;
  final int? maxline, minline;
  final TextInputType? keyboardType;
  final bool readOnly, obscureText, filled;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatter;

  const OutlineTextField({
    Key? key,
    this.suffixIcon,
    this.backgroudColor,
    this.textHintColor,
    this.padding,
    this.hintText,
    this.labelText,
    this.textLabelColor,
    this.margin = const EdgeInsets.only(bottom: 12),
    this.height = 42,
    this.maxline = 1,
    this.minline,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.validator,
    this.filled = true,
    this.focusNode,
    this.inputFormatter,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: TextFormField(
              inputFormatters: this.inputFormatter,
              focusNode: this.focusNode,
              obscureText: this.obscureText,
              controller: this.controller,
              onChanged: this.onChanged,
              onTap: this.onTap,
              readOnly: this.readOnly,
              keyboardType: this.keyboardType,
              maxLines: this.maxline,
              minLines: this.minline,
              validator: this.validator,
              decoration: InputDecoration(
                fillColor: this.readOnly ? Colors.grey[200] : null,
                filled: this.readOnly && this.filled,
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(),
                contentPadding: padding ??
                    EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                hintText: this.hintText,
                hintStyle: TextStyle(
                  color: this.textHintColor,
                ),
                labelStyle: TextStyle(
                  color: this.textLabelColor,
                ),
                labelText: this.labelText,
                suffixIcon: this.suffixIcon,
                helperText: this.helperText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget label(
    String label, {
    int? maxline = 1,
    int? minline = 1,
    TextInputType? keyboardType,
    TextEditingController? controller,
    Function(String)? onChanged,
    Function()? onTap,
    bool obscureText = false,
    FormFieldValidator<String>? validator,
    bool readOnly = false,
    bool filled = true,
    FocusNode? focusNode,
    EdgeInsets? margin,
    List<TextInputFormatter>? inputFormatter,
    String? helperText,
    String? hintText,
  }) =>
      OutlineTextField(
        focusNode: focusNode,
        onTap: onTap,
        readOnly: readOnly,
        filled: filled,
        validator: validator,
        obscureText: obscureText,
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        maxline: maxline,
        minline: minline,
        margin: margin ?? EdgeInsets.only(bottom: 12),
        backgroudColor: Colors.grey[200],
        textLabelColor: Colors.grey[300],
        labelText: label,
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ).copyWith(top: 14),
        inputFormatter: inputFormatter,
        helperText: helperText,
        hintText: hintText,
        textHintColor: Colors.grey[500],
      );
}
