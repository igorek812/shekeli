import 'package:flutter/material.dart';

import 'package:fltr_demo/models/income-types.dart';
import 'package:fltr_demo/ui/home-page/page/home-page.dart';

class BuyButtonImpl extends StatefulWidget {
  BuyButtonImpl({Key? key, required this.incomeType, required this.rootWidget}) : super(key: key);

  final String currency = "шекелей";
  IncomeTypes incomeType;
  HomePageState rootWidget;

  @override
  State<StatefulWidget> createState() {
    return new BuyButtonImplState();
  }
}

class BuyButtonImplState extends State<BuyButtonImpl> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {

          // проверка достаточно ли денег на покупку
          if (widget.rootWidget.availableBalance < widget.incomeType.price) { return; }

          widget.incomeType.payedCount++;
          widget.rootWidget.bonusMoneyInSecond += widget.incomeType.bonusMoneyInSecond;
          widget.rootWidget.availableBalance -= widget.incomeType.price;
          if (widget.rootWidget.timer == null) {
            widget.rootWidget.startTimer();
          }
        });
      },
      child: Column(
        children: [
          new Text(widget.incomeType.action),
          new Text("${widget.incomeType.price} ${widget.currency} (+${widget.incomeType.bonusMoneyInSecond} ШвС)"),
          new Text("Куплено: ${widget.incomeType.payedCount}"),
        ],
      ),
    );
  }
}




