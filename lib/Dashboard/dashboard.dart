

import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';
import 'package:librarymanagement/Dashboard/Controller/DashboardController.dart';
import 'package:librarymanagement/Dashboard/Screen/AddMember.dart';
import 'package:librarymanagement/Dashboard/Screen/NavDrawer%20.dart';
import 'package:librarymanagement/Dashboard/Screen/SeatMap.dart';

import '../AppConstant/APIConstant.dart';

class dashboard extends StatefulWidget
{
  const dashboard({Key? key}) : super(key: key);
  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard>
{
  DashBoardController controller=Get.put(DashBoardController());
  String url="https://www.google.com/url?sa=i&url=https%3A%2F%2Fhelpx.adobe."
      "com%2Fphotoshop%2Fusing%2Fconvert-color-image-black-white.html&psig="
      "AOvVaw3p_sA4dyW6T8DpjL6blD6O&ust=1681743566177000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCLj7r5LVrv4CFQAAAAAdAAAAABAE";
  @override
  Widget build(BuildContext context)
  {
    controller.getBannerNetworkApi();
    SystemChrome.setSystemUIOverlayStyle
      (
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      drawer: NavDrawer(),
      appBar:
      PreferredSize(
        child:
        Stack(
          children: [

            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: AppBar(
                  backgroundColor: Colors.red.withOpacity(0.9),
                 title: Text("hello"),
                  actions: [
                    RawMaterialButton(
                      constraints:
                      BoxConstraints(maxHeight: 40.h, minWidth: 40.w),
                      onPressed: ()
                      {
                        //controllerNotification.getNotificationListNetworkApi();
                          Get.to(()=>AddMember());
                      },
                      shape: CircleBorder(),
                      child:
                          Icon(Icons.account_circle,size: 30,)



                    ),
                    RawMaterialButton(
                      constraints:
                      BoxConstraints(maxHeight: 40.h, minWidth: 40.w),
                      onPressed: ()
                      {
                        //controllerNotification.getNotificationListNetworkApi();
                        //  Get.to(()=>chats());
                      },
                      shape: CircleBorder(),
                      child: Image.asset(
                        "assets/images/whatsapp.png",
                        height: 27,
                        width: 27,
                        color: Colors.white,

                      ),
                    ),
                    RawMaterialButton(
                      constraints:
                      BoxConstraints(maxHeight: 40.h, minWidth: 40.w),
                      onPressed: ()
                      {
                        //controllerNotification.getNotificationListNetworkApi();
                      //  Get.to(()=>chats());
                      },
                      shape: CircleBorder(),
                      child: Icon(Icons.message_outlined,size: 30,)
                    ),
                    RawMaterialButton(
                      constraints:
                      BoxConstraints(maxHeight: 40.h, minWidth: 40.w),
                      onPressed: ()
                      {
                        //controllerNotification.getNotificationListNetworkApi();
                        Get.to(()=>SeatMap());
                      },
                      shape: CircleBorder(),
                      child:   Icon(Icons.mic_none,size: 30,)
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
              child: Obx(() => controller.bannerData.value.data!=null? CarouselSlider(
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
                items: controller.bannerData.value.data!.map((i)
                {
                  print("object"+BASE_URL + i.image.toString());
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
                                image: NetworkImage(
                                    BASE_URL + i.image.toString()),
                                fit: BoxFit.fill)
                        ),
                        child:
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Text(i.title.toString(),style: TextStyle(
                                fontSize: 22,
                                color: Colors.white
                            )),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ):Container(
                height: 130.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
              ))

          ),
            SizedBox(
              height: 8,
            ),
            Column(
              children: [
                GridView.count(
                  physics: ScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  //childAspectRatio: 5/4,
                  shrinkWrap: true,
                  children: List.generate(10, (index)
                  {

                 //   final datas = controller.articleModelByCategory.value.data![index];

                    return GestureDetector(
                      onTap: (){
                        //Get.to(()=>CscDetails(datas));
                      },
                      child: Card(

                        color: Colors.white,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.red)
                          //<-- SEE HERE
                        ),
                        elevation: 2,
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 5,),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: "",
                                height: 25.h,
                                width: 25.h,
                                placeholder: (context, url) =>
                                    Center(child: const CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8,bottom: 8),
                              child: Text("hello",
                                style: bodyText.copyWith(fontSize: 12.sp),overflow: TextOverflow.ellipsis,
                                //   textAlign: TextAlign.justify,
                                maxLines: 3,),
                            ),
                            Container(
                              height: 25,
                               width: 25,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                   color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                               ),
                              child: Center(child: Text("0")),
                            )

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
    )
    );
  }
}
