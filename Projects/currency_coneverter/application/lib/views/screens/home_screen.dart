import 'package:application/models/currency.dart';
import 'package:application/services/currency_sevices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final currencyServices = CurrencyServices();
List<String> currencyCodes = [];
String fromCurrencyCode = '';

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _fromPriceController = TextEditingController();
  TextEditingController _toPriceController = TextEditingController();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  String? dropDownValue1;
  String initialFromImage = '';
  String initialToImage = '';
  bool isDownloaded = true;
  String convertCurToUzs = '0.0';
  String buyingPrice = '';
  String sellingPrice = '';
  List<Currency> currencies = [];

  @override
  void initState() {
    super.initState();
    getCurrenciesByName();
    // getSavedInfo();
  }

  void toggleIsDownloaded() {
    setState(() {
      isDownloaded = false;
    });
  }

  void convertCurrency(double currency, double howMuch) {
    _toPriceController.text = (currency * howMuch).toStringAsFixed(2);
    setState(() {});
  }

  Future<void> getCurrenciesByName() async {
    currencies = await currencyServices.getAllCurrencies();
    currencyCodes = currencies.map((currency) => currency.code!).toList();
    if (currencyCodes.isNotEmpty) {
      dropDownValue1 = currencyCodes.first;
      saveString();
      getString();
    }

    setState(() {});
  }

  void saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dropDownValue1', dropDownValue1!);
  }

  void getString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dropDownValue1 = prefs.getString('dropDownValue1');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F6),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            const Column(
              children: [
                Text(
                  'Currency Converter',
                  style: TextStyle(
                      color: Color(0xFF1F2261),
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(
                  'Check live rates, set rate alerts, receive notifications and more.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF808080)),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  // if (isDownloaded)
                  FutureBuilder(
                    future: currencyServices.getAllCurrencies(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [CircularProgressIndicator()],
                        );
                      }
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text('No data'),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }

                      final List<Currency> generalCurrency = snapshot.data;
                      // toggleIsDownloaded();
                      return Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Amount',
                                style: TextStyle(
                                    color: Color(0xFF989898),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 7),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DropdownButton<String>(
                                    icon: const Icon(Icons.expand_more),
                                    value: dropDownValue1,
                                    style: const TextStyle(
                                        color: Color(0xFF26278D),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropDownValue1 = value;
                                        fromCurrencyCode = value!;
                                        saveString();
                                      });
                                    },
                                    elevation: 16,
                                    underline: Container(),
                                    items: generalCurrency.map((currency) {
                                      convertCurToUzs = currency.cbPrice!;
                                      initialFromImage =
                                          'assets/images/${currency.code!}.png';
                                      return DropdownMenuItem<String>(
                                        value: currency.code,
                                        child: Row(
                                          children: [
                                            Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Image.asset(
                                                initialFromImage,
                                                width: 30,
                                                height: 30,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Text(currency.code!),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: Form(
                                      key: formKey1,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: _fromPriceController,
                                        decoration: const InputDecoration(
                                            hintText: '0.0',
                                            border: OutlineInputBorder()),
                                        onChanged: (value) {
                                          if (_fromPriceController
                                              .text.isNotEmpty) {
                                            final double howMuch =
                                                double.tryParse(
                                                        _fromPriceController
                                                            .text) ??
                                                    0.0;

                                            convertCurrency(
                                                double.parse(convertCurToUzs),
                                                howMuch);
                                          }
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Converted Amount',
                                style: TextStyle(
                                    color: Color(0xFF989898),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 7),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 380.w,
                                    height: 50.h,
                                    child: Form(
                                      child: TextField(
                                        readOnly: true,
                                        keyboardType: TextInputType.number,
                                        controller: _toPriceController,
                                        decoration: const InputDecoration(
                                            hintText: '0.0',
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          const Text(
                            'Indicative Exchange Rate',
                            style: TextStyle(
                                color: Color(0xFFA1A1A1),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          if (_fromPriceController.text.isNotEmpty ||
                              _toPriceController.text.isNotEmpty)
                            Text(
                                '${_fromPriceController.text} $fromCurrencyCode = ${_toPriceController.text} UZS'),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
