import 'package:astra/model/information_model.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

class DetailInformasiPage extends StatefulWidget {
  final String fromWhere;
  final InformationModel information;
  
  const DetailInformasiPage(
    this.information,
    this.fromWhere, {Key? key}
  ) : super(key: key);

  @override
  State<DetailInformasiPage> createState() => _DetailInformasiPageState();
}

class _DetailInformasiPageState extends State<DetailInformasiPage> {
  @override
  Widget build(BuildContext context) {

    String goBack = (widget.fromWhere=='home')?'/dashboard':'/informasi';

    Widget header() {
      return Container(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          'Detail Informasi',
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
              Visibility(
                visible: widget.information.image == 'default.jpg' ? false : true,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  width: double.infinity,
                  height: 166,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: kGreyColor,
                  ),
                  child: Image.network('https://personakonsumen.com/storage/images/'+widget.information.image, fit: BoxFit.fill,),
                ),
              ),
              Text(widget.information.title,
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
                    Text(DateFormat('dd MMMM yyyy').format(widget.information.createdAt).toString(), 
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
              // Text(widget.information.description,
              //   style: blackTextStyle.copyWith(
              //     fontSize: 14,
              //     fontWeight: w400,
              //   ),),
              HtmlWidget(widget.information.description.toString())
            ],
          ),
        ),
      );
    }

    Widget buttonBack(){
      return Align(
        alignment: Alignment.bottomLeft,
        child: ButtonBack(
          onTap: (){Navigator.pushNamed(context, goBack);}, 
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
          )
        ),
      ),
    );
  }
}