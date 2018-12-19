import 'package:flutter/material.dart';


class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => new _CustomAppBarState();

}


class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        right: 5.0,
      ),
      child: new Row(
        children: [
         /* new Expanded(
            flex: 3,
            child: new Row(
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.arrow_back),
                  tooltip: 'Back Arrow',
                  onPressed: () {
                    _onBackButtonPressed(context);
                  },
                ),
                new Expanded(
                  child: new Text('MENU',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 21.0,
                          fontFamily: 'Dosis',
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),*/
          new IconButton(
            tooltip: 'Shopping Cart',
            icon: new Icon(const IconData(0xe807, fontFamily: 'fontello'),
                color: Colors.black87),
            onPressed: () { 
                print("onPressed");
              },
          ),
        ],
      ),
    );
  }
}


