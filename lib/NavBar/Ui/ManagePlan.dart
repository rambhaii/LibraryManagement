import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:librarymanagement/AllWidget/EditTextWidget.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';
import 'package:librarymanagement/NavBar/Controller/NavBarController.dart';

class ManagePlan extends StatefulWidget {
  const ManagePlan({Key? key}) : super(key: key);

  @override
  State<ManagePlan> createState() => _ManagePlanState();
}

class _ManagePlanState extends State<ManagePlan> with TickerProviderStateMixin
{
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

    return
      Scaffold(
          appBar: PreferredSize(
            child:
            Stack(
              children: [

                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child:
                    AppBar(
                      backgroundColor: Colors.red.withOpacity(0.9),
                      title: Text("Manage Plan"),
                      actions: [


                        RawMaterialButton(
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
                            "assets/images/document.png",
                            height: 40,
                            width: 40,
                            color: Colors.white,

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
                                  Text("  Plan Type",style:bodyText.copyWith(fontWeight: FontWeight.w900,color: Colors.red) ,),
                                 Obx(() =>  Card(

                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      side: BorderSide(width: 1, color: Colors.grey)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30)
                                              )
                                          ),
                                          onPressed: () {
                                            controller.status.value=1;
                                          },
                                          child: Container(
                                            decoration: controller.status.value==1?BoxDecoration(
                                                gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
                                                borderRadius: BorderRadius.circular(5)
                                            ):BoxDecoration(
                                                gradient: LinearGradient(colors: [Colors.white, Colors.white]),
                                                borderRadius: BorderRadius.circular(5)
                                            ),
                                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                                            child:  Text('Single Shift', textAlign: TextAlign.center,style: bodyText.copyWith(color: controller.status.value==1?Colors.white:Colors.black,fontSize: 15),),
                                          ),
                                        ),
                                        Spacer(),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30)
                                              )
                                          ),
                                          onPressed: () {
                                            controller.status.value=2;
                                          },
                                          child: Container(
                                            decoration: controller.status.value==2?BoxDecoration(
                                                gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
                                                borderRadius: BorderRadius.circular(5)
                                            ):BoxDecoration(
                                                gradient: LinearGradient(colors: [Colors.white, Colors.white]),
                                                borderRadius: BorderRadius.circular(5)
                                            ),
                                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                                            child:  Text('Multiple Shift', textAlign: TextAlign.center,style: bodyText.copyWith(color: controller.status.value==2?Colors.white:Colors.black,fontSize: 15),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                                  SizedBox(height: 10,),
                               Obx(() => controller.status.value==1? Container(
                                 child: Form(
                                   key: controller.formKey,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
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
                                             child:
                                             DropdownButton(

                                               isExpanded: true,
                                               underline: Container(
                                                 height: 4,

                                               ),

                                               icon: const Icon(Icons.keyboard_arrow_down),
                                               items:  <String>['Dog', 'Cat', 'Tiger', 'Lion']
                                                   .map<DropdownMenuItem<String>>((String items) {
                                                 return DropdownMenuItem(
                                                   value: items,
                                                   child: Text(" " + items.toString(),
                                                       style: bodyText),
                                                 );
                                               }).toList(),
                                               hint: Text("  Select your plan",
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
                                         hint: 'Insert Plan Name',
                                         type: TextInputType.text,
                                         length: 10,
                                         validator: (value)
                                         { if(value.toString().isEmpty)
                                         {
                                           return "Please Insert Plan Name";
                                         }
                                         return null;
                                         },

                                       ),
                                       SizedBox(height: 10,),
                                       EditTextWidgetAddMember(

                                         hint: 'Enter Amount',
                                         validator: (value)
                                         { if(value.toString().isEmpty)
                                         {
                                           return "Please Enter Amount";
                                         }
                                         return null;
                                         },
                                       ),
                                       SizedBox(height: 10,),
                                       EditTextWidgetAddMember(

                                         hint: 'Insert Duration in days',
                                         validator: (value)
                                         { if(value.toString().isEmpty)
                                         {
                                           return "Please Insert Duration in days";
                                         }
                                         return null;
                                         },
                                       ),
                                       SizedBox(height: 10,),
                                       EditTextWidgetAddMember(

                                         hint: 'Insert Description ',
                                         validator: (value)
                                         { if(value.toString().isEmpty)
                                         {
                                           return "Please Insert Description";
                                         }
                                         return null;
                                         },
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
                               ):Container(
                                 child: Form(
                                   key: controller.formKey,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children:
                                     [
                                    Column(
                                      children:List.generate(
                                            checkListItems.length,
                                            (index) => CheckboxListTile(
                                          controlAffinity: ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          dense: true,
                                          title: Text(
                                            checkListItems[index]["title"],
                                            style: const TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.black,
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
                                    ),
                                      /* const SizedBox(height: 64.0),
                                       Text(
                                         multipleSelected.isEmpty ? "" : multipleSelected.toString(),
                                         style: const TextStyle(
                                           fontSize: 22.0,
                                           color: Colors.black,
                                           fontWeight: FontWeight.bold,
                                         ),
                                    )*/

                                       SizedBox(height: 10,),
                                       EditTextWidgetAddMember
                                         (
                                         hint: 'Insert Plan Name',
                                         type: TextInputType.text,
                                         length: 10,
                                         validator: (value)
                                         { if(value.toString().isEmpty)
                                         {
                                           return "Please Insert Plan Name";
                                         }
                                         return null;
                                         },

                                       ),
                                       SizedBox(height: 10,),
                                       EditTextWidgetAddMember(

                                         hint: 'Enter Amount',
                                         validator: (value)
                                         { if(value.toString().isEmpty)
                                         {
                                           return "Please Enter Amount";
                                         }
                                         return null;
                                         },
                                       ),
                                       SizedBox(height: 10,),
                                       EditTextWidgetAddMember(

                                         hint: 'Insert Duration in days',
                                         validator: (value)
                                         { if(value.toString().isEmpty)
                                         {
                                           return "Please Insert Duration in days";
                                         }
                                         return null;
                                         },
                                       ),
                                       SizedBox(height: 10,),
                                       EditTextWidgetAddMember(

                                         hint: 'Insert Description ',
                                         validator: (value)
                                         { if(value.toString().isEmpty)
                                         {
                                           return "Please Insert Description";
                                         }
                                         return null;
                                         },
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
                               ))

                                  ,


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
