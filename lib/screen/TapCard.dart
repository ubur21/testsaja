import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class TapCard extends StatefulWidget {
  @override
  _TapCardState createState() => _TapCardState();
}

class _TapCardState extends State<TapCard> with TickerProviderStateMixin {
  GifController controller;

  @override
  void initState() {
    controller = GifController(vsync: this);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller?.repeat(min: 0, max: 10, period: Duration(seconds: 3));
    });

    super.initState();
  }

  @override
  dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          GifImage(
            controller: controller,
            image: AssetImage("images/gif_tap_card.gif"),
            width: 280,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            label: Text('Cancel'),
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ]));
  }
}
