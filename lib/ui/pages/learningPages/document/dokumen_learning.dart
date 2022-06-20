import 'package:astra/provider/knowladge_provider.dart';
import 'package:astra/ui/pages/learningPages/document/detail_dokumen_learning.dart';
import 'package:astra/ui/widgets/card_dokumen_learning.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DokumenLearningPage extends StatefulWidget {
  const DokumenLearningPage({ Key? key }) : super(key: key);

  @override
  State<DokumenLearningPage> createState() => _DokumenLearningPageState();
}

class _DokumenLearningPageState extends State<DokumenLearningPage> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {

    KnowladgeProvider knowledgeProvider = Provider.of(context);

    refreshDataCustomerCountAndRefresh() async {
      await Provider.of<KnowladgeProvider>(context, listen: false)
          .getKnowladge();
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

    return Scaffold(
      body: SafeArea(
        child: SmartRefresher(
          enablePullDown: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView(
            children: knowledgeProvider.knowladge.map((e) => CardDokumenLearning(title: e.name, onTap: () {
              Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => DetailDokumenLearningPage(e, 'learning'),),);
            },)).toList()
          ),
        )),
    );
  }
}