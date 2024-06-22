import 'package:application/models/currency.dart';
import 'package:application/services/currency_sevices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final currencyServices = CurrencyServices();
List<String> currencyCodes = [];
String fromCurrencyCode = '';
String toCurrencyCode = '';

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _fromPriceController = TextEditingController();
  TextEditingController _toPriceController = TextEditingController();
  GlobalKey<FormState> formKey_1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey_2 = GlobalKey<FormState>();
  String? dropDownValue_1;
  String? dropDownValue_2;
  String initialFromImage = '';
  String initialToImage = '';

  @override
  void initState() {
    super.initState();
    getCurrenciesByName();
    // getSavedInfo();
  }

  // Future<void> saveInfo(
  //     String fromCurrencyFlag,
  //     String toCurrencyFlag,
  //     String fromCurrencyCode,
  //     String toCurrencyCode,
  //     String fromCurrencyController,
  //     String toCurrencyController) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('fromCurrencyFlag', fromCurrencyFlag);
  //   await prefs.setString('toCurrencyFlag', toCurrencyFlag);
  //   await prefs.setString('fromCurrencyCode', fromCurrencyCode);
  //   await prefs.setString('toCurrencyCode', toCurrencyCode);
  //   await prefs.setString('fromCurrencyController', fromCurrencyController);
  //   await prefs.setString('toCurrencyController', toCurrencyController);
  // }

  // Future<void> getSavedInfo() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     fromCurrencyCode = prefs.getString('fromCurrencyCode') ?? 'USD';
  //     toCurrencyCode = prefs.getString('toCurrencyCode') ?? 'KRW';
  //     initialFromImage = prefs.getString('fromCurrencyFlag') ?? 'USD';
  //     initialToImage = prefs.getString('toCurrencyFlag') ?? 'KRW';
  //     _fromPriceController.text =
  //         prefs.getString('fromCurrencyController') ?? '0';
  //     _toPriceController.text = prefs.getString('toCurrencyController') ?? '0';
  //   });
  // }

  Future<void> getCurrenciesByName() async {
    List<Currency> currencies = await currencyServices.getAllCurrencies();
    setState(() {
      currencyCodes = currencies.map((currency) => currency.code!).toList();
      if (currencyCodes.isNotEmpty) {
        dropDownValue_1 = currencyCodes.first;
        dropDownValue_2 = currencyCodes[1];
        // initialFromImage = 'assets/images/${currencyCodes.first}.png';
        // initialToImage = 'assets/images/${currencyCodes[1]}.png';
      }
    });
  }

  void toggleSwitch() {
    setState(() {
      String? tempValue = dropDownValue_1;
      dropDownValue_1 = dropDownValue_2;
      dropDownValue_2 = tempValue;

      TextEditingController tempController = _fromPriceController;
      _fromPriceController = _toPriceController;
      _toPriceController = tempController;

      // saveInfo(initialFromImage, initialToImage, fromCurrencyCode,
      //     toCurrencyCode, _fromPriceController.text, _toPriceController.text);
    });
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
                                    value: dropDownValue_1,
                                    style: const TextStyle(
                                        color: Color(0xFF26278D),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropDownValue_1 = value;
                                        fromCurrencyCode = value!;
                                      });
                                    },
                                    elevation: 16,
                                    underline: Container(),
                                    items: generalCurrency.map((currency) {
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
                                      key: formKey_1,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: _fromPriceController,
                                        decoration: const InputDecoration(
                                            hintText: '0',
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              const Divider(),
                              Positioned(
                                child: InkWell(
                                  onTap: toggleSwitch,
                                  child: CircleAvatar(
                                    backgroundColor: const Color(0xFF26278D),
                                    child: Icon(
                                      Icons.change_circle,
                                      color: Colors.white,
                                      size: 35.h,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
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
                                  DropdownButton<String>(
                                    icon: const Icon(Icons.expand_more),
                                    value: dropDownValue_2,
                                    style: const TextStyle(
                                        color: Color(0xFF26278D),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropDownValue_2 = value;
                                        toCurrencyCode = value!;
                                      });
                                    },
                                    elevation: 16,
                                    underline: Container(),
                                    items: generalCurrency.map((currency) {
                                      initialToImage =
                                          'assets/images/${currency.code!}';
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
                                                'assets/images/$initialFromImage.png',
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
                                      key: formKey_2,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: _toPriceController,
                                        decoration: const InputDecoration(
                                            hintText: '0',
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
                          Text(
                              '${_fromPriceController.text} $fromCurrencyCode = ${_toPriceController.text} $toCurrencyCode')
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
