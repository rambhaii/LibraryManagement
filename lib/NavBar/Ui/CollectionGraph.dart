import 'dart:math';
import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';
import 'package:librarymanagement/NavBar/Controller/NavBarController.dart';

class CollectionGragh extends StatefulWidget {
  const CollectionGragh({Key? key}) : super(key: key);

  @override
  State<CollectionGragh> createState() => _CollectionGraghState();
}

class _CollectionGraghState extends State<CollectionGragh> {
  NavBarController controller=Get.put(NavBarController());

  String data="";
  List multipleSelected = [];
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "January ",
    },
    {
      "id": 1,
      "value": false,
      "title": "February",
    },
    {
      "id": 2,
      "value": false,
      "title": "March",
    },
    {
      "id": 3,
      "value": false,
      "title": "April",
    },
    {
      "id": 4,
      "value": false,
      "title": "May",
    },
    {
      "id": 5,
      "value": false,
      "title": "June",
    },
    {
      "id": 6,
      "value": false,
      "title": "July",
    }, {
      "id": 7,
      "value": false,
      "title": "August",
    },
    {
      "id": 8,
      "value": false,
      "title": "September",
    },
    {
      "id": 9,
      "value": false,
      "title": "October",
    },
    {
      "id": 10,
      "value": false,
      "title": "November",
    },
    {
      "id": 11,
      "value": false,
      "title": "December",
    },



  ];



  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
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
                    actions:
                            [
                              Container(
                                height: 30,
                                width: 30,
                                child:PopupMenuButton<int>(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.adaptive.more,
                                    color: Colors.white,
                                  ),

                                  itemBuilder: (context) => List.generate(controller.reportMessageList.value.length,
                                        (index) => PopupMenuItem(
                                      height: 30,
                                      child: Text(
                                        controller.reportMessageList.value[index].toString(),
                                        style: bodyText,
                                      ),
                                      onTap: ()
                                      {
                                        /* if (controller.userType == "Guest")
                                        {
                                          UtilsMethod.PopupBox(context, controller.reportPostApi.value
                                              .data![index].title
                                              .toString());
                                        } else {

                                          controller.postReportNetworkApi(
                                              controller.reportPostApi.value
                                                  .data![index].id
                                                  .toString(),
                                              data.id.toString());
                                        }*/
                                      },
                                    ),
                                  ),
                                  offset: Offset(0, 30),
                                  color: Colors.white,
                                  elevation: 2,
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
      Column(
        children: [
          Container(
            height: 400,
            child: Padding(
                padding: const EdgeInsets.all(30),
                child: PieChart(


                    PieChartData(
                    borderData: FlBorderData(show: false),
                    centerSpaceRadius:70,
                    sectionsSpace: 2,
                    pieTouchData:PieTouchData(enabled: true,longPressDuration: Duration(seconds: 2)) ,
                    centerSpaceColor: Colors.white,

                    sections:
                    [
                      PieChartSectionData(title:data , color: Colors.purple, radius: 100,),

                    /*  PieChartSectionData(value: 40, color: Colors.amber, radius: 100),
                      PieChartSectionData(value: 55, color: Colors.green, radius: 100),
                      PieChartSectionData(value: 70, color: Colors.orange, radius: 100),*/
                    ])
                )
            ),
          ),
          Column(
            children: [
              GridView.count(
                physics: ScrollPhysics(),
                crossAxisCount: 3,
                //crossAxisSpacing: 2.0,
                // mainAxisSpacing: 10.0,
                childAspectRatio: 2/0.8,
                shrinkWrap: true,
                children:  List.generate(checkListItems.length, (index) =>
                    CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    checkListItems[index]["title"],

                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.red,
                    ),
                  ),
                  //checkColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                   activeColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                   side:   BorderSide(color: Colors.primaries[Random().nextInt(Colors.primaries.length)],),
                   checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20,),
                    side: BorderSide(color: Colors.red,)
                  ),
                  value: checkListItems[index]["value"],
                  onChanged: (value)
                  {


                    setState(() {
                      data=checkListItems[index]["title"];

                      checkListItems[index]["value"] = value;
                      if (multipleSelected.contains(checkListItems[index]))
                      {
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

        ],
      ),
    )

     ;

  }
}
