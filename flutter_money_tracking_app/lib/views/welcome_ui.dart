import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeUI extends StatefulWidget {
  const WelcomeUI({super.key});

  @override
  State<WelcomeUI> createState() => _WelcomeUIState();
}

class _WelcomeUIState extends State<WelcomeUI> {
  final Color primaryColor = const Color(0xFF458F8B);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        // พื้นหลัง Gradient เรียบๆ ไม่มีไอคอนรบกวน
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF458F8B), Color(0xFF2D6F6B)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ส่วนแสดงรูปภาพหลัก
              Expanded(
                flex: 5,
                child: Center(
                  child: SizedBox(
                    width: screenWidth * 0.8,
                    child: Image.asset(
                      'assets/images/paym_wel.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // ส่วนแผ่นป้ายสีขาวด้านล่าง
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'บันทึก\nรายรับรายจ่าย',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.kanit(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                height: 1.2,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'จัดการการเงินของคุณได้ง่ายๆ\nเริ่มต้นสร้างวินัยการออมวันนี้',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.kanit(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),

                      // ปุ่มเริ่มใช้งาน
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: const StadiumBorder(),
                          ),
                          child: Text(
                            'เริ่มใช้งานแอปพลิเคชัน',
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
      ),
    );
  }
}
