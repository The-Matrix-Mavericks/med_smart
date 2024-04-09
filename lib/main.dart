import 'package:flutter/material.dart';
import 'package:flutter_samples/DAY_PLANNER/MODEL/db/db.helper.dart';
import 'package:flutter_samples/DAY_PLANNER/VIEW/theme/theme.dart';
import 'package:flutter_samples/controllers/paymentMethod.dart';
import 'package:flutter_samples/models/samples.dart';
import 'package:flutter_samples/samples/ui/rive_app/login_signup/onboarding/onboarding_view.dart';
import 'package:flutter_samples/screens/intro_screens/intro_view.dart';
import 'package:flutter_samples/screens/samples_list_view.dart';
import 'package:flutter_samples/samples/ui/rive_app/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_samples/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'MED_REMINDER/global_bloc.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Firebase.initializeApp();
  await DBHelper.initDb();
  await GetStorage.init();
  Gemini.init(
      apiKey: 'AIzaSyADNFwjDH0URweDWD96eeYUheF1ZNsQUy0', enableDebugging: true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalBloc? globalBloc;

  @override
  void initState() {
    globalBloc = GlobalBloc();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<GlobalBloc>.value(
        value: globalBloc!,
        child: Sizer(builder: (context, orientation, deviceType) {
          return ChangeNotifierProvider(
            create: (context) => PaymentMethod(),
            child: GetMaterialApp(
              title: 'Med Smart',
              // theme: ThemeData(
              //   primarySwatch: Colors.blue,
              // ),
              debugShowCheckedModeBanner: false,
              theme: Themes.light,
              darkTheme: Themes.dark,
              routes: {
                RiveAppHome.route: (context) => const RiveAppHome(),
              },
              // home: SamplesListView(
              //   title: "Flutter Samples",
              //   backEnabled: false,
              //   listData: SampleData.sampleTypes,
              // ),
              home: SplashScreen(),
            ),
          );
        }));
  }
}
