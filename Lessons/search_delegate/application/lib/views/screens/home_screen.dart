import 'package:application/models/car_model.dart';
import 'package:application/views/widgets/search_view_delegate.dart';
import 'package:flutter/material.dart';

class HomScreen extends StatefulWidget {
  const HomScreen({super.key});

  @override
  State<HomScreen> createState() => _HomScreenState();
}

class _HomScreenState extends State<HomScreen> {
  List<Car> data = [
  Car(name: 'Ford Model T', year: 1908),
  Car(name: 'Chevrolet Corvette', year: 1953),
  Car(name: 'Porsche 911', year: 1964),
  Car(name: 'Ferrari 250 GTO', year: 1962),
  Car(name: 'Lamborghini Miura', year: 1966),
  Car(name: 'Bugatti Veyron', year: 2005),
  Car(name: 'Tesla Model S', year: 2012),
  Car(name: 'McLaren F1', year: 1992),
  Car(name: 'Aston Martin DB5', year: 1963),
  Car(name: 'Jaguar E-Type', year: 1961),
  Car(name: 'Honda NSX', year: 1990),
  Car(name: 'Ford Mustang', year: 1964),
  Car(name: 'Chevrolet Camaro', year: 1966),
  Car(name: 'Dodge Charger', year: 1966),
  Car(name: 'BMW M3', year: 1986),
  Car(name: 'Mercedes-Benz 300SL', year: 1954),
  Car(name: 'Audi R8', year: 2006),
  Car(name: 'Nissan GT-R', year: 2007),
  Car(name: 'Toyota Supra', year: 1993),
  Car(name: 'Mazda MX-5', year: 1989),
  Car(name: 'Subaru Impreza WRX', year: 1992),
  Car(name: 'Volkswagen Beetle', year: 1938),
  Car(name: 'Mini Cooper', year: 1959),
  Car(name: 'Lancia Stratos', year: 1973),
  Car(name: 'Peugeot 205 GTi', year: 1984),
  Car(name: 'Citroën DS', year: 1955),
  Car(name: 'Rolls-Royce Phantom', year: 1925),
  Car(name: 'Bentley Continental GT', year: 2003),
  Car(name: 'Alfa Romeo Giulia', year: 1962),
  Car(name: 'Maserati Quattroporte', year: 1963),
];

  List<String> filteredData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
        actions: [
          IconButton(
              onPressed: () async {
                String? result = await showSearch(
                  context: context,
                  delegate: SearchViewDelegate(data),
                );
                print(result);
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
          itemCount: filteredData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(filteredData[index]),
            );
          }),
    );
  }
}
