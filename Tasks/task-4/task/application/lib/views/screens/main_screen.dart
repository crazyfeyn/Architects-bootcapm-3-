import 'package:application/controllers/company_controller.dart';
import 'package:application/views/widgets/info_company.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  final TextEditingController employee = TextEditingController();
  bool isLoading = true;
  final CompanyContoller companyController = CompanyContoller();
  @override
  void initState() {
    super.initState();
    companyController.getProducts().then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text('Company infos'),
        ),
        body: InfoCompany(companyController: companyController));
  }
}
