import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

// Link to DB
final List data = [
  {
    'color': Colors.red,
    'text': '1',
  },
  {
    'color': Colors.green,
    'text': '2',
  },
  {
    'color': Colors.blue,
    'text': '2',
  }
];

class Tinder extends StatefulWidget {
  @override
  _TinderState createState() => _TinderState();
}

class _TinderState extends State<Tinder> {
  // Dynamically load cards from database
  List<Card> cards = [
    Card(
      data[0]['color'],
      data[0]['text'],
    ),
    Card(
      data[1]['color'],
      data[1]['text'],
    ),
    Card(
      data[2]['color'],
      data[2]['text'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Stack of cards that can be swiped. Set width, height, etc here.
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      // Important to keep as a stack to have overlay of cards.
      child: Stack(
        children: cards,
      ),
    );
  }
}

class Card extends StatelessWidget {
  // Made to distinguish cards
  // Add your own applicable data here
  final Color color;
  final String text;
  enter_value() {
    print('ddd');
  }

  Card(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Swipable(
      // Set the swipable widget
      verticalSwipe: false,
      horizontalSwipe: true,
      child: Container(
        child: Text(text),
        color: Colors.green,
        alignment: Alignment.center,
      ),

      /// Callback
      /// Hook triggered when the card finished swiping right.
      /// @param finalPosition [Offset]
//final void Function(var Offset finalPosition) onSwipeRight,
      onSwipeRight: (finalPosition) {
        enter_value();
      },
      onSwipeDown: (finalPosition) {
        print("Swipe Down");
      },
      onSwipeLeft: (finalPosition) {
        print("Swipe Left");
      },
      onSwipeUp: (finalPosition) {
        print("Swipe Up");
      },
      // onSwipeRight, left, up, down, cancel, etc...
    );
  }
}
