import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:librarymanagement/Auth/view/RegisterPage.dart';
import 'package:librarymanagement/Auth/view/VerifyOTP.dart';
import 'package:librarymanagement/Dashboard/dashboard.dart';
import 'package:librarymanagement/UtilsMethod/BaseController.dart';
import 'package:librarymanagement/UtilsMethod/base_client.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../AppConstant/APIConstant.dart';
import '../../AppConstant/AppConstant.dart';
import '../../NavBar/AddLibrary/AddLibrary.dart';
import '../model/StateName.dart';

class LoginController  extends GetxController
{
      RxInt selectedIndex = 0.obs;
      TextEditingController etMobile=TextEditingController();
      TextEditingController etName=TextEditingController();
      TextEditingController etEmail=TextEditingController();
      TextEditingController dob=TextEditingController();
      TextEditingController etZip=TextEditingController();
      TextEditingController etblock=TextEditingController();
      TextEditingController etSate=TextEditingController();
      TextEditingController etCity=TextEditingController();




      final formKey=GlobalKey<FormState>();
      GetStorage _storage=GetStorage();
      RxString rxPath="".obs;
      chooseImage(bool isCamera)
      async{
            final ImagePicker _picker = ImagePicker();
            try {
                  final XFile? image = await _picker.pickImage(source:isCamera?ImageSource.camera:ImageSource.gallery,imageQuality: 60);
                  if(image!=null)
                  {
                        rxPath.value=image.path;
                  }
            } on Exception catch (e) {
                  print("cxjkbjvkbsdjv"+e.toString());
            }

      }

      loginNetworkApi(String device_id )async
      {
            var bodyRequest=
            {
                  "mobile":etMobile.text,
                  "fcm_id":"",
                  "device_id":"",
            };
            print("djsfghj"+bodyRequest.toString());
            Get.context!.loaderOverlay.show();
            var response=await BaseClient().post(loginApi, bodyRequest).catchError(BaseController().handleError);
            Get.context!.loaderOverlay.hide();

            print("vsdfbfd"+etMobile.text);
            print(response);
            if(jsonDecode(response)["status"]==1)
            {
                  BaseController().successSnack(jsonDecode(response)["message"]+" "+jsonDecode(response)["Data"]["otp"]);
                  Get.to(()=>OtypVerifyPage(id: jsonDecode(response)["Data"]["id"],otp:jsonDecode(response)["Data"]["otp"] ,));
                  return;
            }
            BaseController().errorSnack(jsonDecode(response)["message"]);
      }
      verifyNetworkApi(String id,String otp)async
      {
            var bodyRequest=
                {
                  "id":id,
                  "otp":otp,
                };
            print("sfkhdfjg"+bodyRequest.toString());
            Get.context!.loaderOverlay.show();
            var response=await BaseClient().post(verfyApi, bodyRequest).catchError(BaseController().handleError);
            Get.context!.loaderOverlay.hide();
            print("jnvkxcvjnkdsv");
            print(response);
            if(jsonDecode(response)["status"]==1)
            {
                  if (jsonDecode(response)["Data"].isNotEmpty)
                  {
                        print("xvcvbb");
                        if(jsonDecode(response)["Data"]["id"].toString().isNotEmpty && jsonDecode(response)["Data"]["email"].toString().isNotEmpty)
                        {
                              print("xvcvbb1");
                              _storage.write(AppConstant.id, jsonDecode(response)["Data"]["id"]??"");
                              _storage.write(AppConstant.userId, jsonDecode(response)["Data"]["user_login"]??"");
                              _storage.write(AppConstant.userName, jsonDecode(response)["Data"]["name"]??"");
                              _storage.write(AppConstant.profileImg, jsonDecode(response)["Data"]["profile"]??"");
                              _storage.write(AppConstant.email, jsonDecode(response)["Data"]["email"]??"");
                              _storage.write(AppConstant.phone, jsonDecode(response)["Data"]["mobile"]??"");
                              _storage.write(AppConstant.zip, jsonDecode(response)["Data"]["zip_code"]??"");
                              _storage.write(AppConstant.type, jsonDecode(response)["Data"]["type"]??"");
                              _storage.write(AppConstant.organization_name, jsonDecode(response)["Data"]["organization_name"]??"");
                              Get.offAll(() => dashboard());
                        }
                        else
                        {
                               print("xvcvbb2");
                              _storage.write(AppConstant.id, jsonDecode(response)["Data"]["id"]??"");
                               Get.to(() => RegisterPage());
                        }
                        BaseController().successSnack(jsonDecode(response)["message"]);

                  }
            }
            else{
                  BaseController().errorSnack(jsonDecode(response)["message"]);
            }

      }
      signUpNetworkApi(String deviceId)async
      {    var bodyRequest=
            {     "name":etName.text.toString().trim(),
                  "email":etEmail.text.toString().trim(),
                  "mobile":etMobile.text.toString().trim(),
                  "id":_storage.read(AppConstant.id).toString().trim().trim(),
            };
            print("jhgffg"+bodyRequest.toString());
            print(bodyRequest);
            //Get.context!.loaderOverlay.show();
            var response=await BaseClient().post(signUpApi, bodyRequest).catchError(BaseController().handleError);
            print("response"+response);
            Get.context!.loaderOverlay.hide();
            if(jsonDecode(response)["status"]==1)
               {
                  BaseController().successSnack("successfully login");
                  _storage.write(AppConstant.id, jsonDecode(response)["Data"]["id"]??"");
                  _storage.write(AppConstant.userId, jsonDecode(response)["Data"]["user_login"]??"");
                  _storage.write(AppConstant.userName, jsonDecode(response)["Data"]["name"]??"");
                  _storage.write(AppConstant.profileImg, jsonDecode(response)["Data"]["profile"]??"");
                  _storage.write(AppConstant.email, jsonDecode(response)["Data"]["email"]??"");
                  _storage.write(AppConstant.phone, jsonDecode(response)["Data"]["mobile"]??"");
                  _storage.write(AppConstant.zip, jsonDecode(response)["Data"]["zip_code"]??"");
                  _storage.write(AppConstant.type, jsonDecode(response)["Data"]["type"]??"");
                  _storage.write(AppConstant.organization_name, jsonDecode(response)["Data"]["organization_name"]??"");
                   Get.offAll(() => dashboard());
                   return;
                }
            BaseController().errorSnack(jsonDecode(response)["message"]);
      }




}