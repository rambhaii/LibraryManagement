import 'dart:ui';

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';
import 'package:librarymanagement/NavBar/Controller/NavBarController.dart';

class InvoiceManagement extends StatefulWidget {
   InvoiceManagement({Key? key}) : super(key: key);

  @override
  State<InvoiceManagement> createState() => _InvoiceManagementState();
}

class _InvoiceManagementState extends State<InvoiceManagement> {
  NavBarController controller=Get.put(NavBarController());
  String searchValue = '';
  final List<String> _suggestions = ['Afeganistan', 'Albania', 'Algeria', 'Australia', 'Brazil', 'German', 'Madagascar', 'Mozambique', 'Portugal', 'Zambia'];


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
                child:
                EasySearchBar(
                  backgroundColor: Colors.red,
                 title: const Text('Manage Invoice ',style: TextStyle(color: Colors.white)),
                 searchBackgroundColor: Colors.red,

                 onSearch: (value) => setState(() => searchValue = value),
                 suggestions: _suggestions
                 ),

              ),
            ),
          ],
        ),
        preferredSize: Size(
          double.infinity,
          60.0,
        ),
      ) ,
      body:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          elevation: 2,
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
                        child:  Text('All Invoice', textAlign: TextAlign.center,style: bodyText.copyWith(color: controller.status.value==1?Colors.white:Colors.black,fontSize: 15),),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          elevation: 2,
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
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                        child:  Text('Deleted Member Invoice', textAlign: TextAlign.center,style: bodyText.copyWith(color: controller.status.value==2?Colors.white:Colors.black,fontSize: 15),),
                      ),
                    ),
                  ],
                ),
              ),
            )),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

// first overwrite to
// clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

