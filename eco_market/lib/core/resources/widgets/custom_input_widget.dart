import 'package:flutter/material.dart';
import 'package:eco_market/config/config.dart';

class CustomInputWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool? isPasswordField;
  final String? title;
  final String? hinText;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final Color? filledColor;
  final Color? titleColor;
  final int? maxLines;
  final Widget? leading;
  final bool? isReadOnly;

  const CustomInputWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.isPasswordField,
    this.hinText,
    this.validator,
    this.inputType,
    this.title,
    this.onTap,
    this.onChanged,
    this.filledColor = Colors.white,
    this.titleColor = Colors.black,
    this.maxLines = 1,
    this.leading,
    this.isReadOnly = false,
  });

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  bool _obsecureText = true;
  bool isReadOnly = false;

  @override
  void initState() {
    super.initState();
    isReadOnly = widget.onTap == null ? widget.isReadOnly! : true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: widget.titleColor,
                ),
          ),
        if (widget.title != null) const SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.inputType,
          obscureText: widget.isPasswordField == true ? _obsecureText : false,
          cursorColor: Colors.black,
          onTap: widget.onTap,
          style: theme.textTheme.bodyMedium,
          readOnly: isReadOnly,
          validator: widget.validator,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            enabled: true,
            prefixIcon: widget.leading,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(.3)),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(.3)),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            filled: true,
            fillColor: widget.filledColor,
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
            suffixIcon: widget.onTap == null
                ? widget.isPasswordField == true
                    ? GestureDetector(
                        onTap: () {
                          _obsecureText = !_obsecureText;
                          setState(() {});
                        },
                        child: Icon(
                          _obsecureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.black54.withOpacity(.6),
                        ),
                      )
                    : null
                : const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                  ),
          ),
        ),
      ],
    );
  }
}
