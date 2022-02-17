import 'package:circle/component/custom_appbar.dart';
import 'package:circle/model/constants.dart';
import 'package:circle/model/trip.dart';
import 'package:circle/view/favorite/widgets/body_mobile.dart';
import 'package:circle/view/favorite/widgets/body_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Trip> favoriteTrip =
      tripList.where((element) => element.favorite).toList();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        appBar: ((defaultTargetPlatform == TargetPlatform.android ||
                    defaultTargetPlatform == TargetPlatform.iOS) ||
                (constraints.maxWidth <= 600))
            ? customAppBar(
                title: const Text(
                  'Favorite',
                  style: TextStyle(color: black),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: black,
                  ),
                ),
              )
            : null,
        body: ((defaultTargetPlatform == TargetPlatform.android ||
                    defaultTargetPlatform == TargetPlatform.iOS) ||
                (constraints.maxWidth <= 600))
            ? BodyMobile(favoriteTrip: favoriteTrip)
            : BodyWeb(
                favoriteTrip: favoriteTrip,
              ),
      );
    });
  }
}
