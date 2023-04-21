
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:librarymanagement/ConstantVariable/CustomAppBarWidget.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';

class EnrollmentFee extends StatelessWidget {
  const EnrollmentFee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(
            double.infinity,
            60.0,
          ),
          child: CustomAppBar(
              title:"Manage Enrollment Fee"
          )
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(" Enrollment Fee :",style: bodyText.copyWith(color: Colors.red),),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    side: BorderSide(width: 1, color: Colors.grey)
                ),
                child: Center(
                  child: Container(
                    height:35.h ,
                    decoration: BoxDecoration(
                    //  border:Border.all(color: Colors.black26,width: 1.5)
                    ),

                    child: TextFormField(

                        decoration:  InputDecoration
                          (
                          prefixIconConstraints: BoxConstraints(minWidth: 45,
                          ),

                          border: OutlineInputBorder(
                            borderSide:BorderSide.none
                          ),

                          hintText: "0",
                          isDense: true,
                          counter: Offstage(),
                          contentPadding:const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                        ),
                        keyboardType: TextInputType.text,
                        style: bodyText.copyWith(fontSize: 18)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child:
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                  onPressed: () {},
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      child: const Text('   Submit  ', textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),

              ],
          ),
        ),
      ) ,
    );
  }
}
