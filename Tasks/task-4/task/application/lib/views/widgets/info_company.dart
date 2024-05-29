import 'package:application/controllers/company_controller.dart';
import 'package:application/models/employee.dart';
import 'package:application/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCompany extends StatefulWidget {
  final CompanyContoller companyController;
  const InfoCompany({super.key, required this.companyController});

  @override
  State<InfoCompany> createState() => _InfoCompanyState();
}

class _InfoCompanyState extends State<InfoCompany> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productStockController = TextEditingController();

  void addEmployee() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final newEmployee = Employee(
          name: nameController.text,
          age: int.parse(ageController.text),
          position: positionController.text,
          skills: ['nothing']);
      setState(() {
        widget.companyController.list[0].employee.add(newEmployee);
        nameController.clear();
        ageController.clear();
        positionController.clear();
        skillsController.clear();
      });
      Navigator.of(context).pop();
    }
  }

  void addProduct() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final newProduct = Product(
          name: productController.text,
          price: double.parse(productPriceController.text),
          inStock: productStockController.text == 'y' ? true : false);
      setState(() {
        widget.companyController.list[0].product.add(newProduct);
        productController.clear();
        productPriceController.clear();
        productStockController.clear();
        skillsController.clear();
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: widget.companyController.list.length,
          itemBuilder: ((context, index) {
            final company = widget.companyController.list[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 60,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        company.companyName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        company.location,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Text(
                      'Employees',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    ...company.employee.map((employee) => ListTile(
                          title: Text(employee.name),
                          subtitle: Text(
                              'Age: ${employee.age}, Position: ${employee.position}'),
                        )),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: Text('Add a new product'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Form(
                                        key: formKey,
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller: productController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Enter new products\'s name',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.trim().isEmpty) {
                                                  return 'Please enter a product';
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            TextFormField(
                                              controller:
                                                  productPriceController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Enter product\'s price',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.trim().isEmpty) {
                                                  return 'Please enter product\'s price';
                                                }
                                                if (double.tryParse(value) ==
                                                    null) {
                                                  return 'Please enter valid price';
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            TextFormField(
                                              controller:
                                                  productStockController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Enter product\'s stock (true/false)',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.trim().isEmpty) {
                                                  return 'Please fill the form';
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        addProduct();
                                      },
                                      child: const Text('Add'),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(CupertinoIcons.plus_circle)),
                    const Divider(),
                    const Text(
                      'Products',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    ...company.product.map((product) => ListTile(
                          title: Text(product.name),
                          subtitle: Text(
                              'Price: \$${product.price}, In Stock: ${product.inStock}'),
                        )),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: Text('Add an employee'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Form(
                                        key: formKey,
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller: nameController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Enter employee\'s name',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.trim().isEmpty) {
                                                  return 'Please enter a name';
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            TextFormField(
                                              controller: ageController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Enter employee\'s age',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.trim().isEmpty) {
                                                  return 'Please enter an age';
                                                }
                                                if (int.tryParse(value) ==
                                                    null) {
                                                  return 'Please enter a valid number';
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            TextFormField(
                                              controller: positionController,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Enter employee\'s position',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.trim().isEmpty) {
                                                  return 'Please enter a position';
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        addEmployee();
                                      },
                                      child: const Text('Add'),
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(CupertinoIcons.plus_circle)),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
