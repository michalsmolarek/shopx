import 'package:flutter/material.dart';
import 'package:getx/screens/fav_screen/fav_screen_list.dart';

import '../home_page/custom_app_bar.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          body: const FavScreenList(),
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) =>
                  [CustomAppBar(title: "Favs")],
        ),
      ),
    );
  }
}
