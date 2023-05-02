import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';

class EditTextWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final TextInputType? type;
  final FormFieldValidator? validator;
  final int? length;
  final bool? isRead;
  final String? image;

  const EditTextWidget(
      {Key? key,
      required this.image,
      this.controller,
      required this.hint,
      this.validator,
      this.type = TextInputType.text,
      this.length = null,
      this.isRead = false}
      )
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        readOnly: isRead!,
        decoration: InputDecoration(
            prefixIcon: SvgPicture.asset(
              image!,
              width: 25,
              height: 25,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 45,
            ),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: hint,
            isDense: true,
            counter: Offstage(),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            labelText: hint),
        keyboardType: type,
        validator: validator,
        maxLength: length,
        style: bodyText);
  }
}

class EditTextWidgetAddMember extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final TextInputType? type;
  final FormFieldValidator? validator;
  final int? length;
  final bool? isRead;

  const EditTextWidgetAddMember(
      {Key? key,
      this.controller,
      required this.hint,
      this.validator,
      this.type = TextInputType.text,
      this.length = null,
      this.isRead = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        controller: controller,
        readOnly: isRead!,
        decoration: InputDecoration(
            prefixIconConstraints: BoxConstraints(
              minWidth: 45,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),

            hintText: hint,
            hintStyle: TextStyle(color: Colors.black54),
            isDense: true,
            counter: Offstage(),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            labelText: hint,
            labelStyle: TextStyle(color: Colors.red)),
             keyboardType: type,
             validator: validator,
             maxLength: length,
             style: bodyText);
  }
}
