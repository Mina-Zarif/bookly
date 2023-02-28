import 'package:bookly/Feature/Home/data/models/BookModel.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    // double x = (bookModel.accessInfo!.pdf!.isAvailable == true ? 0 : 15.0);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 8, vertical: MediaQuery.of(context).size.width * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomButton(
              text: "Free",
              customWidget: Row(
                children: [
                  const Spacer(),
                  Image.asset(AssetsApp.pdfDriver, height: 11),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "GET IT",
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              onPressed: () async {
                // Uri url = Uri.parse(bookModel.accessInfo!.pdf!.acsTokenLink!);
                Uri url = Uri.parse("$pdfDriver${bookModel.volumeInfo!.title}");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  Fluttertoast.showToast(
                    msg: "Can't open this $url",
                    gravity: ToastGravity.BOTTOM,
                  );
                }
              },
            ),
          ),
          Expanded(
            child: CustomButton(
              text: "Free preview",
              backgroundColor: const Color(
                0xffEF8262,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
                // topLeft: Radius.circular(x),
                // bottomLeft: Radius.circular(x),
              ),
              textColor: Colors.white,
              onPressed: () async {
                Uri url = Uri.parse(bookModel.volumeInfo!.previewLink!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  Fluttertoast.showToast(
                      msg: "Can't open this $url",
                      gravity: ToastGravity.BOTTOM);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
