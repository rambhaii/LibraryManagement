import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../AppConstant/APIConstant.dart';
import '../../AppConstant/AppConstant.dart';
import '../../Auth/model/StateName.dart';
import '../../UtilsMethod/BaseController.dart';
import '../../UtilsMethod/base_client.dart';

class AddLibraryController extends  GetxController
{
  TextEditingController etMobile=TextEditingController();
  TextEditingController etOrgName=TextEditingController();
  TextEditingController etAddress=TextEditingController();
  TextEditingController etEmail=TextEditingController();
  TextEditingController etOwnerContact=TextEditingController();
  TextEditingController etTaxNumber=TextEditingController();
  TextEditingController etSate=TextEditingController();
  TextEditingController etSendMessage=TextEditingController();
  final formKey=GlobalKey<FormState>();
  var selectedState;
  var stateName=StateName().obs;
  RxString radioButtonItem = 'Yes'.obs;
  RxInt id = 1.obs;
  getStateNetworkApi()async{

    var response=await BaseClient().get(getState+"").catchError(BaseController().handleError);
    print("cxvcbcvb"+response);
    if(jsonDecode(response)["status"].toString()=="1")
    {

      stateName.value=stateNameFromJson(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }

  Future<bool> addLibraryNetworkApi()
  async
  {

    var bodyRequest =
    {
    "user_id":GetStorage().read(AppConstant.id).toString().trim(),
    "organization_name":etOrgName.text.toString().toString().trim(),
    "address":etAddress.text.toString().toString().trim(),
    "phone":etMobile.text.toString(),
    "email":etEmail.text.toString(),
    "owner_contact_no":etOwnerContact.text.toString(),
    "tax_no":etTaxNumber.text.toString(),
    "state_id":etSate.text,
    "currency":1.toString().trim(),
    "auto_message":id.value.toString()

    };



    Get.context!.loaderOverlay.show();
    var response = await BaseClient().post(addLibraryApi, bodyRequest).catchError(BaseController().handleError);
       Get.context!.loaderOverlay.hide();
    if (jsonDecode(response)["status"].toString()== "1")
    {
      BaseController().successSnack("Library added "+jsonDecode(response)["message"].toString());
      return true;
    }
    BaseController().errorSnack("This organization "+jsonDecode(response)["message"]+" please add another organization");
    return false;
  }



}