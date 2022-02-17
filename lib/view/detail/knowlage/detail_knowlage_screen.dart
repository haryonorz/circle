import 'package:circle/model/knowlage_city.dart';
import 'package:circle/view/detail/knowlage/widgets/body_mobile.dart';
import 'package:circle/view/detail/knowlage/widgets/body_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailKnowlageScreen extends StatefulWidget {
  final KnowlageCity knowlageCity;

  const DetailKnowlageScreen({
    required this.knowlageCity,
    Key? key,
  }) : super(key: key);

  @override
  _DetailKnowlageScreenState createState() => _DetailKnowlageScreenState();
}

class _DetailKnowlageScreenState extends State<DetailKnowlageScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        body: ((defaultTargetPlatform == TargetPlatform.android ||
                    defaultTargetPlatform == TargetPlatform.iOS) ||
                (constraints.maxWidth <= 600))
            ? BodyMobile(knowlageCity: widget.knowlageCity)
            : BodyWeb(knowlageCity: widget.knowlageCity),
      );
    });
  }
}
