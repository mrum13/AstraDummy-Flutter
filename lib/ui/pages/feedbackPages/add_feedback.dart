import 'package:astra/model/user_model.dart';
import 'package:astra/provider/auth_provider.dart';
import 'package:astra/provider/feedback_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/widgets/card_modal.dart';
import 'package:astra/ui/widgets/custom_button.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFeedbackPage extends StatelessWidget {
  const AddFeedbackPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    FeedbackProvider feedbackProvider = Provider.of<FeedbackProvider>(context);

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    TextEditingController perihalController = TextEditingController(text: '');
    TextEditingController pesanController = TextEditingController(text: '');

    getDataFeedback() async {
      await Provider.of<FeedbackProvider>(context, listen: false).getFeedback();
    }

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Text(
          'Tambah Feedback',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: w800,
          ),
        ),
      );
    }

    Widget formPerihal() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Perihal',
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
              controller: perihalController,
              decoration: InputDecoration(
                // errorText: _validate ? 'Tidak boleh kosong' : null,
                hintText: 'Masukkan perihal',
                hintStyle:
                    greyTextStyle.copyWith(fontSize: 14, fontWeight: w400),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
            )
          ],
        );
      }

      Widget formPesan() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pesan',
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
              controller: pesanController,
              decoration: InputDecoration(
                // errorText: _validate ? 'Tidak boleh kosong' : null,
                hintText: 'Masukkan pesan',
                hintStyle:
                    greyTextStyle.copyWith(fontSize: 14, fontWeight: w400),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
            )
          ],
        );
      }

    Widget body() {
      return Column(
        children: [
          Text('Infokan saran atau kritik untuk pengembangan dan kemajuan aplikasi',
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: w400
            ),  
          ),
          const SizedBox(height: 20,),
          formPerihal(),
          const SizedBox(height: 20,),
          formPesan()
        ],
      );
    }

    Widget modalSuccess(BuildContext context) {
      return CardModal(
        textStyle: greenTextStyle.copyWith(fontSize: 16, fontWeight: w700),
        icon: 'assets/icon_success.png',
        title: 'Berhasil',
        subtitle: 'Feedback berhasil ditambahkan',
        buttonText: 'Selesai',
        onPressModal: () {
          getDataFeedback();
          Navigator.pushNamed(context, '/feedback');
        },
      );
    }

    Widget modalFailed(BuildContext context) {
      return CardModal(
        textStyle: yellowTextStyle.copyWith(fontSize: 16, fontWeight: w700),
        icon: 'assets/icon_failed.png',
        title: 'Gagal',
        subtitle:
            'Sayang sekali gagal menyimpan data, mohon periksa koneksi internet kamu.',
        buttonText: 'Coba Lagi',
        onPressModal: () {
          Navigator.pop(context);
        },
      );
    }

    Widget footer() {
      Widget backButton() {
        return ButtonBack(
          onTap: () {
            Navigator.pushNamed(context, '/feedback');
          },
          icon: 'assets/icon_back_orange.png',
          width: 40,
          height: 40,
        );
      }

      handleSimpanFeedback() async {
        String perihalData = perihalController.text.toString();
        String pesanData = pesanController.text.toString();
        String userIdData = user.id.toString();

        if (await feedbackProvider.addFeedback(
          userId: userIdData, 
          perihal: perihalData, 
          feedback: pesanData
        )) {
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

      Widget buttonLanjutkan() {
        return Flexible(
          child: CustomButton(
              title: 'Simpan',
              height: 40,
              onPressed: () {
                handleSimpanFeedback();
              }),
        );
      }

      return Expanded(
        child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            backButton(),
            const SizedBox(
              width: 20,
            ),
            buttonLanjutkan(),
          ],
        ),
      ));
    }

    return WillPopScope(
      onWillPop: () async => false,
      child : Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    const SizedBox(
                      height: 20,
                    ),
                    body(),
                    footer(),
                  ],
                ),
              ],
            ),
          )),
      ),
    );
  }
}