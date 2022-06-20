import 'package:astra/model/feedback_model.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

class DetailFeedbackPage extends StatefulWidget {
  final FeedbackModel feedbacknya;

  const DetailFeedbackPage(
    this.feedbacknya, {Key? key}
  ) : super(key: key);

  @override
  State<DetailFeedbackPage> createState() => _DetailFeedbackPageState();
}

class _DetailFeedbackPageState extends State<DetailFeedbackPage> {
  @override
  Widget build(BuildContext context) {

    Widget footer() {
      return Align(
        alignment: Alignment.bottomLeft,
        child: ButtonBack(
          onTap: (){Navigator.pushNamed(context, '/feedback');}, 
          icon: 'assets/icon_back_orange.png'),
      );
    }

    Widget header() {
      return Container(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          'Detail Feedback',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: w800,
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: ListView(
            children: [
              Text(widget.feedbacknya.perihal,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: w700,
                ),
              ),
              Container(
                margin:const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_calendar.png')
                        )
                      )
                    ),
                    Text(DateFormat('dd MMMM yyyy').format(widget.feedbacknya.createdAt).toString(), 
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: w400
                      ),  
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 18,),
              // Text(widget.feedbacknya.perihal,
              //   style: blackTextStyle.copyWith(
              //     fontSize: 14,
              //     fontWeight: w400,
              //   ),),
              HtmlWidget(widget.feedbacknya.feedback.toString())
            ],
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    content(),
                  ],
                ),
                footer(),
              ],
            ),
          )),
      ),
    );
  }
}