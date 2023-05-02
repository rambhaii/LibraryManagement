import 'dart:math';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:librarymanagement/ConstantVariable/CustomAppBarWidget.dart';
import 'package:librarymanagement/ConstantVariable/textStryle.dart';

class AddnDeleteSeate extends StatefulWidget {
  const AddnDeleteSeate({Key? key}) : super(key: key);

  @override
  State<AddnDeleteSeate> createState() => _AddnDeleteSeateState();
}

class _AddnDeleteSeateState extends State<AddnDeleteSeate> {
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            60.0,
          ),
          child: CustomAppBar(title: "Lli (11 seats)")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet();
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        tooltip: 'Go Live Modal',
        child: Container(
          alignment: Alignment.center,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff1200FF).withOpacity(0.1),
            border: Border.all(width: 1, color: Colors.red.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 0.7),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(
            Icons.add,
            size: 28,
            color: Colors.red,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 200,
                    child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: const Text('Select All'),
                        value: this.valuefirst,
                        onChanged: (value) {
                          setState(() {
                            this.valuefirst = value!;
                          });
                        }),
                  ),
                  Spacer(),
                  valuefirst == false
                      ? Container()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Confirms !"),
                                content: const Text(
                                    "Are you sure you delete all seats"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("No"),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("Yes"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.orange, Colors.red]),
                                borderRadius: BorderRadius.circular(5)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: const Text('   confirms   ',
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                children: [
                  GridView.count(
                    physics: ScrollPhysics(),
                    crossAxisCount: 4,
                    crossAxisSpacing: 0.30,
                    mainAxisSpacing: 2.0,
                    shrinkWrap: true,

                    children: List.generate(
                      10,
                      (index) {
                        // final datas = controller.articleModelByCategory.value.data![index];
                        return GestureDetector(
                          onTap: () {
                            //Get.to(()=>CscDetails(datas));
                          },
                          child: Card(
                            color: Colors.white,
                            shadowColor: Colors.white,
                            elevation: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          /// background image
                                          Container(
                                            color: Colors.white,
                                          ),
                                          CustomPaint(
                                            painter: CardPaint(),
                                            child: Container(
                                              width: 50.0.w,
                                              height: 20.0.h,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 2),
                                                child: Align(
                                                  alignment: Alignment.topCenter,
                                                  child: Text("1(1)",
                                                      style: TextStyle(
                                                          fontSize: 12.0)),
                                                ),
                                              ),
                                            ),
                                            size: const Size(60, 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.delete_forever)
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      "assets/images/table.png",
                                      width: 40.w,
                                      height: 40.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }

  void _showBottomSheet() {
    TextEditingController etmessage = TextEditingController();

    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black.withOpacity(0.1),
      isScrollControlled: true,
      backgroundColor: Colors.white70,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                  padding: EdgeInsets.all(10),
                  // height: h * 0.45,
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 40,
                        height: 7,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.5, color: Colors.black38),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(

                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text("No. of seats "),
                            Spacer(),
                            Container(
                              width: 150.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5, color: Colors.black38),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0,top: 8),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                      prefixIconConstraints: BoxConstraints(minWidth: 10,
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      hintText: "Enter number of seats",
                                      isDense: true,
                                      counter: Offstage(),
                                      contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 2),
                                    ),
                                    keyboardType: TextInputType.text,
                                    style: bodyText.copyWith(fontSize: 14)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            side: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {},
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.orange, Colors.red]),
                                borderRadius: BorderRadius.circular(5)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 50),
                              child: const Text('   Submit  ',
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}

class CardPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.greenAccent;

    Path path = Path()
      ..lineTo(size.width * .7, 0)
      ..lineTo(size.width * .9, size.height * .6)
      ..lineTo(size.width * .7, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
