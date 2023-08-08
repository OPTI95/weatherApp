import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:book/features/login/presentation/cubit/login_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:book/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/weather/presentation/pages/weather_page.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'package:crypto/crypto.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  await initializeDateFormatting();

  runApp(Wrapper());
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<WeatherCubit>(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late BuildContext _navContext;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(_navContext).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _navContext = context;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [Color.fromRGBO(7, 0, 255, 1), Colors.black],
              focal: Alignment.topLeft,
              radius: 2.5,
              tileMode: TileMode.clamp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            SizedBox(
              height: 200,
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      "WEATHER SERVICE",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 48),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              "dawn is coming soon",
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 24),
            ),
            SizedBox(
              height: 86,
            )
          ],
        ),
      ),
    );
  }
}
