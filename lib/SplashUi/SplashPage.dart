

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librarymanagement/Auth/view/LoginDashBoard.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget
{
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
{
  void initState()
  {

    Future.delayed(Duration(seconds: 5)).then((value) =>
        Get.to(()=>LoginDashBoard(),transition: Transition.fadeIn,duration: Duration(milliseconds: 1000))
    );
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          //  Positioned(child: Image.asset("assets/images/team.png"),height: 400,width: Get.width,),

          Positioned(

            top: 150,
            child:
          Lottie.asset('assets/json/library.json',
              frameRate: FrameRate.max
          ),height: 350,width: Get.width,),
          Positioned(
            bottom: -120,
            child:  RotationTransition(
              turns: AlwaysStoppedAnimation(-40 / 360),
              child: Lottie.asset('assets/json/blackline.json',
                  frameRate: FrameRate.max
                  ,fit:BoxFit.fill),),height: 500,width: Get.width,),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 350,),
                Text(
                  'Library Management ',
                  style: headingText,
                ),
                SizedBox(height: 20,),
              /*  Text(
                  ' Village Level Entrepreneur \n           Society',
                  style: headingText,
                ),*/
              ],
            ),
          ),

        ],
      ),

    );
  }
}
