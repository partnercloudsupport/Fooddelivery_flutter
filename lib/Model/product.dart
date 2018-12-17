// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/foundation.dart';

enum Category { all,food, greocery, milk,house, }

class Product {
  const Product({
    @required this.category,
    @required this.id,
    @required this.distance,
    @required this.name,
    @required this.description,
    @required this.imageName,
    @required this.rating,
  })  : assert(category != null),
        assert(id != null),
        assert(distance != null),
        assert(name != null),
        assert(description != null),
        assert(imageName != null),
        assert(rating != null);

  final Category category;
  final int id;
  final double distance;
  final String name;
  final String description;
  final String imageName;
  final double rating;


 static List<Product> allCities() {
  var lstOfCities = new List<Product>();

  lstOfCities.add(new Product(category:Category.food,id: 1,distance: 0.40 ,name: "Minerva Coffee Shop",description:"Veg & Non Veg",imageName: 'minerva.jpg' ,rating:4.0));
  lstOfCities.add(new Product(category:Category.food,id: 2,distance: 0.50,name: "Blue Fox",description:"Veg",imageName: 'bluefox.jpg' ,rating:3.2));
  lstOfCities.add(new Product(category:Category.food,id: 3,distance: 0.65,name: "Flechazo",description:"Veg & Non Veg",imageName: 'flechazo.jpg',rating:4.5 ));
  lstOfCities.add(new Product(category:Category.food,id: 4,distance: 0.75,name: "Kritunga Restaurant",description:"Veg & Non Veg",imageName: 'kritunga.jpg',rating:4.1 ));
  lstOfCities.add(new Product(category:Category.food,id: 5,distance: 1.0,name: "karachi bakery",description:"Bakery Items,Snacks,Pizza",imageName: 'karachibakery.jpg' ,rating:4.3));
  lstOfCities.add(new Product(category:Category.food,id: 6,distance: 6.0,name: "Ks Bakery",description:"Bakery Items",imageName: 'kabarkery.jpg',rating:3.0 ));
  lstOfCities.add(new Product(category:Category.food,id: 6,distance: 7.0,name: "Mehfil",description:"Veg & Non Veg",imageName: 'mehfil.jpg' ,rating:2.0));
  lstOfCities.add(new Product(category:Category.food,id: 6,distance: 7.2,name: "Hello Curry",description:"Veg & Non Veg",imageName: 'HelloCurry.jpg',rating:5.0 ));

  return lstOfCities;
}

 static List<Product> allFoods() {
  var lstFoods = new List<Product>();
  lstFoods.add(new Product(category:Category.food,id: 1,distance: 0.40 ,name: "Chicken Biryani",description:"Non Veg",imageName: 'menu1.png' ,rating:4.0));
  lstFoods.add(new Product(category:Category.food,id: 2,distance: 0.50,name: "Veg Biryani",description:"Veg",imageName: 'menu2.png' ,rating:3.2));
  lstFoods.add(new Product(category:Category.food,id: 3,distance: 0.40 ,name: "Mutton Biryani",description:"Non Veg",imageName: 'menu4.png' ,rating:4.0));
  lstFoods.add(new Product(category:Category.food,id: 4,distance: 0.50,name: "Panner Biryani",description:"Veg",imageName: 'menu5.png' ,rating:3.2));
  lstFoods.add(new Product(category:Category.food,id: 6,distance: 0.40 ,name: "Veg pulao",description:"Non Veg",imageName: 'menu11.png' ,rating:4.0));
  lstFoods.add(new Product(category:Category.food,id: 2,distance: 0.50,name: "Chicken pulao",description:"Veg",imageName: 'menu12.png' ,rating:3.2));
  lstFoods.add(new Product(category:Category.food,id: 8,distance: 0.40 ,name: "Mutton pulao",description:"Non Veg",imageName: 'menu13.png' ,rating:4.0));
  lstFoods.add(new Product(category:Category.food,id: 1,distance: 0.50,name: "Panner pulao",description:"Veg",imageName: 'menu14.png' ,rating:3.2));
 
    return lstFoods;
}


 
}
