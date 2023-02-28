import 'package:bookly/Feature/Home/data/models/BookModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({Key? key, required this.model}) : super(key: key);
  final BookModel model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: CachedNetworkImage(
          imageUrl: model.volumeInfo!.imageLinks!.thumbnail!,
          fit: BoxFit.fill,
          placeholder: (context, url) => const Center(child:CircularProgressIndicator()),
          errorWidget: (context, url, error) => Container(color: Colors.white,child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.error,size: 50,color: Colors.black,),
              SizedBox(height: 8,),
              Text("Error in Server",style: TextStyle(color: Colors.black),),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
