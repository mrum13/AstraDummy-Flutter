import 'dart:io';

import 'package:astra/model/user_model.dart';
import 'package:astra/provider/auth_provider.dart';
import 'package:astra/provider/customer_count_provider.dart';
import 'package:astra/provider/information_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/pages/dashboard.dart';
import 'package:astra/ui/widgets/custom_button.dart';
import 'package:astra/ui/widgets/logo_afila.dart';
import 'package:astra/ui/widgets/logo_ahm.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../model/shared_preferece.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  late SharedPreferences loginData;
  late bool newUser;

  ///var edit text
  TextEditingController emailController =
      TextEditingController(text: 'sales@sales.com');
  TextEditingController passwordController =
      TextEditingController(text: 'password');

  bool isLoading = false;

  bool isProgress = false;

  void showProgress() {
    setState(() {
      isProgress = !isProgress;
    });
  }

  @override
  void initState() {
    super.initState();
    initializePreference();
    check_if_already_login();
  }

  void check_if_already_login() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool('login') ?? true);
    print(newUser);
    if (newUser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  Future<void> initializePreference() async {
    SharedPreference.token = await SharedPreferences.getInstance();
    SharedPreference.dataCustomer = await SharedPreferences.getInstance();
    SharedPreference.session = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      showProgress();
      setState(() {
        isLoading = true;
      });

      late String deviceData;

      try {
        if (Platform.isAndroid) {
          deviceData = (await deviceInfoPlugin.androidInfo).device;
        } else if (Platform.isIOS) {
          deviceData = (await deviceInfoPlugin.iosInfo).name;
        }
      } on PlatformException {
        deviceData = 'No Device';
      }

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
        deviceName: deviceData,
      )) {
        UserModel user = authProvider.user;

        await Provider.of<InformationProvider>(context, listen: false)
            .getInformation(user.dealer.id.toString(), 5.toString());
        await Provider.of<CustomerCountProvider>(context, listen: false)
            .getCustomerCount();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kGreenColor,
            content: const Text(
              'Selamat Datang ...',
              textAlign: TextAlign.center,
            ),
          ),
        );
        showProgress();
        // loginData.setBool('login', false);
        Navigator.pushNamed(context, '/dashboard');
      } else {
        showProgress();
        // loginData.setBool("login", true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kPrimaryColor,
            content: const Text(
              'Maaf Gagal Login!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget logo() {
      return const LogoAhm();
    }

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat datang di',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: w400,
                  ),
                ),
                Text(
                  'Persona',
                  style: blackTextStyle.copyWith(
                    fontSize: 32,
                    fontWeight: w800,
                  ),
                )
              ],
            ),
            logo()
          ],
        ),
      );
    }

    Widget body() {
      Widget titleBody() {
        return Text(
          'Silahkan Masuk Akun',
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: w700,
          ),
        );
      }

      Widget formTextUsername() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: w400,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: w400,
              ),
              cursorColor: kBlackColor,
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Image.asset('assets/icon_username.png',
                      height: 24, width: 24),
                ),
                hintText: 'Masukkan username',
                hintStyle:
                    greyTextStyle.copyWith(fontSize: 14, fontWeight: w400),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
            )
          ],
        );
      }

      Widget formTextPass() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: w400,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: w400,
              ),
              obscureText: true,
              cursorColor: kBlackColor,
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Image.asset('assets/icon_pass.png',
                      height: 24, width: 24),
                ),
                hintText: 'Masukkan sandi',
                hintStyle:
                    greyTextStyle.copyWith(fontSize: 14, fontWeight: w400),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
            ),
            // Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        );
      }

      Widget forgotPass() {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/forgot-pass');
          },
          child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Lupa sandi?',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: w400,
                ),
              )),
        );
      }

      Widget buttonLogin() {
        return CustomButton(title: 'Masuk Akun', onPressed: handleSignIn);
      }

      return Container(
        margin: const EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleBody(),
            const SizedBox(height: 20),
            formTextUsername(),
            const SizedBox(
              height: 24,
            ),
            formTextPass(),
            const SizedBox(
              height: 10,
            ),
            forgotPass(),
            const SizedBox(
              height: 24,
            ),
            buttonLogin(),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      );
    }

    Widget footer() {
      return Align(alignment: Alignment.bottomLeft, child: LogoAfila());
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(40),
          child: Stack(
            children: [
              ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(),
                  body(),
                  footer(),
                ],
              ),
              Visibility(
                visible: isProgress,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: kGreyColor,
                    valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
