import 'dart:async';

import 'package:fltr_demo/models/income-types.dart';
import 'package:fltr_demo/ui/home-page/widgets/buy-button-impl.dart';
import 'package:fltr_demo/ui/home-page/widgets/buy-button-placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int availableBalance = 0;
  // int _totalBalance = 0;
  int bonusMoneyInSecond = 0;

  final List<IncomeTypes> incomeTypes = [
    IncomeTypes("Гой наемник", 50, 0, 1, 0),
    IncomeTypes("Дешевый Еврей помощник", 300, 1, 2, 0),
    IncomeTypes("Пылесос для денег", 600, 2, 3, 0),
    IncomeTypes("Попрошайки", 2000, 3, 5, 0),
    IncomeTypes("Налогосборщики", 4000, 4, 7, 0),
    IncomeTypes("Кредитная компания", 7500, 5, 10, 0),
    IncomeTypes("Синагога", 10000, 7, 12, 0),
    IncomeTypes("Еврейская больница", 20000, 9, 15, 0),
    IncomeTypes("Открыть макдональдс", 50000, 11, 18, 0),
    IncomeTypes("Масонская ложа", 200000, 15, 25, 0),
    IncomeTypes("Режим Одессы", 500000, 50, 50, 0),
    IncomeTypes("Открыть Стим", 750000, 100, 100, 0),
  ];

  Timer? timer;

  startTimer() {
    timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        availableBalance += bonusMoneyInSecond;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center (
        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0),
          // margin: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
              ),
              Text("Украдено шекелей: $availableBalance"),
              Text("Шекелей на секунду: $bonusMoneyInSecond"),
              Container(
                constraints: BoxConstraints.tightFor(height: 50),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16.0)),
                    ),
                    onPressed: () {
                      setState(() {
                        availableBalance += 1;
                      });
                    },
                    child: new Center(
                      // padding: EdgeInsets.symmetric(vertical: 16.0),
                      // color: Colors.black,
                        child: new Container(

                          child: new Text("Украсть шекель", style: TextStyle(color: Colors.white)),
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5.0)),),

                        )
                    )
                ),
              ),

              new Expanded(
                child: new ListView.builder(
                  //physics: NeverScrollableScrollPhysics(),
                  itemCount: incomeTypes.length,
                  itemBuilder: (context, numberOfRow) {
                    return BuyButton(incomeType: incomeTypes[numberOfRow], rootWidget: this);
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}

class BuyButton extends StatefulWidget {
  BuyButton({Key? key, required this.incomeType, required this.rootWidget}) : super(key: key);

  IncomeTypes incomeType;
  HomePageState rootWidget;

  @override
  State<StatefulWidget> createState() {
    return new BuyButtonState();
  }
}

class BuyButtonState extends State<BuyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(

        decoration: BoxDecoration(
            color: widget.incomeType.payedCount > 0 ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child:

        // проверяем доступность ячейки покупки
        ((widget.incomeType.payedCount > 0) ||(widget.rootWidget.availableBalance >= widget.incomeType.price)) ?
        BuyButtonImpl(incomeType: widget.incomeType, rootWidget: widget.rootWidget)
            :
        BuyButtonPlaceholder(price: widget.incomeType.price)
    );
  }
}
