import 'package:flutter/material.dart';
import 'package:fooddelivery/Home/Food.dart';
import 'package:fooddelivery/Login/auth.dart';


class HomePage extends StatefulWidget {
  final String value;
  final AuthImpl auth;
  final VoidCallback onSignedOut;
  HomePage({Key key, this.value, this.auth, this.onSignedOut}) : super(key: key);

  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

List<String> name = ['Food','Grocery','Milk','Cab','House Work','Customer Care','Others'];
List<String> imageList = ['assets/GridIcon/Food_Icon.png','assets/GridIcon/Grocery_Icon.png','assets/GridIcon/Milk_Icon.png'
,'assets/GridIcon/Taxi_Icon.jpg','assets/GridIcon/Home_work.jpg','assets/GridIcon/Customer Care.png'];

 void _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    //   Navigator.of(context).push(
    //     new MaterialPageRoute(
    //     builder: (BuildContext context) => new LoginPage(),
    //    ));
    } catch (e) {
      print(e);
     }
  }

  @override
initState() {
  super.initState();
}

_showSnackBar(BuildContext context,String selectedName) {
  Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new Food(value:selectedName,)),
      );
}
  
List<Card> _buildGridCards(List<String> name,List<String> listOfImage) {
  List<Card> cards = List.generate(
    
    name.length-1,
    (int index) => Card(
      child: Column(
      
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        AspectRatio(
            aspectRatio: 14.0 / 11.0,
            child: Image.asset(listOfImage[index]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(60.0, 12.0, 16.0, 8.0),
            child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              new Padding(
                 padding: const EdgeInsets.only(top:4.0)),
                Text(name[index]),
                SizedBox(height: 8.0),
       
              ],
            ),
          ),
          // new GestureDetector(
          //    onTap: _showSnackBar(context, name[index])
          // ),
        ],
      ),
      
    ),
  );

  return cards;
}

  @override
  Widget build(BuildContext context) {

    // double screenHeight = MediaQuery.of(context).size.height;
   
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          appBar: AppBar(
          // our appbar title.
          title: new Center(child: new Text("Home")),       
          ),
          drawer: new Drawer(
              child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("Anand"),
                accountEmail: new Text(widget.value != null?widget.value:"anand@gmail.com"),
                currentAccountPicture: new CircleAvatar(
                    backgroundColor: Colors.grey, child: new Text("A", style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),)),
              ),
              new ListTile(
                  title: new Text("Orders"),
                  trailing: new Icon(Icons.list),
                  onTap: () =>
                  print("Map Icon tap")
                  ),
              new Divider(),
              new ListTile(
                title: new Text("Settngs"),
                trailing: new Icon(Icons.settings),
              ),
              new Divider(),
              new ListTile(
                title: new Text("Logout"),
                trailing: new Icon(Icons.close),
                onTap: _signOut,
              ),
            ],
          )),
          body: new GestureDetector(
               onTap: () {
           
             _showSnackBar(context,"Food");
         },
                   
         child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16.0),
                childAspectRatio: 8.0 / 9.0,
                children: _buildGridCards(name,imageList),
               
             ),),
         ));
  }
}


/*new Container(
         child: new Center(
           
            child: new GridView.count(

              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              childAspectRatio:1.0,
              crossAxisCount: MediaQuery.of(context).size.width <= 600.0 ? 3 : MediaQuery.of(context).size.width >= 1000.0 ? 5 : 4,

           // Create a grid with 2 columns. If you change the scrollDirection to
           // horizontal, this would produce 2 rows.

           crossAxisSpacing: 2.0,
           // Generate 100 Widgets that display their index in the List
           children: new List.generate(10, (index) {

             return  new Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 mainAxisSize: MainAxisSize.min,

                 verticalDirection: VerticalDirection.down,
                 children: <Widget>[
                   new Center(
                     child:  new Image(
                         image: new NetworkImage('https://www.cobblestonene.com/wp-content/uploads/2018/02/original-15.jpeg')
                     )
                   ),
                    new Padding(padding: new EdgeInsets.all(1.0)),
                   new Expanded(child: new Text("apple $index")),]
             );
           }),
         ),
        ),
        ), */