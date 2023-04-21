import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';
import 'package:librarymanagement/NavBar/Controller/NavBarController.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ManageNotice extends StatefulWidget {
  const ManageNotice({Key? key}) : super(key: key);

  @override
  State<ManageNotice> createState() => _ManageNoticeState();
}

class _ManageNoticeState extends State<ManageNotice> {
 NavBarController controller=Get.put(NavBarController());





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
                  child: AppBar(
                    backgroundColor: Colors.red.withOpacity(0.9),
                    title: Text("Manage Notice"),
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
        body:
        Container()
        ,
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
                        child:
                        Container(
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
                                  SizedBox(height: 10,),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(" Notice ",style: bodyText.copyWith(color: Colors.red),),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight: Radius.circular(10),
                                                    topRight: Radius.circular(10)),
                                                side: BorderSide(width: 1, color: Colors.grey)
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Center(
                                                child: TextFormField(
                                                    minLines: 5,
                                                    maxLines: null,
                                                    keyboardType:
                                                    TextInputType.multiline,
                                                    decoration:  InputDecoration
                                                      (
                                                      prefixIconConstraints: BoxConstraints(minWidth: 10,
                                                      ),

                                                      border: OutlineInputBorder(
                                                          borderSide:BorderSide.none
                                                      ),
                                                      alignLabelWithHint: true,

                                                      hintText: "Write Here.....",


                                                      isDense: true,
                                                      counter: Offstage(),
                                                      contentPadding:const EdgeInsets.symmetric(horizontal: 1.5, vertical: 10),
                                                    ),

                                                    style: bodyText.copyWith(fontSize: 14)
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Start Date ",style: bodyText.copyWith(color: Colors.red),),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight: Radius.circular(10),
                                                    topRight: Radius.circular(10)),
                                                side: BorderSide(width: 1, color: Colors.grey)
                                               ),
                                            child: Center(
                                              child: TextFormField(
                                                controller:controller.textDate,

                                                  decoration:  InputDecoration
                                                    (
                                                    prefixIconConstraints: BoxConstraints(minWidth: 20,
                                                    ),

                                                    border: OutlineInputBorder(
                                                        borderSide:BorderSide.none
                                                    ),
                                                    hintText: "Select date",
                                                    isDense: true,
                                                    counter: Offstage(),
                                                    contentPadding:const EdgeInsets.symmetric(horizontal: 1.5, vertical: 5),
                                                  ),
                                                   readOnly: true,
                                                  onTap: ()
                                                  async{
                                                    final Datet = await
                                                    showDatePicker(
                                                        context: context,
                                                        builder: (context, child) {
                                                          return Theme(
                                                            data: Theme.of(context).copyWith(
                                                              colorScheme: ColorScheme.light(
                                                                primary: Colors.white, // <-- SEE HERE
                                                                onPrimary: Colors.redAccent, // <-- SEE HERE
                                                                onSurface: Colors.black, // <-- SEE HERE
                                                              ),
                                                              textButtonTheme: TextButtonThemeData(
                                                                style: TextButton.styleFrom(
                                                                  primary: Colors.red, // button text color
                                                                ),
                                                              ),
                                                            ),
                                                            child: child!,
                                                          );
                                                        },




                                                        initialDate: DateTime.now(),
                                                        firstDate: DateTime.now(),
                                                        lastDate: DateTime(2050));
                                                    if(Datet !=null)
                                                    {
                                                      String formattedDate= DateFormat('d MMMM y ,EEEE').format(Datet);
                                                      controller.textDate.text=formattedDate;

                                                    }
                                                  },
                                                  keyboardType: TextInputType.text,
                                                  style: bodyText.copyWith(fontSize: 14)
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("End Date ",style: bodyText.copyWith(color: Colors.red),),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight: Radius.circular(10),
                                                    topRight: Radius.circular(10)),
                                                side: BorderSide(width: 1, color: Colors.grey)
                                            ),
                                            child: Center(
                                              child: TextFormField(
                                                  controller:controller.textDate,

                                                  decoration:  InputDecoration
                                                    (
                                                    prefixIconConstraints: BoxConstraints(minWidth: 20,
                                                    ),

                                                    border: OutlineInputBorder(
                                                        borderSide:BorderSide.none
                                                    ),
                                                    hintText: "Select Date",
                                                    isDense: true,
                                                    counter: Offstage(),
                                                    contentPadding:const EdgeInsets.symmetric(horizontal: 1.5, vertical: 5),
                                                  ),
                                                  readOnly: true,
                                                  onTap: ()
                                                  async{
                                                    final Datet = await
                                                    showDatePicker(
                                                        context: context,
                                                        builder: (context, child) {
                                                          return Theme(
                                                            data: Theme.of(context).copyWith(
                                                              colorScheme: ColorScheme.light(
                                                                primary: Colors.white, // <-- SEE HERE
                                                                onPrimary: Colors.redAccent, // <-- SEE HERE
                                                                onSurface: Colors.black, // <-- SEE HERE
                                                              ),
                                                              textButtonTheme: TextButtonThemeData(
                                                                style: TextButton.styleFrom(
                                                                  primary: Colors.red, // button text color
                                                                ),
                                                              ),
                                                            ),
                                                            child: child!,
                                                          );
                                                        },
                                                        initialDate: DateTime.now(),
                                                        firstDate: DateTime.now(),
                                                        lastDate: DateTime(2050));
                                                    if(Datet !=null)
                                                    {
                                                      String formattedDate= DateFormat('d MMMM y ,EEEE').format(Datet);
                                                      controller.textDate.text=formattedDate;

                                                    }
                                                  },
                                                  keyboardType: TextInputType.text,
                                                  style: bodyText.copyWith(fontSize: 14)
                                              ),
                                            ),
                                          ),



                                          SizedBox(height: 10,),
                                          Text("Visible To",style: bodyText.copyWith(color: Colors.red),),
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
                                                  items:  <String>['User', 'Member', 'Both']
                                                      .map<DropdownMenuItem<String>>((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(" " + items.toString(),
                                                          style: bodyText),
                                                    );
                                                  }).toList(),
                                                  hint: Text(" Show Notice to",
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
