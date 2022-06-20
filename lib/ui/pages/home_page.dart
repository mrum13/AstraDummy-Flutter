import 'package:astra/model/costumer_count_model.dart';
import 'package:astra/model/user_model.dart';
import 'package:astra/provider/auth_provider.dart';
import 'package:astra/provider/customer_count_provider.dart';
import 'package:astra/provider/customer_provider.dart';
import 'package:astra/provider/feedback_provider.dart';
import 'package:astra/provider/information_provider.dart';
import 'package:astra/provider/knowladge_provider.dart';
import 'package:astra/provider/product_cub_provider.dart';
import 'package:astra/provider/product_matic_provider.dart';
import 'package:astra/provider/product_sport_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/pages/detail_informasi_page.dart';
import 'package:astra/ui/widgets/card_activity_home.dart';
import 'package:astra/ui/widgets/card_menu_home.dart';
import 'package:astra/ui/widgets/card_new_info_home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isProgress = false;

  void showProgress() {
    setState(() {
      isProgress = !isProgress;
    });
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    await Provider.of<CustomerCountProvider>(context, listen: false).getCustomerCount();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if(mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    CustomerCountProvider customerCountProvider = Provider.of<CustomerCountProvider>(context);

    UserModel user = authProvider.user;
    CustomerCountModel customerCount = customerCountProvider.customerCount;

    getDataCustomer() async {
      showProgress();
      await Provider.of<CustomerProvider>(context, listen: false).getCustomer('1');
      Navigator.pushNamed(context, '/customer-list');
      showProgress();
    } 

    getDataFeedback() async {
      showProgress();
      await Provider.of<FeedbackProvider>(context, listen: false).getFeedback();
      Navigator.pushNamed(context, '/feedback');
      showProgress();
    }

    getDataLearning() async {
      showProgress();
      await Provider.of<KnowladgeProvider>(context, listen: false)
          .getKnowladge();
      await Provider.of<ProductCubProvider>(context, listen: false)
          .getProductCub();
      await Provider.of<ProductSportProvider>(context, listen: false)
          .getProductSport();
      await Provider.of<ProductMaticProvider>(context, listen: false)
          .getProductMatic();
      // await Provider.of<ProductProvider>(context, listen: false).getProduct();
      // await Provider.of<ProductProvider>(context, listen: false).getProduct();
      Navigator.pushNamed(context, '/learning');
      showProgress();
    }

    InformationProvider informationProvider = Provider.of(context);

    List<Widget> info = informationProvider.information
        .map((information) => 
          CardNewInfoHome(
            title: information.title,
            date: DateFormat('dd MMMM yyyy')
                .format(information.createdAt)
                .toString(),
            image: information.image,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailInformasiPage(information, 'home'),
                ),
              );
            },
          )
        ).toList();


    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hai, ',
                  style:
                      blackTextStyle.copyWith(fontSize: 18, fontWeight: w800),
                ),
                Text(
                  user.nameTa.toString(),
                  style:
                      yellowTextStyle.copyWith(fontSize: 18, fontWeight: w800),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {getDataFeedback();},
              child: Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icon_feedback.png'
                    )
                  )
                )
              ),
            )
          ],
        ),
      );
    }

    Widget contentHome() {
      Widget activityHome() {
        return Container(
          margin: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Aktivitas',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: w700,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CardActivityHome(
                        cardColor: kYellowColor.withOpacity(0.1),
                        title: 'Hari ini',
                        titleColor: yellowTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: w400,
                        ),
                      value: customerCount.customerToday.toString(),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: CardActivityHome(
                        cardColor: kGreenColor.withOpacity(0.1),
                        title: 'Kemarin',
                        titleColor: greenTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: w400,
                        ),
                      value: customerCount.customerYesterday.toString(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }

      Widget menuHome() {
        return Container(
          margin: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Menu',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: w700,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                height: 97,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kCardColor, borderRadius: BorderRadius.circular(6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardMenuHome(
                      image: 'assets/icon_customer.png',
                      title: 'Customer',
                      onTap: () {
                        getDataCustomer();
                      },
                    ),
                    CardMenuHome(
                      image: 'assets/icon_info.png',
                      title: 'Informasi',
                      onTap: () {
                        showProgress();
                        Navigator.pushNamed(context, '/informasi');
                        showProgress();
                      },
                    ),
                    CardMenuHome(
                      image: 'assets/icon_learn.png',
                      title: 'Learning',
                      onTap: () {
                        getDataLearning();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }

      Widget newInfo() {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Informasi Terbaru',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/informasi');
                      },
                      child: Text(
                        'Lihat semua',
                        style: primaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: w400),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: info,
              )
            ],
          ),
        );
      }

      return Expanded(
        child: SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          enablePullDown: true,
          child: ListView(
            children: [
              activityHome(),
              menuHome(),
              newInfo()
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 60),
          child: Stack(
            children: [
              Column(
                children: [
                  header(),
                  contentHome(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
