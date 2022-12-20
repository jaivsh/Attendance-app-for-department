import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class LoginOtp extends StatefulWidget {
  const LoginOtp({super.key});

  @override
  State<LoginOtp> createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  OtpFieldController otpController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Verification Code',
              style:
                  GoogleFonts.mukta(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              'Please enter the verification code sent to (+91)9876543210',
              style: GoogleFonts.mukta(),
            ),
            const SizedBox(
              height: 30,
            ),
            OTPTextField(
              controller: otpController,
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              otpFieldStyle:
                  OtpFieldStyle(backgroundColor: const Color(0xffdadada)),
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Didn\'t received the code?',
              style: GoogleFonts.mukta(),
            ),
            TextButton(
                onPressed: null,
                child: Text(
                  'Resend OTP',
                  style: GoogleFonts.mukta(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
