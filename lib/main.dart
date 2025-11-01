import 'package:flutter/material.dart';
import 'package:nature_dex/screens/landing/landing_screen.dart';
import 'package:nature_dex/screens/auth/login_screen.dart';
import 'package:nature_dex/screens/auth/register_screen.dart';
import 'package:nature_dex/screens/home/home_screen.dart';
import 'package:nature_dex/screens/identification/identification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NatureDex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      // 처음 시작하는 화면을 랜딩페이지로 설정
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/identification': (context) => const IdentificationScreen(),
      },
    );
  }
}
