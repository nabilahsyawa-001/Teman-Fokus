import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Import layar yang dibutuhkan saat aplikasi pertama buka
import 'screens/auth/login_screen.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  String namaAnak = prefs.getString('namaAnak') ?? 'Teman';
  String avatar = prefs.getString('avatar') ?? '👦';
  int userId = prefs.getInt('userId') ?? 0;

  runApp(
    TemanFokusApp(
      isLoggedIn: isLoggedIn,
      namaAnak: namaAnak,
      avatar: avatar,
      userId: userId,
    ),
  );
}

class TemanFokusApp extends StatelessWidget {
  final bool isLoggedIn;
  final String namaAnak;
  final String avatar;
  final int userId;

  const TemanFokusApp({
    super.key,
    required this.isLoggedIn,
    required this.namaAnak,
    required this.avatar,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teman Fokus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDE8D1),
        primaryColor: const Color(0xFF2A9D8F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2A9D8F),
          secondary: const Color(0xFFD4A373),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2A9D8F),
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: isLoggedIn
          ? HomeScreen(namaAnak: namaAnak, avatar: avatar, userId: userId)
          : const LoginScreen(),
    );
  }
}
