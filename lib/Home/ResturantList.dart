import 'package:flutter/material.dart';
import 'background.dart';
import 'package:fooddelivery/Model/Product.dart';
import 'package:fooddelivery/Home/cart_button.dart';
import 'package:fooddelivery/Home/reviewCart.dart';


class ResturantList extends StatefulWidget {
  ResturantList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResturantListState createState() => new _ResturantListState();
}

class _ResturantListState extends State<ResturantList> {
 
final List<Product> _allFood = Product.allFoods();
int _counter = 0;
int _cartQuantity = 0;
Animation<double> scaleAnimation;
AnimationController controller, scaleController;
bool firstEntry = true;
  List<Product> selectedFoodObj =  new List();

void subtractNumbers() {
    setState(() {
      _cartQuantity = _cartQuantity + 1;
    });
}

  Future<Null> playAnimation() async {
    try {
      if(controller.isCompleted){
        controller.reset();
        await controller.forward().whenComplete((){
          scaleController.forward().whenComplete((){
            scaleController.reverse();
            setState(() {
              _cartQuantity = _cartQuantity + _counter;
              _counter = 0;
            });
          });
        });
      } else {
        await controller.forward().whenComplete((){
          setState(() {
            if(firstEntry){
              firstEntry = false;
            }
            _cartQuantity = _cartQuantity + _counter;
            _counter = 0;
          });
          scaleController.forward().whenComplete((){
            scaleController.reverse();
          });
        });
      }
    } on TickerCanceled {

    }
  }


  onChangeFoodItem(int index, int value, Product food){
    setState(() {
      
      print('value:$value');
      //Menu.menu[index] = food.copyWith(quantity: value);

    });
  }


  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final headerList = new ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0?const EdgeInsets.only(
            left: 20.0, right: 10.0, top: 4.0, bottom: 30.0):const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 4.0, bottom: 30.0);
        
        return new Padding(
          padding: padding,
          child: new InkWell(
            onTap: () {
              print('Card selected');
            },
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.lightGreen,
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],

                image: new DecorationImage(
                  image: new ExactAssetImage(
                 'assets/images/${_allFood[index%_allFood.length].imageName}'),
                  fit: BoxFit.fill,
                ),
              ),
//                                 height: 200.0,
              width: 200.0,
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new Container(
                        decoration: new BoxDecoration(
                            color: const Color(0xFF273A48),
                            borderRadius: new BorderRadius.only(
                                bottomLeft: new Radius.circular(10.0),
                                bottomRight: new Radius.circular(10.0))),
                        height: 30.0,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              '${_allFood[index%_allFood.length].name}',
                              style: new TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: _allFood.length,
    );

    final body = new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          /*new IconButton(icon: new Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){
            print("Top Cart click ");
          }),*/
         
         new CartButton(
          itemCount: _cartQuantity ,
           onPressed: () {
             //Navigator.of(context).pushNamed(BlocCartPage.routeName);
         Navigator.push(
             context,
              new MaterialPageRoute(builder: (context) => new ReviewCartPage(selectedFoodObj)),
            );
            },
          ),


       firstEntry ? Container():
        new Align(
          alignment: Alignment.topRight,
          child: new ScaleTransition(
            scale: scaleAnimation,
              child: new Container(
              height: 20.0,
              width: 20.0,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 2.0, right: 2.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.orangeAccent
              ),
             child: new Text('$_cartQuantity', textDirection: TextDirection.ltr, style: const TextStyle(color: Colors.white, fontSize: 12.0)),
            ),
          ),
        )
             
      ],
      ),
      backgroundColor: Colors.transparent,
      body: new Container(
        child: new Stack(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(top: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Align(
                    alignment: Alignment.centerLeft,
                    child: new Padding(
                        padding: new EdgeInsets.only(left: 12.0),
                        child: new Text(
                          'Best Items',
                          style: new TextStyle(fontSize: 18.0,color: Colors.white70),
                        )),
                  ),
                  new Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),),
                  new Container(
                      height: 300.0, width: _width, child: headerList),
                  new Expanded(child:
                  ListView.builder(itemBuilder: (context, index) {
                    return new ListTile(
                      title: new Column(
                        children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                height: 72.0,
                                width: 72.0,
                                decoration: new BoxDecoration(
                                    color: Colors.lightGreen,
                                    boxShadow: [
                                      new BoxShadow(
                                          color:
                                          Colors.black.withAlpha(70),
                                          offset: const Offset(2.0, 2.0),
                                          blurRadius: 2.0)
                                    ],
                                    borderRadius: new BorderRadius.all(
                                        new Radius.circular(12.0)),
                                    image: new DecorationImage(
                                      image: new ExactAssetImage(
                                        'assets/images/${_allFood[index%_allFood.length].imageName}',
                                      ),
                                      fit: BoxFit.fill
                                      ,
                                    )),
                              ),
                              new SizedBox(
                                width: 8.0,
                              ),
                              new Expanded(
                                  child: new Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text(
                                        '${_allFood[index%_allFood.length].name}',
                                        style: new TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new Padding(
                                       padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
                                      new Text(
                                        '${_allFood[index%_allFood.length].description}',
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.normal),
                                      )
                                    ],
                                  )),
                              new IconButton(
                                  icon: Icon(Icons.add_to_queue),
                                  // tooltip: 'Increase volume by 10%',
                                   onPressed: () { 
                                    _showSnackBar(context, _allFood[index]);
                                       setState(() {
                                           
                                    });
                                  },
                              
                                                             
                                ),
  
                            ],
                          ),
                          new Divider(),
                        ],
                      ),
                    );
                  }))
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return new Container(
      decoration: new BoxDecoration(
        color: const Color(0xFF273A48),
      ),
      child: new Stack(
        children: <Widget>[
          new CustomPaint(
            size: new Size(_width, _height),
            painter: new Background(),
          ),
          body,
        ],
      ),
    );
  }
  _showSnackBar(BuildContext context, Product item) {
     ++_cartQuantity;
    selectedFoodObj.add(item);
    print("${item.name}");

     new CartButton(itemCount: _cartQuantity,onPressed:(){
          playAnimation();
      });
  
    final SnackBar objSnackbar = new SnackBar(
    content: new Text("${item.name} Add to Cart"),
      
      backgroundColor:Colors.black.withAlpha(70),
    );
    Scaffold.of(context).showSnackBar(objSnackbar);
  }
}