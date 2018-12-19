import 'package:flutter/material.dart';
import 'package:fooddelivery/Model/Product.dart';
//import 'package:fooddelivery/Home/FoodOrder/OrderFood.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:fooddelivery/Home/ResturantList.dart';

class Food extends StatefulWidget {
  final String value;
  Food({Key key, this.value}) : super(key: key);
  @override
  State createState() => new FoodPageState();
}

class FoodPageState extends State<Food> {

final List<Product> _allFood = Product.allCities();

@override
Widget build(BuildContext context) {
  
/*Widget image_carousel = new Container(
    height: 200.0,
    child:  new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('assets/images/menu1.png'),
        AssetImage('assets/images/menu2.png'),
        AssetImage('assets/images/menu3.png'),
        AssetImage('assets/images/menu4.png'),
        AssetImage('assets/images/menu5.png'),
      ],
      autoplay: true,
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 2.0,
    ),
  );*/


  return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "${widget.value} Near By",
          style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        actions: <Widget>[
      
           new IconButton(
            icon: new Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
          ],
      ),
      body: new Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: getHomePageBody(context))
       );
   
}

getHomePageBody(BuildContext context) {
  return ListView.builder(
    
 
    //image carousel begins here
  //  image_carousel,

    itemCount: _allFood.length,
    itemBuilder: _getItemUI,
    padding: EdgeInsets.all(0.0),
    
    );
}
  // First Attempt
   Widget _getItemUI(BuildContext context, int index) {
    return new Card(
     child: new Column(

      children: <Widget>[
      
        new ListTile(
     

          leading: new Image.asset(
            "assets/Restaurants/" + _allFood[index].imageName,
            fit: BoxFit.cover,
            width: 60.0,
          ),
 
          title: new Text(
            _allFood[index].name,
            style: new TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          subtitle: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_allFood[index].description,
                    style: new TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.normal)),
                new Text('Distance: ${_allFood[index].distance} Km',
                    style: new TextStyle(
                        fontSize: 11.0, fontWeight: FontWeight.normal)),
              ]),

          onTap: () {
            _showSnackBar(context, _allFood[index]);
          },
          trailing:new Column(
            children: <Widget>[
             new Text(
                '${_allFood[index].rating}',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                ),
              ),
            new RaisedButton(
                    onPressed: () {
            _showSnackBar(context, _allFood[index]);
          },
                    textColor: Colors.white,
                    color: Colors.green,
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      'Order'
                      //'${_allFood[index].rating}',
                    ),
             ),],
        ),)
      ],
    ));
  }
 

  _showSnackBar(BuildContext context, Product item) {

  //  animation popup bottom
  //   final SnackBar objSnackbar = new SnackBar(
  //    content: new Text("${item.name} is Near to you about ${item.distance} Km"),
  //    backgroundColor: Colors.blue,
  //   );
  //  Scaffold.of(context).showSnackBar(objSnackbar);

   Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new ResturantList(title: item.name,)),
   );

  }
}


