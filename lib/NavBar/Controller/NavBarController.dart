import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController
{
  RxInt status=1.obs;
  TextEditingController etMessage = TextEditingController();
  TextEditingController textDate=TextEditingController();
  final formKey=GlobalKey<FormState>();
  RxList reportMessageList =
      [
        "2023",
        "2022",
        "2021",
        "2020",
        "2019",
      ].obs;
}