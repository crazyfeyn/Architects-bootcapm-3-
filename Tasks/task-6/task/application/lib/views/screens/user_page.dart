import 'package:application/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserPage extends StatefulWidget {
  final UserController userController;
  const UserPage({required this.userController, super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.userController.getProducts(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text('Datas are not found'),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          final users = snapshot.data;

          return users == null || users.isEmpty
              ? const Center(
                  child: Text('Datas are not found'),
                )
              : Center(
                  child: GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.18,
                        crossAxisSpacing: 10),
                    children: [
                      for (var i in users)
                        Column(
                          children: [
                            SizedBox(
                              height: 200,
                              child: Image.network(
                                i.avatar,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.start,
                              "\$${i.email}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 19),
                            ),
                          ],
                        )
                    ],
                  ),
                );
        }));
  }
}
