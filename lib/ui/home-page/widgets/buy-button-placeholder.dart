import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BuyButtonPlaceholder extends StatefulWidget {
  BuyButtonPlaceholder({Key? key, required this.price}) : super(key: key);

  int price;

  @override
  State<StatefulWidget> createState() {
    return new BuyButtonPlaceholderState();
  }
}

class BuyButtonPlaceholderState extends State<BuyButtonPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return Text("${widget.price}\n???", textAlign: TextAlign.center);
  }
}