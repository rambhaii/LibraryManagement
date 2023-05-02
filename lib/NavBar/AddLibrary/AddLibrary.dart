
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:librarymanagement/Auth/controller/LoginController.dart';

import '../../AllWidget/EditTextWidget.dart';
import '../../Auth/model/StateName.dart';
import '../../ConstantVariable/textStryle.dart';
import 'AddLibraryController.dart';

class AddLibrary extends StatefulWidget {
   AddLibrary({Key? key}) : super(key: key);

  @override
  State<AddLibrary> createState() => _AddLibraryState();
}

class _AddLibraryState extends State<AddLibrary> {
   AddLibraryController controller=Get.put(AddLibraryController());
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getStateNetworkApi();
  }

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
                    title: Text("Manage Library"),
                    actions: [
                      RawMaterialButton(
                        constraints:
                        BoxConstraints(maxHeight: 40.h, minWidth: 40.w),
                        onPressed: ()
                        {

                          bottomSheet(context);

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
           );
  }

  void bottomSheet(BuildContext context)
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
                                  Center(child: Text(" Add Library ",style:bodyText.copyWith(fontWeight: FontWeight.w900,color: Colors.red) ,)),

                                  SizedBox(height: 10,),

                                  Container(
                                    child: Form
                                       (
                                      key: controller.formKey,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:
                                        [
                                          SizedBox(height: 10,),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: EditTextWidgetAddMember
                                              (
                                              controller: controller.etOrgName,
                                              hint: 'Insert Organization Name',
                                              type: TextInputType.text,
                                              length: 10,
                                              validator: (value)
                                              { if(value.toString().isEmpty)
                                              {
                                                return "Please Insert Organization Name";
                                              }
                                              return null;
                                              },

                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: EditTextWidgetAddMember(
                                              controller: controller.etAddress,

                                              hint: 'Insert Address ',
                                              validator: (value)
                                              { if(value.toString().isEmpty)
                                              {
                                                return "Please Enter Address";
                                              }
                                              return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: EditTextWidgetAddMember(
                                              controller: controller.etMobile,

                                              length:10,
                                              type: TextInputType.phone,
                                              hint: 'Insert Mobile no.',
                                              validator: (value)
                                              { if(value.toString().isEmpty)
                                              {
                                                return "Please Insert Mobile no";
                                              }
                                              return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: EditTextWidgetAddMember(
                                              controller: controller.etEmail,
                                              hint: 'Insert E-mail ID ',
                                              validator: (value)
                                              { if(value.toString().isEmpty)
                                              {
                                                return "Please Insert E-mail ID";
                                              }
                                              if(!GetUtils.isEmail(value))
                                              {
                                                return "Please Enter Valid E-mail ID";
                                              }
                                              return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: EditTextWidgetAddMember(
                                              controller: controller.etOwnerContact,
                                              hint: 'Insert Owner Contact No.',
                                              type: TextInputType.phone,
                                              length: 10,
                                              validator: (value)
                                              { if(value.toString().isEmpty)
                                              {
                                                return "Please Insert Owner Contact No";
                                              }

                                              return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: EditTextWidgetAddMember
                                              (
                                              controller: controller.etTaxNumber,
                                              hint: 'Insert Tax Number',
                                              type: TextInputType.number,
                                              validator: (value)
                                              { if(value.toString().isEmpty)
                                              {
                                                return "Please Insert Tax Number";
                                              }

                                              return null;
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight: Radius.circular(5),
                                                    bottomLeft: Radius.circular(5),
                                                    topLeft: Radius.circular(5),
                                                    topRight: Radius.circular(5)),
                                                    side: BorderSide(width: 1, color: Colors.grey)
                                               ),
                                            child:Padding(
                                              padding: const EdgeInsets.only(left: 10.0,right: 20),
                                              child: Obx(()=>controller.stateName.value.data!=null?
                                              DropdownButton
                                                (
                                                value: controller.selectedState,
                                                isExpanded: true,
                                                underline: Container(
                                                  height: 2,
                                                  decoration: const BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Colors.white,
                                                        width: 0.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                icon: const Icon(Icons.keyboard_arrow_down),
                                                items: controller.stateName.value.data!.map((Datum items)
                                                {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child: Text(" "+items.stateTitle.toString(),style:bodyText),
                                                  );
                                                }).toList(),
                                                hint: Text("Select State",style: bodyText.copyWith(color: Colors.red),),
                                                onChanged: (newValue)
                                                {
                                                  controller.selectedState=newValue;
                                                  controller.etSate.text=controller.selectedState.stateId;
                                                  controller.stateName.refresh();

                                                },
                                              ):const Center(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("  Auto Msg Send ",style: bodyText.copyWith(color: Colors.red),),
                                          Obx(() =>Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>
                                               [
                                              Radio(
                                                value: 1,
                                                groupValue: controller.id.value,
                                                fillColor:  MaterialStateColor.resolveWith((states) => Colors.red) ,
                                                onChanged: (val)
                                                {
                                                  controller.radioButtonItem.value = 'Yes';
                                                  controller.id.value = 1;
                                                },
                                              ),
                                              Text(
                                                'Yes',
                                                style: new TextStyle(fontSize: 17.0),
                                              ),

                                              Radio(
                                                value: 2,
                                                groupValue: controller.id.value,
                                                fillColor:  MaterialStateColor.resolveWith((states) => Colors.red) ,
                                                onChanged: (val)
                                                {  controller.radioButtonItem.value = 'No';
                                                   controller.id.value = 2;
                                                  },
                                              ),
                                              Text(
                                                'No',
                                                style: new TextStyle(
                                                  fontSize: 17.0,
                                                ),
                                              ),
                                            ],
                                          ) ),
                                          SizedBox(height: 15,),
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
                                              onPressed: ()
                                              async{
                                                if(controller.formKey.currentState!.validate())
                                                {
                                                  bool? status=await  controller.addLibraryNetworkApi();
                                                  if(status)
                                                    {
                                                      controller.formKey.currentState!.reset();
                                                      controller.etOrgName.clear();
                                                      controller.etAddress.clear();
                                                      controller.etMobile.clear();
                                                      controller.etEmail.clear();
                                                      controller.etOwnerContact.clear();
                                                      controller.etSate.clear();
                                                      controller.etOwnerContact.clear();
                                                      Navigator.pop(context);


                                                    }
                                                }


                                              },
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
                                  ),],
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
