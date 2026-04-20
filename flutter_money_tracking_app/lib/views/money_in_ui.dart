import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoneyInUI extends StatefulWidget {
  const MoneyInUI({super.key});

  @override
  State<MoneyInUI> createState() => _MoneyInUIState();
}

class _MoneyInUIState extends State<MoneyInUI> {
  final Color primaryColor = const Color(0xFF458F8B);
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  // ยอดเงินปัจจุบัน 0.00 ตามที่ระบุไว้
  final double _currentBalance = 0.00;

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Column(
                children: [
                  Text(
                    '19 เมษายน 2026',
                    style: GoogleFonts.kanit(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2D2D2D),
                    ),
                  ),
                  Text(
                    'บันทึกเงินเข้า',
                    style: GoogleFonts.kanit(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 35),
                  _inputSection(
                    label: 'รายการเงินเข้า',
                    controller: _noteController,
                    hint: 'เช่น เงินเดือน, โอนเข้า',
                  ),
                  const SizedBox(height: 20),
                  _inputSection(
                    label: 'จำนวนเงินเข้า',
                    controller: _amountController,
                    hint: '0.00',
                    isNumber: true,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_amountController.text.isNotEmpty) {
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('กรุณากรอกจำนวนเงิน')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: const StadiumBorder(),
                        elevation: 0,
                      ),
                      child: Text(
                        'ยืนยันบันทึกรายรับ',
                        style: GoogleFonts.kanit(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Fristname Lastname', // ปรับชื่อให้เป็นชื่อเดียวกัน
                          style: GoogleFonts.kanit(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white24,
                      // ใช้รูปเดียวกับหน้า balance_ui
                      backgroundImage: AssetImage(
                        'assets/images/user_profile.png',
                      ),
                      // หากรูปไม่โหลด จะแสดง Icon แทนเพื่อกัน error
                      child: null,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: 25,
            right: 25,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF3E837E),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ยอดเงินคงเหลือปัจจุบัน',
                    style: GoogleFonts.kanit(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    _currentBalance.toStringAsFixed(2),
                    style: GoogleFonts.kanit(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputSection({
    required String label,
    required TextEditingController controller,
    String? hint,
    bool isNumber = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 8),
          child: Text(
            label,
            style: GoogleFonts.kanit(
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: TextField(
            controller: controller,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              border: InputBorder.none,
              hintStyle: GoogleFonts.kanit(color: Colors.grey.shade400),
            ),
          ),
        ),
      ],
    );
  }
}
