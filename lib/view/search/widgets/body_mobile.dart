import 'package:circle/component/no_data.dart';
import 'package:circle/component/search_textfield.dart';
import 'package:circle/component/small_trip_card.dart';
import 'package:circle/model/trip.dart';
import 'package:flutter/material.dart';

class BodyMobile extends StatefulWidget {
  const BodyMobile({Key? key}) : super(key: key);

  @override
  State<BodyMobile> createState() => _BodyMobileState();
}

class _BodyMobileState extends State<BodyMobile> {
  List<Trip> searchResult = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SearchTextField(
              readOnly: false,
              autoFocus: true,
              onChanged: (text) {
                setState(() {
                  if (text.isNotEmpty) {
                    searchResult = tripList
                        .where((element) => element.name
                            .toLowerCase()
                            .contains(text.toLowerCase()))
                        .toList();
                  } else {
                    searchResult = [];
                  }
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: searchResult.isEmpty
                  ? const NoData()
                  : GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      children: searchResult
                          .map((trip) => SmallTripCard(trip: trip))
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
