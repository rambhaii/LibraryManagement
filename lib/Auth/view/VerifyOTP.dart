import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librarymanagement/AllWidget/ArrowTitleAppBar.dart';
import 'package:librarymanagement/AllWidget/CustomButton.dart';
import 'package:librarymanagement/Auth/controller/LoginController.dart';
import 'package:librarymanagement/Auth/view/RegisterPage.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtypVerifyPage extends StatelessWidget
{
  final String id;
  final String otp;
  OtypVerifyPage({Key? key, required this.id, required this.otp}) : super(key: key);

   LoginController _controller=Get.find();
   String etotp="";
  @override
  Widget build(BuildContext context)
  {
  //  _controller.startTimer();
    return Scaffold(
     body: SafeArea(
       child: SingleChildScrollView(
         child: Container(
           child: Column(
             children: [
             const  SizedBox(height: 40,),
              const ArrowTitleBar(title: "Verify",),
             const  SizedBox(height: 40,),
             Text("Enter the verification code we just sent\nyou on your ${_controller.etMobile.text}",style: bodyText,textAlign: TextAlign.center,),
               const  SizedBox(height: 50,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(top: 20.0),
                     child: Text("Code ",style: bodyText.copyWith(fontSize: 18,color: Colors.black38),textAlign: TextAlign.center,),
                   ),
                   Container(
                     width: 150,
                     height: 40,
                     child: OTPTextField(
                       length: 4,

                       width: MediaQuery.of(context).size.width,
                       fieldWidth: 30,
                       style:const TextStyle(
                           fontSize: 17,fontWeight: FontWeight.bold
                       ),
                       textFieldAlignment: MainAxisAlignment.spaceAround,
                       fieldStyle: FieldStyle.underline,
                       onCompleted: (pin) {
                           etotp=pin;
                         _controller.verifyNetworkApi(id, pin);
                         },

                     ),
                   ),

                 ],
               ),
               Container(
                   margin: EdgeInsets.only(top:50,right: 15,bottom: 50),
                   width:Get.width,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Text(
                           "30"
                         /* _controller.start.value.toString(),
                           style: titleStyle.copyWith(fontSize: 16,
                               color: _controller.start.value!=0?
                               Colors.blue:Colors.grey.withOpacity(0.4)),textAlign: TextAlign.end,*/
                       ),

                       TextButton(child:Text("Resend Code?",style: bodyText.copyWith(fontSize: 16,decoration:
                       TextDecoration.underline,color:
                       Colors.blue),textAlign: TextAlign.end,
                       ),
                         onPressed: ()
                         {

                         },
                       )
                     ],
                   ),
               ),

               CustomButton(onPress: ()
               {

                 Get.to(RegisterPage());
                 _controller.verifyNetworkApi(id, etotp);
               },title: "Verify Code",)
             ],
           ),
         ),
       ),
     ),
    );
  }
}
