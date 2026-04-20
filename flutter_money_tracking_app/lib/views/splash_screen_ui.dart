import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    super.initState();

    // 🔹 หน่วงเวลา 3 วินาทีแล้วไปหน้า Welcome (คงเดิม)
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/welcome');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🎨 Gradient Background โทนเดิมเพื่อให้เข้ากับหน้าอื่นๆ
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF458F8B), // สีหลัก
              Color(0xFF2D6F6B), // สีเข้ม
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            /// ================================
            /// 🔹 Main Content (ชื่อแอปและคำอธิบาย)
            /// ================================
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🧾 Title
                  Text(
                    'Money Tracking',
                    style: GoogleFonts.kanit(
                      textStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 🧾 Subtitle
                  Text(
                    'รายรับรายจ่ายของฉัน',
                    style: GoogleFonts.kanit(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.9),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// ================================
            /// 🔹 Footer (ข้อมูลผู้จัดทำ)
            /// ================================
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Created by 6619410028',
                      style: GoogleFonts.kanit(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.yellow.withOpacity(0.9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '- SAU -',
                      style: GoogleFonts.kanit(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.yellow.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
