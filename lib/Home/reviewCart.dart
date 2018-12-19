import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fooddelivery/Home/HomePage.dart';
import 'package:fooddelivery/Model/Product.dart';
import 'dart:async';

enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}

class ReviewCartPage extends StatefulWidget {
// Declare a field that holds the Food Items

  final List<Product> _foodItem;
  ReviewCartPage(this._foodItem);
  @override
  _ListTileItemState createState() => new _ListTileItemState();
}

class _ListTileItemState extends State<ReviewCartPage> {
  int _itemCount = 0;


  void showLongToast() {
    Fluttertoast.showToast(
      msg: "Your order confirmed",
      toastLength: Toast.LENGTH_LONG,
    
    );
  }



  
Future<Null> showCenterShortToast() async {
  return showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text('Success'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('You Order placed Successfully continue with Cash On Delivery.'),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text('Confirm'),
            onPressed: () {
              // Navigator.of(context).pop();
                Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new HomePage(),
                      ),
                    );
              showLongToast();
       
            },
          ),
        ],
      );
    },
  );
}

  @override
Widget build(BuildContext context) {
    super.widget;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Final Cart"),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: <Widget>[
          new Container(
            height: 500.0,
            child: new ListView.builder(
              itemCount: widget._foodItem.length,
              itemBuilder: (context, index) {
              return new ListTile(
                
               leading:new Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                  color: Colors.lightGreen,
                   boxShadow: [
                    new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(2.0, 2.0),
                      blurRadius: 2.0)
                       ],
                     borderRadius: new BorderRadius.all(
                      new Radius.circular(12.0)),
                      image: new DecorationImage(
                      image: new ExactAssetImage(
                      'assets/images/${widget._foodItem[index].imageName}',
                       ),
                     fit: BoxFit.fill,
                   )),
                  ),               
                title: new Text(widget._foodItem[index].name,
                style: new TextStyle(
                fontWeight: FontWeight.w500, fontSize: 18.0),),
                 // new Text(widget._foodItem[index].name),
                subtitle: new Text(widget._foodItem[index].rating.toString()),
                trailing: new Text(widget._foodItem[index].selectedItems.toString()),
                // trailing: new Row(
                //     children: <Widget>[
                //       widget._foodItem[index].id != 0
                //           ? new IconButton(
                //               icon: new Icon(Icons.remove),
                //               onPressed: () => setState(() => _itemCount--),
                //             )
                //           : new Container(),
                //       new Text(widget._foodItem[index].id.toString()),
                //       new IconButton(
                //           icon: new Icon(Icons.add),
                //           onPressed: () => setState(() => _itemCount++)),
                //       new Padding(padding: new EdgeInsets.all(5.00)),
                //     ],
                //   ),
                );
              },
            ),
          ),
          new Padding(padding: new EdgeInsets.all(20.00)),
          new RaisedButton(
            onPressed: showCenterShortToast,
            color: Colors.teal,
            textColor: Colors.white,
            child: new Text("Pay To Confirm"),

          ),

          new Padding(padding: new EdgeInsets.all(1.00)),
        ])
        );
  }
}
