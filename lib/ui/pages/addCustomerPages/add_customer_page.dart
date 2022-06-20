
import 'package:astra/model/shared_preferece.dart';
import 'package:astra/provider/category_provider.dart';
import 'package:astra/provider/job_provider.dart';
import 'package:astra/provider/knowladge_provider.dart';
import 'package:astra/provider/priority_provider.dart';
import 'package:astra/provider/product_cub_provider.dart';
import 'package:astra/provider/product_matic_provider.dart';
import 'package:astra/provider/product_provider.dart';
import 'package:astra/provider/product_sport_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/pages/addCustomerPages/detail_product_page.dart';
import 'package:astra/ui/widgets/custom_button.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCustomerPage extends StatefulWidget {


  const AddCustomerPage({Key? key,
  }) : super(key: key);

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();

}

class _AddCustomerPageState extends State<AddCustomerPage> {

  //validate textfield
  bool _validateName = false;
  bool _validateAge = false;

  bool hasilValidate = true;

  int group = 2;

  @override
  void initState() {
    super.initState();
    group = 2;
  }

  setSelectedRadio(int val) {
    setState(() {
      group = val;
    });
  }

  bool isProgress = false;

  void showProgress() {
    setState(() {
      isProgress = !isProgress;
    });
  }

  TextEditingController nameController = TextEditingController(text: 'testing');
  TextEditingController usiaController = TextEditingController(text: '28');
  TextEditingController phoneController = TextEditingController(text: '62');

  late Object selectedJob = 5;
  late Object selectedAge = 3;

  late String dummyUmur = '20';

  @override
  Widget build(BuildContext context) {

    ProductProvider productProvider = Provider.of(context);
    ProductMaticProvider maticProvider = Provider.of(context);

    final JobProvider jobProvider = Provider.of(context);

    Widget body() {

      Widget formPekerjaan() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pekerjaan',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: w400,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            DropdownButton(
              hint: const Text('Pilih pekerjaan'),
              value: selectedJob,
              items: jobProvider.job.map((e) => 
                DropdownMenuItem(
                  child: Text(e.name),
                  value: e.id,
                )
              ).toList(), 
              onChanged: (value) {
                setState(() {
                  selectedJob = value!;
                });
              }
            )
          ],
        );
      }

      Widget formName() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: w400,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: w400,
              ),
              cursorColor: kBlackColor,
              controller: nameController,
              decoration: InputDecoration(
                errorText: _validateName ? 'Tidak boleh kosong' : null,
                hintText: 'Masukkan nama',
                hintStyle:
                    greyTextStyle.copyWith(fontSize: 14, fontWeight: w400),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
            )
          ],
        );
      }

      Widget jenisKelamin() {
        Widget helperJK() {
          return Text(
            'Jenis Kelamin',
            style: blackTextStyle.copyWith(fontWeight: w400, fontSize: 12),
          );
        }

        Widget radioJK() {
          return Row(
            children: <Widget>[
              Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: 1,
                  activeColor: kPrimaryColor,
                  groupValue: group,
                  onChanged: (dynamic val) {
                    setSelectedRadio(val);
                  }),
              const Text('Laki-Laki'),
              Container(
                margin: const EdgeInsets.only(left: 76),
                child: Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: 2,
                    activeColor: kPrimaryColor,
                    groupValue: group,
                    onChanged: (dynamic val) {
                      setSelectedRadio(val);
                    }),
              ),
              const Text('Perempuan'),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            helperJK(),
            const SizedBox(
              height: 12,
            ),
            radioJK(),
          ],
        );
      }

      Widget formUsia() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Usia',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: w400,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: w400,
              ),
              keyboardType: TextInputType.number,
              cursorColor: kBlackColor,
              controller: usiaController,
              decoration: InputDecoration(
                errorText: _validateAge ? 'Tidak boleh kosong' : null,
                hintText: 'Masukkan usia',
                hintStyle:
                    greyTextStyle.copyWith(fontSize: 14, fontWeight: w400),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
            )
          ],
        );
      }

      Widget formPhone() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'No. Telepon (Opsional)',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: w400,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: w400,
              ),
              cursorColor: kBlackColor,
              controller: phoneController,
              decoration: InputDecoration(
                
                hintText: 'Masukkan nomor telepon',
                hintStyle:
                    greyTextStyle.copyWith(fontSize: 14, fontWeight: w400),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
            )
          ],
        );
      }

      return ListView(
        shrinkWrap: true,
        children: [
          formName(),
          const SizedBox(
            height: 20,
          ),
          jenisKelamin(),
          const SizedBox(
            height: 20,
          ),
          formUsia(),
          const SizedBox(
            height: 20,
          ),
          formPekerjaan(),
          const SizedBox(
            height: 20,
          ),
          formPhone(),
        ],
      );
    }

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Text(
          'Tambah Customer',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: w800,
          ),
        ),
      );
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

      String usia = usiaController.text.toString();
      String jenisKelamin = group==1?'laki-laki':'perempuan'.toString();
      String jobId = selectedJob.toString();

      goToDetail() {
        showProgress(); 
        productProvider.product.map((e) => Navigator.push(context,
          MaterialPageRoute(
            builder: (context) =>
                DetailProductPage(e),
          ),
        )
        ).toList();
      }

      failedGetPriority() {
        showProgress();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: kPrimaryColor,
            content: const Text(
              'Maaf, tidak ada prioritas',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      cekForm(bool condition) {
        setState(() {
          nameController.text.isEmpty ? _validateName = true: _validateName = false;
          usiaController.text.isEmpty ? _validateAge = true: _validateAge = false;
        });

        if (_validateName==false && _validateAge==false){
          hasilValidate = false;
          return false;
        } else {
          return true;
        }
      }



      handleContinue() async {
        showProgress();
        // await Provider.of<ProductProvider>(context, listen: false).getProduct();
        await Provider.of<ProductMaticProvider>(context, listen: false).getProductMatic();
        await Provider.of<ProductSportProvider>(context, listen: false).getProductSport();
        await Provider.of<ProductCubProvider>(context, listen: false).getProductCub();
        await Provider.of<ProductCubProvider>(context, listen: false).getTypeProductCub();

        await Provider.of<KnowladgeProvider>(context, listen: false).getKnowladge();
        await Provider.of<CategoryProvider>(context, listen: false).getCategory();
        SharedPreference.dataCustomer?.setString("name", nameController.text.toString());
        SharedPreference.dataCustomer?.setString("usia", usia);
        SharedPreference.dataCustomer?.setString("phone", phoneController.text.toString());
        SharedPreference.dataCustomer?.setString("jenis_kelamin", jenisKelamin);
        SharedPreference.dataCustomer?.setString("job", jobId);
        bool cek = await Provider.of<PriorityProvider>(context, listen: false).getPriority(age: usia, jobId: jobId, gender: jenisKelamin);
        cek ?   goToDetail(): failedGetPriority();
      }

      Widget buttonLanjutkan() {
        return Flexible(
          child: CustomButton(
              title: 'Lanjutkan',
              height: 40,
              onPressed: () {
                cekForm(hasilValidate);
                (hasilValidate)?null:handleContinue();
                // handleContinue();
              }),
        );
      }

      return Expanded(
          child: Align(
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
      ));
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: SafeArea(
              child: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                const SizedBox(
                  height: 20,
                ),
                body(),
                // Column(children: jobProvider.job.map((e) => Text(e.name)).toList()),
                footer(),
              ],
            ),
            Visibility(
                  visible: isProgress,
                  child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: kGreyColor,
                        valueColor: AlwaysStoppedAnimation(kPrimaryColor),),
                ),)
          ],
        ),
      ))),
    );
  }
}