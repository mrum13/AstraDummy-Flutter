import 'package:astra/model/change_password_model.dart';
import 'package:astra/model/user_model.dart';
import 'package:astra/provider/auth_provider.dart';
import 'package:astra/provider/change_password_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/widgets/card_modal.dart';
import 'package:astra/ui/widgets/custom_button.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:astra/ui/widgets/helper_text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    ChangePasswordProvider changePassProvider =
        Provider.of<ChangePasswordProvider>(context);

    UserModel user = authProvider.user;

    TextEditingController passLamaController = TextEditingController(text: '');
    TextEditingController passBaruController = TextEditingController(text: '');
    TextEditingController passconfirmController =
        TextEditingController(text: '');

    handleLogout() async {
      if (await authProvider.logout()) {
        Navigator.pushNamed(context, '/');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kPrimaryColor,
            content: const Text(
              'Gagal Logout!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          'Profile',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: w800,
          ),
        ),
      );
    }

    Widget modalSuccess(BuildContext context) {
      return CardModal(
        textStyle: greenTextStyle.copyWith(fontSize: 16, fontWeight: w700),
        icon: 'assets/icon_success.png',
        title: 'Berhasil',
        subtitle: 'Password berhasil diubah',
        buttonText: 'Selesai',
        onPressModal: () {
          handleLogout();
        },
      );
    }

    Widget modalFailed(BuildContext context) {
      return CardModal(
        textStyle: yellowTextStyle.copyWith(fontSize: 16, fontWeight: w700),
        icon: 'assets/icon_failed.png',
        title: 'Gagal',
        subtitle: 'Sayang sekali gagal mengubah password.',
        buttonText: 'Coba Lagi',
        onPressModal: () {
          passLamaController.text = '';
          passBaruController.text = '';
          passconfirmController.text = '';
          Navigator.pop(context);
        },
      );
    }

    handleChangePass() async {
      String passLamaData = passLamaController.text.toString();
      String passbaruData = passBaruController.text.toString();
      String confirmPassData = passconfirmController.text.toString();

      print('password lama:' + passLamaData);
      print('password baru:' + passbaruData);

      if (await changePassProvider.changePassword(
          passwordlama: passLamaData, passwordBaru: passbaruData)) {
        return showModalBottomSheet(
            context: context,
            builder: (BuildContext con) {
              return SafeArea(child: modalSuccess(context));
            });
      } else {
        return showModalBottomSheet(
            context: context,
            builder: (BuildContext con) {
              return SafeArea(child: modalFailed(context));
            });
      }
    }

    Widget contentHeadProfile() {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              user.nameTa,
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: w700),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '@' + user.nameTa,
              style: greyTextStyle.copyWith(fontSize: 14, fontWeight: w400),
            )
          ],
        ),
        CustomButton(
            title: 'Ubah Password',
            colorButton: kYellowColor,
            height: 40,
            width: 150,
            onPressed: () {
              showModalBottomSheet(
                // clipBehavior: Clip.antiAlias,
                isScrollControlled: true,
                context: context,
                builder: (context) => SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ListView(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 156, right: 156, bottom: 20),
                            height: 4,
                            width: 48,
                            color: kGreyColor,
                          ),
                          Text(
                            'Ubah Password',
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: w700,
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          HelperTextForm(
                              controller: passLamaController,
                              helperText: 'Password Lama',
                              hintText: 'Masukkan password lama'),
                          const SizedBox(
                            height: 20,
                          ),
                          HelperTextForm(
                            obscureText: true,
                              controller: passBaruController,
                              helperText: 'Password Baru',
                              hintText: 'Masukkan password baru'),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: HelperTextForm(
                              obscureText: true,
                                controller: passconfirmController,
                                helperText: 'Ulangi Password Baru',
                                hintText: 'Ulangi password baru'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            title: 'Simpan Perubahan',
                            onPressed: () {
                              handleChangePass();
                            },
                            height: 40,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ]);
    }

    Widget footer() {
      Widget backButton() {
        return ButtonBack(
          onTap: () {
            Navigator.pushNamed(context, '/dashboard');
          },
          icon: 'assets/icon_back_orange.png',
          width: 40,
          height: 40,
        );
      }

      return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            backButton(),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Stack(children: [
                ListView(
                  children: [
                    header(),
                    const SizedBox(
                      height: 20,
                    ),
                    contentHeadProfile(),
                    const SizedBox(
                      height: 41,
                    ),
                    Text(
                      'No Telepon',
                      style: greyTextStyle.copyWith(
                          fontSize: 12, fontWeight: w400),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      user.phone,
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Jabatan',
                      style: greyTextStyle.copyWith(
                          fontSize: 12, fontWeight: w400),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      user.role,
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Dealer',
                      style: greyTextStyle.copyWith(
                          fontSize: 12, fontWeight: w400),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      user.dealer.name,
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: w400),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomButton(
                        title: 'Keluar',
                        height: 40,
                        onPressed: () {
                          handleLogout();
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                footer()
              ])),
        ),
      ),
    );
  }
}
