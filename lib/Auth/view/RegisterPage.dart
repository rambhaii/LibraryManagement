import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:librarymanagement/AllWidget/EditTextWidget.dart';
import 'package:librarymanagement/Auth/controller/LoginController.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';
import 'package:librarymanagement/Dashboard/dashboard.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
{LoginController controller=Get.find();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(child:
      SingleChildScrollView(
          child:Container
            (
            margin: EdgeInsets.only(left: 15,right: 0,top: 20),
            child: Column
              (
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/images/logo.png"),
                ),
                SizedBox(height: 10),
                Text(
                  'Create an Account',
                  style: headingText,
                  ),
                Row(
                  children: [
                    Spacer(flex:2),
                    Expanded(
                        flex: 10,
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children:
                            [
                              SizedBox(height: 25,),
                              EditTextWidget(
                                image: "assets/images/email.svg",
                                hint: 'Name',
                                validator: (value)
                                { if(value.toString().isEmpty)
                                  {
                                    return "Please Enter Name";
                                  }
                                  return null;
                                },

                              ),
                              SizedBox(height: 10,),
                              EditTextWidget(
                                hint: 'Mobile Number',
                                image: "assets/images/email.svg",
                                validator: (value)
                                { if(value.toString().isEmpty)
                                  {
                                    return "Please Enter Name";
                                  }
                                  return null;
                                },

                              ),
                              SizedBox(height: 10,),
                              EditTextWidget(
                                image: "assets/images/email.svg",
                                hint: 'E-mail',
                                validator: (value)
                                { if(value.toString().isEmpty)
                                  {
                                    return "Please Enter Name";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 10,),
                              EditTextWidget(
                                image: "assets/images/email.svg",
                                hint: 'Address',
                                validator: (value)
                                { if(value.toString().isEmpty)
                                  {
                                    return "Please Enter Name";
                                  }
                                  return null;
                                },
                              ),


                            ],
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 25,),
                Container(
                  margin: EdgeInsets.only(right: 35),
                  alignment: Alignment.centerLeft,
                  width: Get.width,
                  child: RawMaterialButton(onPressed: ()
                  {
                    Future.delayed(
                      Duration(seconds: 2),
                      () {
                        Future.delayed(const Duration(seconds: 1), () {
                          // Navigator.pop(context);
                          Get.to(dashboard());
                        });
                      },
                    );
                  //
                    /*if(_controller.formKey.currentState!.validate())
                    {
                    //  _controller.signUpNetworkApi(deviceId);
                    }*/
                  },
                    child: Icon(Icons.arrow_forward,color: Colors.white,size: 30,),
                    fillColor: Colors.black,
                    padding: EdgeInsets.all(8),
                    shape: CircleBorder(),
                    constraints: BoxConstraints(maxHeight: 54,maxWidth: 54),
                  ),
                ),




              ],
            ),

            )
      )
      ),
    );
  }
}

/*

SafeArea(
child: SingleChildScrollView(
child: Container(
margin: EdgeInsets.only(left: 15,right: 15,top: 20),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
Container(
margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
height: 100,
width: 100,
child: Image.asset("assets/images/logo.png"),
),
SizedBox(height: 40,),
Text(
'Create an Account',
style: headingText,
),





const  SizedBox(height: 50,),
Row(
crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment:MainAxisAlignment.start,
children: [
Spacer(flex: 1,),
Expanded(flex:1,child: TextFormField(
readOnly: true,
initialValue: "+91",
decoration:const InputDecoration(

enabledBorder: UnderlineInputBorder(
borderSide: BorderSide(color: Colors.black),
),
focusedBorder: UnderlineInputBorder(
borderSide: BorderSide(color: Colors.black),
),

isDense: true,


),
style: headingText)),
SizedBox(width: 8,),
Expanded(flex:5,child: Form(
key: _keyForm,
child: TextFormField(
controller: controller.etMobile,
keyboardType: TextInputType.number,
decoration: const InputDecoration(
enabledBorder: UnderlineInputBorder(
borderSide: BorderSide(color: Colors.black),
),
focusedBorder: UnderlineInputBorder(
borderSide: BorderSide(color: Colors.black),
),
counter: Offstage(),
hintText: "0000000000",
isDense: true,
contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),

),
validator: (value){
if(value.toString().isEmpty)
{
return "Please enter mobile No.";
}
if(value!.length!=10)
{
return "Please enter 10 digits mobile number";
}
},
maxLength: 10,

style: headingText.copyWith(color: Colors.amberAccent,letterSpacing: 0.50,)),
)),
],
),
const SizedBox(height: 36,),

Row(
children: [
SizedBox(width: 20,),
Expanded(flex: 6,child:
CircularButton(onPress: ()
{
if(_keyForm.currentState!.validate())
{
Get.to(OtypVerifyPage());
//_controller.loginNetworkApi(deviceId);
}

},)),
],
),



const SizedBox(height: 30,),

Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Column(
children:
[
Card(
margin: EdgeInsets.all(10),
elevation: 0.6,
child: InkWell(
child:
Row(
children: [
Container(

padding: EdgeInsets.all(10),
child: Image.asset("assets/images/google_icon.png", height: 30,
width: 30,),), SizedBox(width: 15,),
Text("Google sign in   ",style: bodyText.copyWith(fontSize: 15),
)
],
)

),
),

],
) ,


],
),

const SizedBox(height: 40,),



Center(
child: Text.rich(
TextSpan(
style: bodyText,
children: [
TextSpan(
text:
'By signing in or creating an account, you agree with our \n',
style: TextStyle(
fontWeight: FontWeight.w300,
fontSize: 12,
height: 2,
letterSpacing: 0.2
),
),
TextSpan(
text: 'Term and conditions',
style: TextStyle(
color: const Color(0xff006eff),
fontWeight: FontWeight.w100,
decoration: TextDecoration.underline,
),
),
TextSpan(
text: ' and ',
style: TextStyle(
fontWeight: FontWeight.w300,
),
),
TextSpan(
text: 'Privacy Policy',
style: TextStyle(
color: const Color(0xff006eff),
fontWeight: FontWeight.w300,
decoration: TextDecoration.underline,
),
),
TextSpan(
text: ' ',
style: TextStyle(
color: const Color(0xff006eff),
fontWeight: FontWeight.w300,
),
),
],
),
textHeightBehavior:
TextHeightBehavior(applyHeightToFirstAscent: false),
textAlign: TextAlign.center,
softWrap: false,
),
),

],
),
),
),
),*/
