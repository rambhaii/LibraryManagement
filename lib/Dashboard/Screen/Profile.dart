import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librarymanagement/AllWidget/CircularButton.dart';
import 'package:librarymanagement/AllWidget/CircularTopButton.dart';
import 'package:librarymanagement/AllWidget/EditTextWidget.dart';
import 'package:librarymanagement/Auth/controller/LoginController.dart';
import 'package:librarymanagement/ConstantVariable/CustomAppBarWidget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  LoginController controller=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            60.0,
          ),
          child: CustomAppBar(
              title:"My Profile"

          )
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),

          width: MediaQuery.of(context).size.width,
          child: Card(
            child: Column(
              children: [
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
                  SizedBox(height: 20,),
                Container(
                    child: CircularTopButton(onPress: ()
                    {
                      /*if(loginController.formKey.currentState!.validate())
                      {
                        loginController.signUpProfileImgNetworkApi();
                        Get.back();
                      }*/

                    }
                    )
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
