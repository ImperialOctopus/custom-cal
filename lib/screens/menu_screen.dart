import 'package:flutter/material.dart';
import 'package:prototype_cal/data/dog_species_data.dart';

import 'book_screen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 5.0, // has the effect of softening the shadow
                spreadRadius: 0.0, // has the effect of extending the shadow
                offset: Offset(
                  -3, // horizontal, move right 10
                  3, // vertical, move down 10
                ),
              )
            ],
          ),
          child: Container(
            color: Theme.of(context).backgroundColor,
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Dog Species',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'Custom CAL App',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  'Created by Zoey Child',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                RaisedButton(
                  child: Text('Start'),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookScreen(book: dogSpeciesData),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
