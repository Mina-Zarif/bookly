import 'package:bookly/Feature/Home/data/models/BookModel.dart';
import 'package:bookly/Feature/Home/persentaion/details_view/Widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: DetailsViewBody(
        bookModel: bookModel,
      )),
    );
  }
}
