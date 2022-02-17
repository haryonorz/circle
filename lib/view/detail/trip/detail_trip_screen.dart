import 'package:circle/model/trip.dart';
import 'package:circle/view/detail/trip/widgets/body_mobile.dart';
import 'package:circle/view/detail/trip/widgets/body_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailTripScreen extends StatefulWidget {
  final Trip trip;

  const DetailTripScreen({
    required this.trip,
    Key? key,
  }) : super(key: key);

  @override
  _DetailTripScreenState createState() => _DetailTripScreenState();
}

class _DetailTripScreenState extends State<DetailTripScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        body: ((defaultTargetPlatform == TargetPlatform.android ||
                    defaultTargetPlatform == TargetPlatform.iOS) ||
                (constraints.maxWidth <= 600))
            ? BodyMobile(trip: widget.trip)
            : BodyWeb(trip: widget.trip),
      );
    });
  }
}
