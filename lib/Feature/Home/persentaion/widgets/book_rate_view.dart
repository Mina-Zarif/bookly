import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRate extends StatelessWidget {
  const BookRate(
      {Key? key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.avrageRate,
      required this.publishDate})
      : super(key: key);
  final MainAxisAlignment mainAxisAlignment;
  final String publishDate;
  final String avrageRate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          avrageRate, // avrage rate
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 7,
        ),
          Opacity(
          opacity: .5,
          child: Text(
            '($publishDate)' , //ratingsCount
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
