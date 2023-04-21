import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class LoginController  extends GetxController
{
      RxInt selectedIndex = 0.obs;
      TextEditingController etMobile=TextEditingController();
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


}