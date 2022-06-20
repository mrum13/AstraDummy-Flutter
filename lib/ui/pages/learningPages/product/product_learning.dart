import 'package:astra/provider/product_cub_provider.dart';
import 'package:astra/provider/product_matic_provider.dart';
import 'package:astra/provider/product_sport_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/pages/learningPages/product/detail_product_learning_page.dart';
import 'package:astra/ui/widgets/card_motor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductLearningPage extends StatefulWidget {
  const ProductLearningPage({Key? key}) : super(key: key);

  @override
  State<ProductLearningPage> createState() => _ProductLearningPageState();
}

class _ProductLearningPageState extends State<ProductLearningPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    ProductCubProvider cubProvider = Provider.of(context);
    ProductSportProvider sportProvider = Provider.of(context);
    ProductMaticProvider maticProvider = Provider.of(context);

    refreshDataCustomerCountAndRefresh() async {
      await Provider.of<ProductCubProvider>(context, listen: false)
          .getProductCub();
      await Provider.of<ProductSportProvider>(context, listen: false)
          .getProductSport();
      await Provider.of<ProductMaticProvider>(context, listen: false)
          .getProductMatic();
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
      body: SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Matic',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: w700),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 3,
                  children: maticProvider.product
                      .map((matic) => CardMotor(
                          imageUrl: matic.type[0].colorTypeModel.image.name !=
                                  'images kosong'
                              ? 'https://personakonsumen.com/storage/images/' +
                                  matic.type[0].colorTypeModel.image.name
                                      .toString()
                              : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                          titleCard: matic.name + ' ' + matic.type[0].name,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailProductLearningPage(matic),
                              ),
                            );
                          }))
                      .toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(),
            Text(
              'Sport',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: w700),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 3,
                  children: sportProvider.product
                      .map((e) => CardMotor(
                          imageUrl: e.type[0].colorTypeModel.image.name !=
                                  'images kosong'
                              ? 'https://personakonsumen.com/storage/images/' +
                                  e.type[0].colorTypeModel.image.name.toString()
                              : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                          titleCard: e.name + ' ' + e.type[0].name,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailProductLearningPage(e),
                              ),
                            );
                          }))
                      .toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(),
            Text(
              'CUB',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: w700),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 3,
                  children: cubProvider.product
                      .map((e) => CardMotor(
                          imageUrl: e.type[0].colorTypeModel.image.name !=
                                  'images kosong'
                              ? 'https://personakonsumen.com/storage/images/' +
                                  e.type[0].colorTypeModel.image.name.toString()
                              : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg',
                          titleCard: e.name + ' ' + e.type[0].name,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailProductLearningPage(e),
                              ),
                            );
                          }))
                      .toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
