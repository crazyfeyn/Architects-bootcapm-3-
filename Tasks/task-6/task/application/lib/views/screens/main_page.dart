import 'package:application/controllers/category_controller.dart';
import 'package:application/controllers/product_controller.dart';
import 'package:application/controllers/user_controller.dart';
import 'package:application/views/screens/category_page.dart';
import 'package:application/views/screens/product_page.dart';
import 'package:application/views/screens/user_page.dart';
import 'package:application/views/widgets/dropdown.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ProductController productsController = ProductController();
  CategoryController categoryController = CategoryController();
  UserController userController = UserController();
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {

    void switchMenu(int index){
      curIndex = index;
      setState(() {
        
      });
    }

    List menuList = [
      ProductPage(productsController: productsController), CategoryPage(categoryController: categoryController), UserPage(userController: userController)
    ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Shopping info'),
          actions: [
            IconButton(
                onPressed: () {
                  Dropdown.showDropDown(context, curIndex, switchMenu);
                },
                icon: const Icon(Icons.menu))
          ],
        ),
        body: menuList[curIndex]);
  }
}
