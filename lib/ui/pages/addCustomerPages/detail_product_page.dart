import 'package:astra/model/product_model.dart';
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/model/type_model.dart';
import 'package:astra/provider/category_provider.dart';
import 'package:astra/provider/customer_count_provider.dart';
import 'package:astra/provider/customer_provider.dart';
import 'package:astra/provider/priority_provider.dart';
import 'package:astra/provider/product_cub_provider.dart';
import 'package:astra/provider/product_matic_provider.dart';
import 'package:astra/provider/product_provider.dart';
import 'package:astra/provider/product_sport_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/pages/learningPages/document/detail_dokumen_learning.dart';
import 'package:astra/ui/widgets/card_detail_motor.dart';
import 'package:astra/ui/widgets/card_modal.dart';
import 'package:astra/ui/widgets/custom_button.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailProductPage extends StatefulWidget {
  final ProductModel product;

  const DetailProductPage(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  List<ProductModel> listProductModel = [];
  late ProductModel productModel;
  late ProductModel tipeProductModel;

  late Object selectedCategory = widget.product.categoryId;
  late Object selectedType = widget.product.id;
  String namaMotor = '';
  String idMotor = '';
  bool condition = true;

  BoxBorder warnaBorder = Border.all(color: kGreyColor);

  @override
  Widget build(BuildContext context) {
    CustomerProvider customerProvider = Provider.of<CustomerProvider>(context);
    //product provide

    //priority provider
    final PriorityProvider priorityProvider = Provider.of(context);

    //category provider
    final CategoryProvider categoryProvider = Provider.of(context);

    String idPriority = '0';

    ProductProvider productProvider = Provider.of(context);
    ProductCubProvider cubProvider = Provider.of(context);
    ProductSportProvider sportProvider = Provider.of(context);
    ProductMaticProvider maticProvider = Provider.of(context);

    List<Widget> isiKategoriWidget = [];
    List<ProductModel> isiKategori = [];

    List<Widget> isiTipeWidget = [];
    List<ProductModel> isiTipe = [];

    //DATA LIST KNOWLEDGE
    List<Widget> priorityContent = priorityProvider.priority.map((e) {
      idPriority = e.id.toString();
      return Column(
        children: e.knowledge
            .map((el) => CardDetailMotor(
                  content: el.name,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailDokumenLearningPage(el, 'add_customer'),
                      ),
                    );
                  },
                ))
            .toList(),
      );
    }).toList();

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(
          'Detail Penjelasan Produk',
          style: blackTextStyle.copyWith(fontSize: 18, fontWeight: w800),
        ),
      );
    }

    Widget helperPilihKategoriMotor() {
      return Container(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          'Pilihan Produk',
          style: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: w400,
          ),
        ),
      );
    }

    Widget helperPilihTipeMotor() {
      return Container(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          'Tipe Produk',
          style: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: w400,
          ),
        ),
      );
    }

    // if (selectedCategory == 1) {
    //   isiKategori = cubProvider.product;
    //   isiTipeWidget = cubProvider.product.map((e) => Column(children: e.type.map((isi) => Text(isi.name)).toList(),)).toList();
    //   cubProvider.product.map((e) {
    //     // tipeProductModel = e;
    //     if (condition == true) {
    //       productModel = e;
    //       // tipeProductModel = e;
    //       selectedType = e.id;
    //     } else {
    //     }
    //   }).toList();
    // } else if (selectedCategory == 2) {
    //   isiKategori = maticProvider.product;
    //   isiTipeWidget = maticProvider.product.map((e) => Column(children: e.type.map((isi) => Text(isi.name)).toList(),)).toList();
    //   maticProvider.product.map((e) {
    //     // tipeProductModel = e;
    //     if (condition == true) {
    //       productModel = e;
    //       selectedType = e.id;
    //       tipeProductModel = e;
    //     } else {
    //     }
    //   }).toList();
    // } else if (selectedCategory == 3) {
    //   isiKategori = sportProvider.product;
    //   isiTipeWidget = sportProvider.product.map((e) => Column(children: e.type.map((isi) => Text(isi.name)).toList(),)).toList();
    //   sportProvider.product.map((e) {
    //     // tipeProductModel = e;
    //     if (condition == true) {
    //       productModel = e;
    //       selectedType = e.id;
    //       tipeProductModel = e;
    //     } else {}
    //   }).toList();
    // }

    if (selectedCategory == 1) {
      isiTipeWidget = cubProvider.product
          .map((e) => Row(
                children: e.type
                    .map((isi) => GestureDetector(
                          onTap: () {
                            setState(() {
                              namaMotor = e.name+' '+isi.name;
                              idMotor = e.id.toString();
                            });
                          },
                          child: Container(
                            width: 80,
                            height: 82,
                            margin: const EdgeInsets.only(left: 20),
                            padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
                            decoration: BoxDecoration(
                                border: warnaBorder,
                                borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 48,
                                  child: Image.network(isi.colorTypeModel
                                              .image.name !=
                                          'images kosong'
                                      ? 'https://personakonsumen.com/storage/images/' +
                                          isi.colorTypeModel.image.name
                                              .toString()
                                      : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      e.name,
                                      style: blackTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ))
          .toList();
    } else if (selectedCategory == 2) {
      isiTipeWidget = maticProvider.product
          .map((e) => Row(
                children: e.type
                    .map((isi) => GestureDetector(
                          onTap: () {
                            setState(() {
                              namaMotor = e.name+' '+isi.name;
                              idMotor = e.id.toString();
                            });
                          },
                          child: Container(
                            width: 80,
                            height: 82,
                            margin: const EdgeInsets.only(left: 20),
                            padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
                            decoration: BoxDecoration(
                                border: warnaBorder,
                                borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 48,
                                  child: Image.network(isi.colorTypeModel
                                              .image.name !=
                                          'images kosong'
                                      ? 'https://personakonsumen.com/storage/images/' +
                                          isi.colorTypeModel.image.name
                                              .toString()
                                      : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      e.name,
                                      style: blackTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ))
          .toList();
    } else if (selectedCategory == 3) {
      isiTipeWidget = sportProvider.product
          .map((e) => Row(
                children: e.type
                    .map((isi) => GestureDetector(
                          onTap: () {
                            setState(() {
                              namaMotor = e.name+' '+isi.name;
                              idMotor = e.id.toString();
                            });
                          },
                          child: Container(
                            width: 80,
                            height: 82,
                            margin: const EdgeInsets.only(left: 20),
                            padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
                            decoration: BoxDecoration(
                                border: warnaBorder,
                                borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 48,
                                  child: Image.network(isi.colorTypeModel
                                              .image.name !=
                                          'images kosong'
                                      ? 'https://personakonsumen.com/storage/images/' +
                                          isi.colorTypeModel.image.name
                                              .toString()
                                      : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      e.name,
                                      style: blackTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ))
          .toList();
    }

    Widget optionMotor() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Data dropdown kaktegori
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kategori Produk'),
                  const SizedBox(
                    height: 6,
                  ),
                  DropdownButton(
                      hint: const Text('Pilih Kategori'),
                      value: selectedCategory,
                      items: categoryProvider.category.map((e) {
                        return DropdownMenuItem(
                          child: Text(e.name),
                          value: e.id,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          condition = true;
                          selectedCategory = value!;
                        });
                      })
                ],
              ),
            ),
          ],
        ),
      );
    }

    // isiKategoriWidget = isiKategori.map((e) {
    //   return GestureDetector(
    //       onTap: () {
    //         setState(() {
    //           tipeProductModel = e;
    //           condition = false;
    //         });
    //       },
    //       child: Container(
    //         width: 80,
    //         height: 82,
    //         margin: const EdgeInsets.only(left: 20),
    //         padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
    //         decoration: BoxDecoration(
    //             border: warnaBorder, borderRadius: BorderRadius.circular(4)),
    //         child: Column(
    //           children: [
    //             Container(
    //               width: double.infinity,
    //               height: 48,
    //               child: Image.network(e.type[0].colorTypeModel.image.name !=
    //                       'images kosong'
    //                   ? 'https://personakonsumen.com/storage/images/' +
    //                       e.type[0].colorTypeModel.image.name.toString()
    //                   : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(4),
    //               ),
    //             ),
    //             Expanded(
    //               child: Align(
    //                 alignment: Alignment.bottomCenter,
    //                 child: Text(
    //                   e.name,
    //                   style: blackTextStyle.copyWith(
    //                     fontSize: 12,
    //                     fontWeight: w400,
    //                   ),
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     );
    // }).toList();

    // isiTipeWidget = tipeProductModel.type.map((e) {
    //   return GestureDetector(
    //       onTap: () {
    //         setState(() {
    //           namaMotor = e.name.toString();
    //           idMotor = e.id.toString();
    //         });
    //       },
    //       child: Container(
    //         width: 80,
    //         height: 82,
    //         margin: const EdgeInsets.only(left: 20),
    //         padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
    //         decoration: BoxDecoration(
    //             border: warnaBorder, borderRadius: BorderRadius.circular(4)),
    //         child: Column(
    //           children: [
    //             Container(
    //               width: double.infinity,
    //               height: 48,
    //               child: Image.network(e.colorTypeModel.image.name !=
    //                       'images kosong'
    //                   ? 'https://personakonsumen.com/storage/images/' +
    //                       e.colorTypeModel.image.name.toString()
    //                   : 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(4),
    //               ),
    //             ),
    //             Expanded(
    //               child: Align(
    //                 alignment: Alignment.bottomCenter,
    //                 child: Text(
    //                   e.name,
    //                   style: blackTextStyle.copyWith(
    //                     fontSize: 12,
    //                     fontWeight: w400,
    //                   ),
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     );
    // }).toList();

    // Widget listKategoriMotor() {
    //   return SingleChildScrollView(
    //     scrollDirection: Axis.horizontal,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: isiKategoriWidget,
    //     ),
    //   );
    // }

    Widget listTipeMotor() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: isiTipeWidget,
        ),
      );
    }

    Widget detailMotor() {
      return Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Detail penjelasan untuk produk ',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: w400,
                  ),
                ),
                Expanded(
                  child: Text(
                    namaMotor,
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      );
    }

    handleDataCount() async {
      await Provider.of<CustomerCountProvider>(context, listen: false)
          .getCustomerCount();
    }

    Widget modalSuccess(BuildContext context) {
      return CardModal(
        textStyle: greenTextStyle.copyWith(fontSize: 16, fontWeight: w700),
        icon: 'assets/icon_success.png',
        title: 'Berhasil',
        subtitle: 'Data customer berhasil tersimpan',
        buttonText: 'Selesai',
        onPressModal: () {
          handleDataCount();
          Navigator.pushNamed(context, '/dashboard');
        },
      );
    }

    Widget modalFailed(BuildContext context) {
      return CardModal(
        textStyle: yellowTextStyle.copyWith(fontSize: 16, fontWeight: w700),
        icon: 'assets/icon_failed.png',
        title: 'Gagal',
        subtitle:
            'Sayang sekali gagal menyimpan data, mohon pilih tipe produk terlebih dahulu atau periksan koneksi internet anda.',
        buttonText: 'Coba Lagi',
        onPressModal: () {
          Navigator.pop(context);
        },
      );
    }

    Widget footer() {
      Widget backButton() {
        return ButtonBack(
          onTap: () {
            Navigator.pushNamed(context, '/add-customer');
          },
          icon: 'assets/icon_back_orange.png',
          width: 40,
          height: 40,
        );
      }

      handleaddCustomer() async {
        if (await customerProvider.addCustomer(
            name: SharedPreference.dataCustomer.getString("name"),
            jenisKelamin: SharedPreference.token.getString("jenis_kelamin"),
            pekerjaan: SharedPreference.token.getString("job"),
            phone: SharedPreference.token.getString("phone"),
            usia: SharedPreference.token.getString("usia"),
            priorityId: idPriority.toString(),
            productId: idMotor.toString())) {
          // Navigator.pushNamed(context, '/dashboard');
          return showModalBottomSheet(
              context: context,
              builder: (BuildContext con) {
                return SafeArea(child: modalSuccess(context));
              });
        } else {
          // showProgress();
          return showModalBottomSheet(
              context: context,
              builder: (BuildContext con) {
                return SafeArea(child: modalFailed(context));
              });
        }
      }

      Widget buttonLanjutkan() {
        return Flexible(
          child: CustomButton(
              title: 'Simpan Data Customer',
              height: 40,
              onPressed: () {
                handleaddCustomer();
              }),
        );
      }

      return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            backButton(),
            const SizedBox(
              width: 20,
            ),
            buttonLanjutkan(),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            child: Stack(
              children: [
                ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    const SizedBox(
                      height: 20,
                    ),
                    optionMotor(),
                    const SizedBox(
                      height: 16,
                    ),
                    // helperPilihKategoriMotor(),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // listKategoriMotor(),
                    // const SizedBox(
                    //   height: 24,
                    // ),
                    helperPilihTipeMotor(),
                    const SizedBox(
                      height: 10,
                    ),
                    listTipeMotor(),
                    const SizedBox(
                      height: 24,
                    ),
                    detailMotor(),
                    Column(children: priorityContent),
                    // Column(children: priorityProvider.priority.map((priority) => CardDetailMotor(content: priority.knowledge.name)).toList(),),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
