import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.search, color: Colors.grey,),
          Text('Search something here..', style: TextStyle(color: Colors.grey, fontSize: 16.0, fontWeight: FontWeight.bold),),
          IconButton(icon: Icon(Icons.filter_list), onPressed: () => print("filter now"),)
        ],
        
      ),
    );
  }
}