import 'package:flutter/material.dart';
import 'package:hire_remote_team/screens/search_screen.dart';

class SearchNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: SearchAppBarDelegate());
      },
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: "Search Team",
          focusColor: Colors.black,
          contentPadding: const EdgeInsets.all(10.0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: Container(
            decoration: BoxDecoration(
              color: Color(0xffE5E5E5),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: IconButton(
              icon: Icon(
                Icons.tune,
                color: Colors.grey,
              ),
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none),
          fillColor: Color(0xffE5E5E5),
          filled: true,
        ),
        child: Text('Search Photographer'),
      ),
    );
  }
}
