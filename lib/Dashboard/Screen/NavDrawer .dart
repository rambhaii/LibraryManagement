

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';
import 'package:librarymanagement/Dashboard/Controller/DashboardController.dart';
import 'package:librarymanagement/Dashboard/Model/datamodel.dart';
import 'package:librarymanagement/Dashboard/Screen/Profile.dart';
import 'package:librarymanagement/NavBar/SeatUi/AddAndDelete.dart';
import 'package:librarymanagement/NavBar/Ui/CollectionGraph.dart';
import 'package:librarymanagement/NavBar/Ui/EnrollmentFee.dart';
import 'package:librarymanagement/NavBar/Ui/InvoiceManagement.dart';
import 'package:librarymanagement/NavBar/Ui/ManageNotice.dart';
import 'package:librarymanagement/NavBar/Ui/ManagePlan.dart';
import 'package:librarymanagement/NavBar/Ui/TaxManagement.dart';
import 'package:librarymanagement/NavBar/Ui/UserManagement.dart';

class NavDrawer extends StatefulWidget
{
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  DashBoardController controller = Get.put(DashBoardController());

 /* late bool isSelected=false;
  int id=0;
  _onExpansion(bool expanding, int id)
  { onExpansionChanged:  _onExpansion(true,1),
    initiallyExpanded: id==1?isSelected==true?true:false:false,

      expanding!=

    setState(()
    {
      if (expanding)
      {
        id=id;
        isSelected=true;
      }else{
        isSelected=false;
        id=id;
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent.withOpacity(0.2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                              fit: BoxFit.fill),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 0,
                                color: Colors.amber.withOpacity(0.3))
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: InkWell(
                      onTap: () {
                        Get.to(Profile());
                      },
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Ram",
                                  style: bodyText,
                                ),
                                Icon(
                                  Icons.edit,
                                  size: 20,
                                )
                              ],
                            ),
                            Text("ram@gmail.com", style: bodyText),
                          ]),
                    ),
                  ),
                ],
              ),
            ),

            /*  NetworkImage(BASE_URL +
                                controller.serviceModel.value.data![index].image.toString()
                                  )*/

            decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.9),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/logo.png'))),
          ),
          Container(
            height: 30.h,
            color: Colors.greenAccent,
            child: Text(
              "LIB ID (GL-4093)",
              style: headingText,
            ),
            alignment: AlignmentDirectional.center,
          ),

          Divider(
            height: 5,
            color: Colors.red.withOpacity(0.6),
          ),
          ExpansionTile(

            iconColor: Colors.red,
            textColor: Colors.red,
            leading: Icon(Icons.input),
            title: Text('Master'),
            children:   List<Widget>.generate(controller.reportMessageList.length!, (i) =>
                ListTile
                  (
                     onTap: (){
                       if(i==0)
                         {
                           Get.to(EnrollmentFee());
                         }
                       else if(i==1)
                         {
                           Get.to(ManagePlan());
                         }
                       else if(i==2) {
                         Get.to(UserManageMent());
                       }
                       else if(i==3) {
                         Get.to(TaxManageMent());
                       }
                       else if(i==4) {
                         Get.to(ManageNotice());
                       }
                       else if(i==5) {Get.to(InvoiceManagement());}
                       else if(i==6) {Get.to(CollectionGragh());}
                       },
                    leading: Icon(controller.reportMessageList!.value[i]["icon"]),
                    title: Text('${controller.reportMessageList!.value[i]["title"]}')
                ),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.red.withOpacity(0.6),
          ),
          ExpansionTile(

            iconColor: Colors.red,

            textColor: Colors.red,


            leading: Icon(Icons.input),
            title: Text('Seat'),
            children:   List<Widget>.generate(controller.reportMessageList.length!, (i) =>
                ListTile
                  (
                       onTap: (){
                         if(i==0)
                         {
                           Get.to(AddnDeleteSeate());
                         }
                       },
                    leading: Icon(controller.reportMessageList!.value[i]["icon"]),
                    title: Text('${controller.reportMessageList!.value[i]["title"]}')
                ),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.red.withOpacity(0.6),
          ),
          ExpansionTile(

            iconColor: Colors.red,

            textColor: Colors.red,


            leading: Icon(Icons.input),
            title: Text('Member'),
            children:   List<Widget>.generate(controller.reportMessageList.length!, (i) =>
                ListTile
                  (

                    leading: Icon(controller.reportMessageList!.value[i]["icon"]),
                    title: Text('${controller.reportMessageList!.value[i]["title"]}')
                ),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.red.withOpacity(0.6),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Enquiry Management'),
            onTap: () => {},
          ),
          Divider(
            height: 5,
            color: Colors.red.withOpacity(0.6),
          ),


          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Manage Expenses'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Divider(
            height: 5,
            color: Colors.red.withOpacity(0.6),
          ),
          ExpansionTile(

            iconColor: Colors.red,
            textColor: Colors.red,
            leading: Icon(Icons.input),
            title: Text('Attendance'),
            children:   List<Widget>.generate(controller.reportMessageList.length!, (i) =>
                ListTile
                  (

                    leading: Icon(controller.reportMessageList!.value[i]["icon"]),
                    title: Text('${controller.reportMessageList!.value[i]["title"]}')
                ),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.red.withOpacity(0.6),
          ),
          ExpansionTile(

            iconColor: Colors.red,
            textColor: Colors.red,
            leading: Icon(Icons.input),
            title: Text('SMS'),
            children:   List<Widget>.generate(controller.reportMessageList.length!, (i) =>
                ListTile
                  (

                    leading: Icon(controller.reportMessageList!.value[i]["icon"]),
                    title: Text('${controller.reportMessageList!.value[i]["title"]}')
                ),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.red.withOpacity(0.6),
          ),
          ExpansionTile(

            iconColor: Colors.red,

            textColor: Colors.red,


            leading: Icon(Icons.input),
            title: Text('Reports'),
            children:   List<Widget>.generate(controller.reportMessageList.length!, (i) =>
                ListTile
                  (

                    leading: Icon(controller.reportMessageList!.value[i]["icon"]),
                    title: Text('${controller.reportMessageList!.value[i]["title"]}')
                ),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.red.withOpacity(0.6),
          ),
          ExpansionTile(

            iconColor: Colors.red,

            textColor: Colors.red,


            leading: Icon(Icons.input),
            title: Text('Communicate'),
            children:   List<Widget>.generate(controller.reportMessageList.length!, (i) =>
                ListTile
                  (

                    leading: Icon(controller.reportMessageList!.value[i]["icon"]),
                    title: Text('${controller.reportMessageList!.value[i]["title"]}')
                ),
            ),
          ),
          Divider(
            height: 5,
            color: Colors.red.withOpacity(0.6),
          ),



          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Generate QR Code'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Divider(
            height: 5,
            color: Colors.red.withOpacity(0.6),
          ),
          ListTile(

            title: Text('Virsion 1.0.1'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
