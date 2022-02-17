import 'package:circle/component/search_textfield.dart';
import 'package:circle/view/home/widgets/category_trip.dart';
import 'package:circle/view/home/widgets/package_trip.dart';
import 'package:circle/view/home/widgets/posting_knowlage.dart';
import 'package:circle/view/search/search_screen.dart';
import 'package:flutter/material.dart';

class BodyMobile extends StatelessWidget {
  const BodyMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SearchTextField(
                readOnly: true,
                autoFocus: false,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchScreen();
                  }));
                },
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const PackageTrip(),
            const SizedBox(
              height: 12,
            ),
            const CategoryTrip(),
            const SizedBox(
              height: 32,
            ),
            const PostingKnowlage(),
          ],
        ),
      ),
    );
  }
}
