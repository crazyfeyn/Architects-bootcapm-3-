import 'package:application/utils/app_constatnts.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Favorites')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i in AppConstatnt.favorites)
                Column(
                  children: [
                    SizedBox(
                        height: 200,
                        width: 400,
                        child: Image.network(
                          i.imageUrl,
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                i.title,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                i.price.toString(),
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(i.description),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ],

            // children: [
            //   if(AppConstatnt.favorites.isNotEmpty) for(var i in AppConstatnt.favorites) Column(
            //     children: [

            //     ],
            //   )
            // ],
          ),
        ),
      ),
    );
  }
}
