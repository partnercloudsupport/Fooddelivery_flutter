import 'package:flutter/material.dart';
import 'package:fooddelivery/Model/Product.dart';


class FoodImage extends StatelessWidget {
  FoodImage({this.food});
  final Product food;

  @override
  Widget build(BuildContext context) {
    return new Align(
      alignment: FractionalOffset.topCenter,
      child:  new GestureDetector(
        behavior: HitTestBehavior.opaque,
//        onTap: () =>
//            Routes.navigateTo(
//              context,
//              '/detail/${food.id}',
//            ),
        child: new Hero(
          tag: 'icon-${food.id}',
          child: new Image(
            image: new AssetImage(food.imageName),
            height: 150.0,
            width: 150.0,
          ),
        ),
      ),
    );
  }
}