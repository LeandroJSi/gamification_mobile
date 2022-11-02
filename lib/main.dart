import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:get/get.dart';
import 'package:tcc_gamification/core/initial_binding.dart';
import 'package:tcc_gamification/routes/app_pages.dart';
import 'package:tcc_gamification/routes/app_routes.dart';
import 'package:tcc_gamification/theme/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      title: 'Feira',
      theme: TccThemes.light(),
      darkTheme: TccThemes.dark(),
      initialRoute: AppRoutes.dashboard,
      getPages: AppPages.pages,
    );
  }
}
