import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final Function(String?)? onChanged;
  final double height;
  final double width;
  final Color iconColor;
  final Color? borderColor;
  final Color? fillColor;
  final Color? textStyle;
  final Color? dropDownColor;

  const CustomDropdown(
      {super.key,
      required this.options,
      required this.selectedOption,
      required this.onChanged,
      required this.height,
      required this.width,
      this.borderColor,
      this.textStyle,
      required this.iconColor,
      this.dropDownColor,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: fillColor,
        border: Border.all(color: borderColor ?? Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          dropdownColor: dropDownColor,
          alignment: Alignment.center,
          value: selectedOption,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          iconEnabledColor: iconColor,
          iconSize: 16,
          onChanged: onChanged,
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: textStyle ?? Theme.of(context).secondaryHeaderColor),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
