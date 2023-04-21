
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:librarymanagement/ConstantVariable/CustomAppBarWidget.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';

class AddnDeleteSeate extends StatelessWidget
{
  const AddnDeleteSeate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size(
            double.infinity,
            60.0,
          ),
          child: CustomAppBar(
              title:"Lli (11 seats)"

          )
      ) ,
        body:  Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                    child:
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 130.0,
                        viewportFraction: 1,
                        aspectRatio: 16/9,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: [1,2,3,4,5].map((i)
                      {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              height: 130.0,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 10.0, right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  image:
                                  DecorationImage(
                                    //  image: NetworkImage(url),
                                      image: AssetImage(
                                        "assets/images/banner.jpg",
                                      ),
                                      fit: BoxFit.fill)
                              ),
                              child:
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Perfect Image",style: TextStyle(
                                      fontSize: 34
                                  )),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    GridView.count(
                      physics: ScrollPhysics(),
                      crossAxisCount: 4,
                      crossAxisSpacing: 0.30,
                      mainAxisSpacing: 2.0,
                      //childAspectRatio: 5/4,
                      shrinkWrap: true,
                      children: List.generate(10, (index)
                      {
                        // final datas = controller.articleModelByCategory.value.data![index];

                        return GestureDetector(
                          onTap: (){
                            //Get.to(()=>CscDetails(datas));
                          },
                          child: Card(


                            color: Colors.white,
                            shadowColor: Colors.white,
                            elevation: 2,
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("hello"),
                                SizedBox(height: 5,),
                                ClipRRect
                                  (
                                  borderRadius: BorderRadius.circular(5),
                                    child:Image.asset("assets/images/table.png",width: 40.w,height: 40.h,),
                                   ),
                               

                              ],

                            ),
                          ),
                        );
                      },),
                    ),
                  ],
                )



              ]
          ),
        ),
    );
  }
}
