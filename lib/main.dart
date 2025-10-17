import 'package:flutter/material.dart';
import 'package:roughdraft/core/network/dio_client.dart';
import 'package:roughdraft/gamification/service/gamification_service.dart';
import 'package:roughdraft/gamification/view/pages/dashboard_page.dart';
import 'package:roughdraft/gamification/view/pages/gamification_name_screen.dart';
import 'package:provider/provider.dart';
import 'package:roughdraft/gamification/viewmodel/gamification_controller/gamification_controller.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GamificationController(
            service: GamificationService(dio: DioClient().dio),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Gamification",
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: DashBoardPage(),
      ),
    );
  }
}
