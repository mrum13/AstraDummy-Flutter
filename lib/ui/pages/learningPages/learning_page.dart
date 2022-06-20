import 'package:astra/shared/theme.dart';
import 'package:astra/ui/pages/learningPages/document/dokumen_learning.dart';
import 'package:astra/ui/pages/learningPages/product/product_learning.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:flutter/material.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          'Learning',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: w800,
          ),
        ),
      );
    }

    Widget tapBarWithView() {
      return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                height: 32,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: kPrimaryColor,
                  ),
                ),
                child: TabBar(
                    indicator: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    unselectedLabelColor: kPrimaryColor,
                    labelColor: Colors.white,
                    tabs: const <Widget>[
                      Text('Product'),
                      Text('Dokumen Lainnya'),
                    ]),
              ),

              ///tabview
              Container(
                color: const Color(0xFFE5E5E5),
                margin: const EdgeInsets.only(top: 16),
                height: MediaQuery.of(context).size.height,
                child: const TabBarView(children: <Widget>[
                  ProductLearningPage(),
                  DokumenLearningPage(),
                ]),
              ),
            ],
          ));
    }

    Widget buttonBack(){
      return Align(
        alignment: Alignment.bottomLeft,
        child: ButtonBack(
          onTap: (){Navigator.pushNamed(context, '/dashboard');}, 
          icon: 'assets/icon_back_orange.png'),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    Expanded(
                      child: ListView(
                        children: [
                          tapBarWithView(),
                        ],
                      ),
                    ),
                  ],
                ),
                buttonBack()
              ],
            ),
          )),
      ),
    );
  }
}