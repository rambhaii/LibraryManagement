import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:librarymanagement/ConstantVariable/CustomAppBarWidget.dart';

class SeatMap extends StatefulWidget {
  const SeatMap({Key? key}) : super(key: key);

  @override
  State<SeatMap> createState() => _SeatMapState();
}

class _SeatMapState extends State<SeatMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(
            double.infinity,
            60.0,
          ),
          child: CustomAppBar(
              title:"Lli (11 seats)"

          )
      ),
      body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10.h,),
          Column(
            children: [
              GridView.count(
                physics: ScrollPhysics(),
                crossAxisCount: 3,


                //childAspectRatio: 5/4,
                shrinkWrap: true,
                children: List.generate(3, (index)
                {

                  //   final datas = controller.articleModelByCategory.value.data![index];

                  return GestureDetector(
                    onTap: (){
                      //Get.to(()=>CscDetails(datas));
                    },
                    child: Column(
                      children: [
                        Text("hello"),
                        Card(

                          color: Colors.white,
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.grey.withOpacity(0.3))
                            //<-- SEE HERE
                          ),
                          elevation: 1,
                          child: Container(
                            width: 100.w,
                            height: 20.h,
                            child: Center(child: Text("1")),
                          ),
                        ),
                      ],
                    ),
                  );
                },),
              ),
            ],
          ),

          Card(
            color: Colors.white,
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.grey.withOpacity(0.3))

            ),
            elevation: 1,
            child:  Container(
              child: Column(
                children: [
                  GridView.count(
                    physics: ScrollPhysics(),
                    crossAxisCount: 5,
                    /*crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,*/
                    //childAspectRatio: 5/4,
                    shrinkWrap: true,
                    children: List.generate(5, (index)
                    {

                      //   final datas = controller.articleModelByCategory.value.data![index];

                      return GestureDetector(
                        onTap: (){
                          //Get.to(()=>CscDetails(datas));
                        },
                        child: Column(
                          children:
                          [
                            Center(child: Text("Mornng")),
                          ],
                        ),
                      );
                    },),
                  ),
                ],
              ),
            ),

          )

        ],
      ),
    );
  }
}
