import 'package:bookly/Feature/Home/persentaion/home_view/Widgets/home_model_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeModelBody(),
    );
  }
}
