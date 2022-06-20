import 'package:astra/provider/customer_provider.dart';
import 'package:astra/shared/theme.dart';
import 'package:astra/ui/pages/customerPages/detail_customer_list_page.dart';
import 'package:astra/ui/widgets/card_customer.dart';
import 'package:astra/ui/widgets/custom_button_back.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({ Key? key }) : super(key: key);

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {

  //PENYIMPANAN DATA
  List<Widget> penyimpananData = [];
  List<Widget> dataSearch = [];

  //LOOPING DATA
  List<Widget> loopingIsiListCustomer = [];
  List<Widget> loopingrefresh = [];

  bool condition = false;
  bool conditionSearch = false;
  int id=1;

  @override
  Widget build(BuildContext context) {
    CustomerProvider customerProvider = Provider.of(context);

    TextEditingController searchController = TextEditingController(text: '');

    getDataCustomerSearch() async {
      await Provider.of<CustomerProvider>(context, listen: false).getCustomerBySearch(searchController.text);
    }

    getDataCustomer() async {
      await Provider.of<CustomerProvider>(context, listen: false).getCustomer(customerProvider.countPage.toString());
    }
    
    final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

    void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    customerProvider.resetCount();
    await Provider.of<CustomerProvider>(context, listen: false).getCustomer(customerProvider.countPage.toString());
    condition = true;
    if(mounted) {
      setState(() {
      penyimpananData = [];
      loopingIsiListCustomer = [];
      loopingrefresh= customerProvider.customer.map((e) {
        String datenya =
            DateFormat('dd MMMM yyyy')  .format(e.createdAt).toString();
        return CardCustomer(
          name: e.name, 
          date: datenya, 
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailCustomerListPage(e),
              ),
            );
          }
        );
      }).toList();
      penyimpananData.addAll(loopingrefresh);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: kGreenColor,
          content: const Text(
            'Data terupdate',
            textAlign: TextAlign.center,
          ),
        ),
      );
    });
    }
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();  
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    customerProvider.increamentPage();
    condition = true;
    await Provider.of<CustomerProvider>(context, listen: false).getCustomer(customerProvider.countPage.toString());
    if(mounted) {
      setState(() {
      loopingIsiListCustomer = customerProvider.customer.map((e) {
      id = e.id;
      String datenya =
          DateFormat('dd MMMM yyyy').format(e.createdAt).toString();
      return CardCustomer(
        name: e.name, 
        date: datenya, 
        ontap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailCustomerListPage(e),
            ),
          );
        }
      );
    }).toList();
    if(id == 0) {
      customerProvider.resetCount();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: kPrimaryColor,
          content: const Text(
            'Data sudah tidak ada',
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      penyimpananData.addAll(loopingIsiListCustomer);
      // penyimpananData = loopingIsiListCustomer;
    }
    });
    }
    _refreshController.loadComplete();
  }


    //LOOPING DATA PERPAGE

    loopingIsiListCustomer= customerProvider.customer.map((e) {
      String datenya =
          DateFormat('dd MMMM yyyy').format(e.createdAt).toString();
      return CardCustomer(
        name: e.name, 
        date: datenya, 
        ontap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailCustomerListPage(e),
            ),
          );
        }
      );
    }).toList();

    print('sebelumn ditambahkan');

    if(condition == false){
      penyimpananData.addAll(loopingIsiListCustomer.toList());
    } else {
    }

    cekForm() {
      if (searchController.text != '') {
        penyimpananData = [];
        getDataCustomerSearch();
        condition = false;
      } else {
        penyimpananData = [];
        getDataCustomer();
        condition = false;
      }
    }

    Widget header() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          'Daftar Customer',
          style: blackTextStyle.copyWith(
            fontWeight: w800,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget searchFormField() {
      return TextFormField(
        controller: searchController,
        onFieldSubmitted: (value) {
          cekForm();
        },
        style: blackTextStyle.copyWith(
          fontSize: 14,
          fontWeight: w400,
        ),
        cursorColor: kBlackColor,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: (){cekForm();},
            child: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child:
                    Image.asset('assets/icon_search.png', height: 24, width: 24)),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          filled: true,
          fillColor: kGreyFormColor,
          hintText: 'Cari customer',
          hintStyle: greyTextStyle.copyWith(fontSize: 14, fontWeight: w400),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: kLineColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: kLineColor)),
        ),
      );
    }

    Widget footer() {
      Widget backButton() {
        return ButtonBack(
          icon: 'assets/icon_back_red.png',
          onTap: () {
            customerProvider.resetCount();
            print('kembali='+customerProvider.countPage.toString());
            condition = false;
            Navigator.pushNamed(context, '/dashboard');
          },
        );
      }

      return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
            margin: const EdgeInsets.only(bottom: 20), child: backButton()),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(),
                  const SizedBox(
                    height: 16,
                  ),
                  searchFormField(),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    child: SmartRefresher(
                      enablePullDown: false,
                      enablePullUp: true,
                      controller: _refreshController,
                      onRefresh: _onRefresh,
                      onLoading: _onLoading,
                      child: ListView(
                        children: penyimpananData,
                      )
                      ),
                  )
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
