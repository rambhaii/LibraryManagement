

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';

class CustomAppBar extends StatelessWidget {
  final String title;


  const CustomAppBar({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: AppBar(
            backgroundColor: Colors.red.withOpacity(0.9),
            title: Text(title,style: bodyText,),
          ),
        ),
      );
  }
}
