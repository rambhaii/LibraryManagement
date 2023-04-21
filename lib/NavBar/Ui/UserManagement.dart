import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:librarymanagement/AllWidget/EditTextWidget.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';
import 'package:librarymanagement/NavBar/Controller/NavBarController.dart';

class UserManageMent extends StatefulWidget {
  const UserManageMent({Key? key}) : super(key: key);

  @override
  State<UserManageMent> createState() => _UserManageMentState();
}

class _UserManageMentState extends State<UserManageMent> {
  NavBarController controller=Get.put(NavBarController());
  List multipleSelected = [];
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Sunday",
    },
    {
      "id": 1,
      "value": false,
      "title": "Monday",
    },
    {
      "id": 2,
      "value": false,
      "title": "Tuesday",
    },
    {
      "id": 3,
      "value": false,
      "title": "Wednesday",
    },


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child:
        Stack(
          children: [

            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: AppBar(
                  backgroundColor: Colors.red.withOpacity(0.9),
                  title: Text("Manage Plan"),
                  actions: [

                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: RawMaterialButton(
                        constraints:
                        BoxConstraints(maxHeight: 40.h, minWidth: 40.w),
                        onPressed: ()
                        {
                          bottomSheet();
                          //controllerNotification.getNotificationListNetworkApi();
                          //  Get.to(()=>chats());
                        },
                        shape: CircleBorder(),
                        child: Image.asset(
                          "assets/images/addUser.png",
                          height: 20,
                          width: 20,
                          color: Colors.white,

                        ),
                      ),
                    ),

                  ],
                ),

              ),
            ),
          ],
        ),
        preferredSize: Size(
          double.infinity,
          60.0,
        ),
      ),
      body: Container(),
    );
  }
  void bottomSheet()
  {


    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withOpacity(0.1),
        isScrollControlled: true,
        backgroundColor: Colors.white70,
        builder: (context) {
          return Card(
            elevation: 10,
            child: SingleChildScrollView(
              child: Padding(padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ClipRRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          height: Get.height/1.13,
                          padding: EdgeInsets.all(10),
                          // height: h * 0.45,
                          width: double.infinity,
                          color: Colors.white70,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Container(
                                width: 40,
                                height: 6,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.5, color: Colors.black12),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              const SizedBox(height: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                [
                                   Text("Add User ",style: TextStyle(
                                     fontSize: 20,
                                     color: Colors.red
                                   ),),
                                  SizedBox(height: 10,),
                                  Container(
                                    child: Form(
                                      key: controller.formKey,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children:
                                        [

                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight: Radius.circular(5),
                                                    bottomLeft: Radius.circular(5),
                                                    topLeft: Radius.circular(5),
                                                    topRight: Radius.circular(5)),
                                                side: BorderSide(width: 1, color: Colors.grey)
                                            ),
                                            child: Center(
                                                child: DropdownButton(

                                                  isExpanded: true,
                                                  underline: Container(
                                                    height: 1,

                                                  ),

                                                  icon: const Icon(Icons.keyboard_arrow_down),
                                                  items:  <String>['Admin', 'Operator']
                                                      .map<DropdownMenuItem<String>>((String items) {
                                                    return DropdownMenuItem(


                                                      value: items,
                                                      child: Text(" " + items.toString(),
                                                          style: bodyText),
                                                    );
                                                  }).toList(),
                                                  hint: Text("  Select User Type",
                                                    style: bodyText.copyWith(color: Colors.red),),
                                                  onChanged: (newValue)
                                                  {

                                                    setState(() {

                                                    });


                                                  },
                                                )
                                            ),
                                          ),

                                          SizedBox(height: 10,),
                                          EditTextWidgetAddMember
                                            (
                                            hint: 'Insert  Name',
                                            type: TextInputType.text,
                                            length: 10,
                                            validator: (value)
                                            { if(value.toString().isEmpty)
                                            {
                                              return "Please Insert  Name";
                                            }
                                            return null;
                                            },

                                          ),
                                          SizedBox(height: 10,),
                                          EditTextWidgetAddMember(

                                            hint: 'Insert Mobile No.',
                                            validator: (value)
                                            { if(value.toString().isEmpty)
                                            {
                                              return "Please Enter Mobile No.";
                                            }
                                            return null;
                                            },
                                          ),
                                          SizedBox(height: 10,),
                                          EditTextWidgetAddMember(

                                            hint: 'Insert E-mail',
                                            validator: (value)
                                            { if(value.toString().isEmpty)
                                            {
                                              return "Please Insert  E-mail";
                                            }
                                            return null;
                                            },
                                          ),
                                          SizedBox(height: 10,),
                                          EditTextWidgetAddMember(

                                            hint: 'Insert Password ',
                                            validator: (value)
                                            { if(value.toString().isEmpty)
                                            {
                                              return "Please Insert Password";
                                            }
                                            return null;
                                            },
                                          ),
                                          EditTextWidgetAddMember(

                                            hint: 'Re-Enter Password ',
                                            validator: (value)
                                            { if(value.toString().isEmpty)
                                            {
                                              return "Re-Enter Password";
                                            }
                                            return null;
                                            },
                                          ),

                                          SizedBox(height: 10,),
                                          Text("Permissions :",style: bodyText.copyWith(color: Colors.red),),
                                          Column(
                                            children: [
                                              GridView.count(
                                                physics: ScrollPhysics(),
                                                crossAxisCount: 3,
                                                //crossAxisSpacing: 2.0,
                                               // mainAxisSpacing: 10.0,
                                                childAspectRatio: 2/0.8,
                                                shrinkWrap: true,
                                                children:  List.generate(checkListItems.length, (index) => CheckboxListTile(
                                                  controlAffinity: ListTileControlAffinity.leading,
                                                  contentPadding: EdgeInsets.zero,
                                                  dense: true,
                                                  title: Text(
                                                    checkListItems[index]["title"],
                                                    style: const TextStyle(
                                                      fontSize: 10.0,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  value: checkListItems[index]["value"],
                                                  onChanged: (value) {
                                                    setState(() {
                                                      checkListItems[index]["value"] = value;
                                                      if (multipleSelected.contains(checkListItems[index])) {
                                                        multipleSelected.remove(checkListItems[index]);
                                                      } else {
                                                        multipleSelected.add(checkListItems[index]);
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Center(
                                            child:
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.zero,
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30)
                                                  )
                                              ),
                                              onPressed: () {},
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
                                                    borderRadius: BorderRadius.circular(5)
                                                ),
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                                                  child: const Text('   Submit  ', textAlign: TextAlign.center),
                                                ),
                                              ),
                                            ),
                                          ),





                                        ],
                                      ),
                                    ),
                                  )




                                ],
                              ),

                            ],
                          ),

                        )
                    ),

                  )
              ),
            ),
          );
        }
    );
  }



}
