// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seov_app/constant/colors.dart';
import 'package:seov_app/controllers/auth/register_controller.dart';
import 'package:seov_app/widgets/general/form_input.dart';
import 'package:seov_app/widgets/general/form_input_password.dart';

class RegisterPage extends StatelessWidget {
  final registerController = Get.put(RegisterController());
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
        child: Form(
          key: registerController.formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              _title(),
              _nameInput(),
              const SizedBox(height: 20),
              _emailInput(),
              const SizedBox(height: 20),
              _passwordInput(),
              const SizedBox(height: 20),
              _rePasswordInput(),
              const SizedBox(height: 20),
              _phoneInput(),
              const SizedBox(height: 40),
              _registerBtn(),
              const SizedBox(height: 50),
              _goToLoginBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 40),
      alignment: Alignment.center,
      child: Text(
        "DAFTAR",
        style: GoogleFonts.poppins(
            color: AppColors.primaryColor,
            fontSize: 26,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _nameInput() {
    return formInput(
      placeholder: 'Nama Lengkap',
      controller: registerController.nameFC,
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan nama terlebih dahulu';
        }
        return null;
      },
    );
  }

  Widget _emailInput() {
    return formInput(
      placeholder: 'Email',
      controller: registerController.emailFC,
      inputType: TextInputType.emailAddress,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan email terlebih dahulu';
        }
        if (!GetUtils.isEmail(value)) {
          return 'Masukkan email dengan benar';
        }
        return null;
      },
    );
  }

  Widget _phoneInput() {
    return formInput(
      placeholder: 'No. Handphone',
      controller: registerController.phoneFC,
      inputType: TextInputType.number,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan nomor hp terlebih dahulu';
        }
        if (!GetUtils.isPhoneNumber(value)) {
          return 'Masukkan nomor hp dengan benar';
        }
        return null;
      },
    );
  }

  Widget _passwordInput() {
    return Obx(() => formInputPassword(
          placeholder: 'Kata Sandi',
          controller: registerController.passwordFC,
          inputAction: TextInputAction.next,
          secureText: registerController.isObscure,
          onShowPassword: () {
            registerController.showPassword();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Masukkan kata sandi terlebih dahulu';
            }
            return null;
          },
        ));
  }

  Widget _rePasswordInput() {
    return Obx(() => formInputPassword(
          placeholder: 'Ulangi Kata Sandi',
          controller: registerController.rePasswordFC,
          inputAction: TextInputAction.done,
          secureText: registerController.isObscure2,
          onShowPassword: () {
            registerController.showRePassword();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Masukkan kata sandi terlebih dahulu';
            }
            if (value != registerController.passwordFC.text) {
              return 'Kata sandi tidak sesuai';
            }
            return null;
          },
        ));
  }

  Widget _registerBtn() {
    return SizedBox(
      width: Get.width / 1.4,
      child: GetPlatform.isIOS
          ? CupertinoButton.filled(
              borderRadius: BorderRadius.circular(12),
              onPressed: () {},
              child: const Text("Daftar"),
            )
          : ElevatedButton(
              onPressed: () {},
              child: const Text("Daftar"),
            ),
    );
  }

  Widget _goToLoginBtn() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sudah punya akun?",
            style: Get.textTheme.subtitle1,
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text(
              "Masuk",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
