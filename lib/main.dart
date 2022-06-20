import 'dart:io';

import 'package:astra/model/shared_preferece.dart';
import 'package:astra/my_http_overrides.dart';
import 'package:astra/provider/auth_provider.dart';
import 'package:astra/provider/category_provider.dart';
import 'package:astra/provider/change_password_provider.dart';
import 'package:astra/provider/customer_count_provider.dart';
import 'package:astra/provider/customer_provider.dart';
import 'package:astra/provider/feedback_provider.dart';
import 'package:astra/provider/information_provider.dart';
import 'package:astra/provider/job_provider.dart';
import 'package:astra/provider/knowladge_provider.dart';
import 'package:astra/provider/priority_provider.dart';
import 'package:astra/provider/product_cub_provider.dart';
import 'package:astra/provider/product_matic_provider.dart';
import 'package:astra/provider/product_provider.dart';
import 'package:astra/provider/product_sport_provider.dart';
import 'package:astra/ui/pages/addCustomerPages/add_customer_page.dart';
import 'package:astra/ui/pages/customerPages/customer_list_page.dart';
import 'package:astra/ui/pages/dashboard.dart';
import 'package:astra/ui/pages/feedbackPages/add_feedback.dart';
import 'package:astra/ui/pages/feedbackPages/feedback_page.dart';
import 'package:astra/ui/pages/learningPages/learning_page.dart';
import 'package:astra/ui/pages/home_page.dart';
import 'package:astra/ui/pages/forgot_pass_page.dart';
import 'package:astra/ui/pages/informasi_page.dart';
import 'package:astra/ui/pages/login_page.dart';
import 'package:astra/ui/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InformationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JobProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductSportProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductCubProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductMaticProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => KnowladgeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PriorityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FeedbackProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerCountProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangePasswordProvider(),
        )
      ],
      child: MaterialApp(
          theme: ThemeData(fontFamily: 'PJSans'),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const LoginPage(),
            '/forgot-pass': (context) => const ForgotPassPage(),
            '/customer-list': (context) => const CustomerListPage(),
            '/add-customer': (context) => const AddCustomerPage(),
            // '/detail-product': (context) => const DetailProductPage(),
            '/home-page': (context) => const HomePage(),
            '/dashboard': (context) => const Dashboard(),
            '/informasi': (context) => const InformasiPage(),
            '/learning': (context) => const LearningPage(),
            '/profile': (context) => const ProfilePage(),
            '/feedback': (context) => const FeedbackPage(),
            '/add-feedback': (context) => const AddFeedbackPage(),
          }),
    );
  }
}
