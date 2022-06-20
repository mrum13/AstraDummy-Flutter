import 'package:astra/model/user_model.dart';
import 'package:astra/provider/auth_provider.dart';
import 'package:astra/provider/information_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/widgets/card_new_info_home.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'detail_informasi_page.dart';

class InformasiPage extends StatefulWidget {
  const InformasiPage({Key? key}) : super(key: key);

  @override
  State<InformasiPage> createState() => _InformasiPageState();
}

class _InformasiPageState extends State<InformasiPage> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    InformationProvider informationProvider = Provider.of(context);

    refreshDataCustomerCountAndRefresh() async {
      await Provider.of<InformationProvider>(context, listen: false).getInformation(user.dealer.id.toString(), 'all');
    }

    void _onRefresh() async {
      // monitor network fetch
      await Future.delayed(const Duration(milliseconds: 1000));
      // if failed,use refreshFailed()

      setState(() {
        refreshDataCustomerCountAndRefresh();
      });

      _refreshController.refreshCompleted();
    }

    void _onLoading() async {
      // monitor network fetch
      await Future.delayed(const Duration(milliseconds: 1000));
      setState(() {});

      _refreshController.loadComplete();
    }

    List<Widget> info = informationProvider.information.map((information) => CardNewInfoHome(
                title: information.title,
                date: DateFormat('dd MMMM yyyy').format(information.createdAt).toString(),
                image: information.image, onTap: () {Navigator.push(
        context, MaterialPageRoute(
          builder: (context) => DetailInformasiPage(information,'information'),),);},),).toList();

    Widget header() {
      return Container(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          'Informasi',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: w800,
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: SmartRefresher(
          enablePullDown: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: info
                ),
              )
            ],
          ),
        ),
      );
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
                  content(),
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
