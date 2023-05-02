import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:librarymanagement/Dashboard/dashboard.dart';
import 'package:librarymanagement/SplashUi/SplashPage.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'AppConstant/AppConstant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayOpacity: 0.1,
          overlayWidget: Center(
            child: Container(
                height: 41,
                width: 41,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 3.5,
                )),
          ),
          child: GetMaterialApp(
            title: 'Vle Society',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
           home:
            GetStorage().read(AppConstant.userName)!=null?
            GetStorage().read(AppConstant.userName).toString().isNotEmpty?dashboard():
            const SplashPage():const SplashPage(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },

    );
  }

}