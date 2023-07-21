import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'router/my_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (_, __) {
        return MaterialApp.router(
          routeInformationProvider: MyRouter.goRouter.routeInformationProvider,
          routeInformationParser: MyRouter.goRouter.routeInformationParser,
          routerDelegate: MyRouter.goRouter.routerDelegate,
          builder: (context, child) {
            return child!;
          },
        );
      },
    );
  }
}
