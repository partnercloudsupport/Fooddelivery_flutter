import 'package:flutter/material.dart';
import 'package:fooddelivery/Model/Product.dart';


class OrderFood extends StatefulWidget {
  final String value;
  OrderFood({Key key, this.value}) : super(key: key);
  @override
  State createState() => new OrderFoodPageState();
}

class OrderFoodPageState extends State<OrderFood> {

final List<Product> _allFood = Product.allFoods();


@override
Widget build(BuildContext context) {
  return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "${widget.value}",
          style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
     ),
      body: new Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: getHomePageBody(context)));
}

getHomePageBody(BuildContext context) {
  return ListView.builder(
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
            "assets/images/" + _allFood[index].imageName,
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
                new Text('Qty: ${_allFood[index].id}',
                    style: new TextStyle(
                        fontSize: 11.0, fontWeight: FontWeight.normal)),
              ]),

          onTap: () {
            _showSnackBar(context, _allFood[index]);
          },
          trailing:new Column(
            children: <Widget>[
            
            new RaisedButton(
                    onPressed: () {
            _showSnackBar(context, _allFood[index]);
          },
                    textColor: Colors.white,
                    color: Colors.red,
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      'Add'
                      //'${_allFood[index].rating}',
                    ),
             ),],
        ),)
      ],
    ));
  }

  _showSnackBar(BuildContext context, Product item) {
    final SnackBar objSnackbar = new SnackBar(
      content: new Text("${item.name} is Near to you about ${item.distance} Km"),
      backgroundColor: Colors.blue,
    );
    Scaffold.of(context).showSnackBar(objSnackbar);
  }
}


