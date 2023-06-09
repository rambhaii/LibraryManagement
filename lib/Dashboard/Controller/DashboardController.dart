import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../AppConstant/APIConstant.dart';
import '../../UtilsMethod/BaseController.dart';
import '../../UtilsMethod/base_client.dart';
import '../Model/BannerData.dart';

class DashBoardController extends GetxController
{
  RxList reportMessageList =
      [
        {
       "icon":Icons.ac_unit_outlined,
       "title":"Enrollment Fee"
     },
        {
          "icon":Icons.access_time_filled_outlined,
          "title":"Plan Management"
        },
        {
          "icon":Icons.add_call,
          "title":"User Management"
        },
        {
          "icon":Icons.account_circle,
          "title":"Tax Management"
        },
        {
          "icon":Icons.account_circle,
          "title":"Manage Notice"
        },
        {
          "icon":Icons.account_circle,
          "title":"Invoice Management"
        },
        {
          "icon":Icons.account_circle,
          "title":"Collection Graph"
        },

      ].obs;
  var bannerData=BannerData().obs;
  getBannerNetworkApi() async
  {
    var response = await BaseClient()
        .get(getBnnerApi)
        .catchError(BaseController().handleError);

    if (jsonDecode(response)["status"] == 1) {
      bannerData.value = bannerDataFromJson(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }



}