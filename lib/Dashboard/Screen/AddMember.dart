import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:librarymanagement/AllWidget/EditTextWidget.dart';
import 'package:librarymanagement/Auth/controller/LoginController.dart';
import 'package:librarymanagement/ConstantVariable/CustomAppBarWidget.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';

class AddMember extends StatefulWidget
{
  const AddMember({Key? key}) : super(key: key);

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  LoginController loginController=Get.put(LoginController());
  String radioButtonItem = 'Male';
  int id = 1;

  Widget imageProfile()
  {
    return Container(
      height: 83,
      width: 83,
      child: Stack(
        children: [

         Obx(() =>loginController.rxPath.value.isEmpty?
          Container(
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              border: Border.all(),
              image:  DecorationImage(
                  //image: NetworkImage(BASE_URL+controller.image),fit: BoxFit.fill
                  image: NetworkImage(""),fit: BoxFit.fill
              ),
            ),
            child: Container(

            ),
          )
                : Container(
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              border: Border.all(),
              image:  DecorationImage(
                  image: FileImage(File(loginController.rxPath.value)),fit: BoxFit.fill
              ),
            ),

          ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(onTap: (){
                showOptionDailog(context);
              },child: Icon(Icons.camera_alt_rounded,size: 20,color: Colors.grey,),)),
        ],
      ),
    );

  }
  showOptionDailog(BuildContext context) {
    return showDialog(context: context, builder: (context) =>
        SimpleDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          backgroundColor: Theme
              .of(context)
              .dialogBackgroundColor
              .withOpacity(0.9),
          children: [
            SimpleDialogOption(
              onPressed: () {
                loginController.chooseImage(false);
                Get.back();
              },
              child: Row(
                children: [
                  Icon(Icons.image),
                  Text("   Gallery", style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,)
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {  loginController.chooseImage(true);

              Get.back();
              },
              child: Row(
                children: [
                  Icon(Icons.camera),
                  Text("   Camera", style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,)
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Get.back(),
              child: Row(
                children: [
                  Icon(Icons.clear),
                  Text("  Cancel", style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,)
                ],
              ),
            ),
          ],
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            60.0,
          ),
          child: CustomAppBar(
              title:"Add Member"

          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
                   SizedBox(height: 20.h,),
                  Center(
                    child: Card(
                      child: Container(
                        height: 90.h,
                        width: 110.w,


                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.red,)

                        ),
                        child: Row(
                          children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                imageProfile(),
                SizedBox(width: 20,),
                Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text("", style: bodyText.copyWith(fontSize: 17,
                                fontWeight: FontWeight.w800)),
                            SizedBox(height: 4,),
                            Text("",style:bodyText,overflow: TextOverflow.ellipsis,maxLines: 2,),
                          ],
                        ),
                ),
              ],
            ),
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [

                  Expanded(
                      flex: 10,
                      child: Form(
                        key: loginController.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [

                            Text(" Member Id :",style: bodyText.copyWith(color: Colors.red),),
                            TextFormField(
                                decoration:  InputDecoration
                                  (

                                    prefixIconConstraints: BoxConstraints(minWidth: 45,
                                    ),


                                    border: OutlineInputBorder(),
                                    hintText: "Insert Member Id",
                                    isDense: true,
                                    counter: Offstage(),
                                    contentPadding:const EdgeInsets.symmetric(horizontal: 6, vertical: 8),


                                ),

                                keyboardType: TextInputType.text,
                                style: bodyText
                            ),
                            SizedBox(height: 10,),
                            EditTextWidgetAddMember
                              (
                              hint: 'Mobile Number',
                              type: TextInputType.phone,
                              length: 10,
                              validator: (value)
                              { if(value.toString().isEmpty)
                              {
                                return "Please Enter Name";
                              }
                              return null;
                              },

                            ),
                            SizedBox(height: 10,),
                            EditTextWidgetAddMember(

                              hint: 'E-mail',
                              validator: (value)
                              { if(value.toString().isEmpty)
                              {
                                return "Please Enter Name";
                              }
                              return null;
                              },
                            ),
                            SizedBox(height: 10,),
                            EditTextWidgetAddMember(

                              hint: 'Address',
                              validator: (value)
                              { if(value.toString().isEmpty)
                              {
                                return "Please Enter Name";
                              }
                              return null;
                              },
                            ),
                            SizedBox(height: 10,),
                            Text("Gender ",style: bodyText.copyWith(color: Colors.red),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Radio(
                                  value: 1,
                                  groupValue: id,
                                  fillColor:  MaterialStateColor.resolveWith((states) => Colors.red) ,
                                  onChanged: (val) {
                                    setState(() {
                                      radioButtonItem = 'Male';
                                      id = 1;
                                    });
                                  },
                                ),
                                Text(
                                  'Male',
                                  style: new TextStyle(fontSize: 17.0),
                                ),

                                Radio(
                                  value: 2,
                                  groupValue: id,
                                  fillColor:  MaterialStateColor.resolveWith((states) => Colors.red) ,
                                  onChanged: (val)
                                  {
                                    setState(() {
                                      radioButtonItem = 'Female';
                                      id = 2;
                                    });
                                  },
                                ),
                                Text(
                                  'Female',
                                  style: new TextStyle(
                                    fontSize: 17.0,
                                  ),
                                ),


                              ],
                            ),





                          ],
                        ),
                      )),
                ],
              ),
            ),

                   ],
        ),
      ),

    );
  }
}
