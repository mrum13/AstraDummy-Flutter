import 'package:astra/provider/job_provider.dart';
import 'package:astra/provider/product_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/pages/home_page.dart';
import 'package:astra/ui/widgets/custom_button_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {

    Widget buildContent() {
      return const HomePage();
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 56,
          color: kWhiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_home_active.png',
                title: 'Home',
                isSelected: true,
                onTap: () {},
              ),
              CustomBottomNavigationItem(
                title: 'Profile',
                imageUrl: 'assets/icon_profile.png',
                onTap: (){
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            ],
          ),
        ),
      );
    }

    handleAddCustomer() async {
      await Provider.of<JobProvider>(context, listen: false).getJob();
      await Provider.of<ProductProvider>(context, listen: false).getProduct();
      Navigator.pushNamed(context, '/add-customer');
    }

    Widget buttonAdd() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            handleAddCustomer();
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 28),
            width: 56,
            height: 56,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
                image: const DecorationImage(
                    scale: 4, image: AssetImage('assets/icon_add.png')),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: const Offset(0, 10),
                  )
                ]),
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              buildContent(),
              customBottomNavigation(), 
              buttonAdd()
            ]
          ),
        ),
      ),
    );
  }
}
