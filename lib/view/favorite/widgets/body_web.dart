import 'package:circle/component/no_data.dart';
import 'package:circle/component/small_trip_card.dart';
import 'package:circle/model/constants.dart';
import 'package:circle/model/trip.dart';
import 'package:flutter/material.dart';

class BodyWeb extends StatelessWidget {
  final List<Trip> favoriteTrip;

  const BodyWeb({
    required this.favoriteTrip,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: lightGrey,
      child: Scrollbar(
        isAlwaysShown: true,
        child: Center(
          child: Container(
            color: Colors.white,
            width: screenWidth <= 1200 ? 800 : 1200,
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: screenWidth <= 1200 ? 32 : 44,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Favorite',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: favoriteTrip.isEmpty
                      ? const NoData()
                      : LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                          int gridCout = 0;
                          if (constraints.maxWidth <= 600) {
                            gridCout = 2;
                          } else if (constraints.maxWidth <= 1200) {
                            gridCout = 4;
                          } else {
                            gridCout = 6;
                          }

                          return GridView.count(
                            crossAxisCount: gridCout,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            children: favoriteTrip
                                .map((trip) => SmallTripCard(trip: trip))
                                .toList(),
                          );
                        }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
