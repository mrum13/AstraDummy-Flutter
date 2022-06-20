import 'package:astra/provider/feedback_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/pages/feedbackPages/detail_feedback.dart';
import 'package:astra/ui/widgets/card_feedback.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_button_back.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({ Key? key }) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {

    FeedbackProvider feedbackProvider = Provider.of(context);

    refreshDataCustomerCountAndRefresh() async {
      await Provider.of<FeedbackProvider>(context, listen: false).getFeedback();
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

    List<Widget> listFeedback = feedbackProvider.feedback
        .map((feedback) => CardFeedback(
              title: feedback.perihal,
              date: DateFormat('dd MMMM yyyy')
                  .format(feedback.createdAt)
                  .toString(),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailFeedbackPage(feedback),
                  ),
                );
              },
            ))
        .toList();

    handleAddFeedback() {
      Navigator.pushNamed(context, '/add-feedback');
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

      Widget buttonLanjutkan() {
        return Flexible(
          child: CustomButton(
              title: 'Tambah Feedback',
              height: 40,
              onPressed: () {
                handleAddFeedback();
              }),
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
            buttonLanjutkan(),
          ],
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
              Container(
                margin: const EdgeInsets.only(bottom: 60),
                width: double.infinity,
                child: Column(
                  children: listFeedback
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          'Feedback',
          style: blackTextStyle.copyWith(
            fontWeight: w800,
            fontSize: 18,
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    // const SizedBox(height: 20,),
                    content()
                  ],
                ),
                footer()
              ],
            ),
          )
        ),
      ),
    );
  }
}