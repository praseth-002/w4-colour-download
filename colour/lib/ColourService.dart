import 'package:flutter/material.dart';

// class ColourService extends ChangeNotifier{
//   int redTapCount = 0;
//   int blueTapCount = 0;
  
//   void redPlus () {
//     redTapCount++;
//     notifyListeners();
//   }

//   void bluePlus () {
//     blueTapCount++;
//     notifyListeners();
//   }
// }

class ColourTapModel {
  final CardType cardType;
  final Color color;
  int count;

  ColourTapModel ({required this.cardType, required this.color, this.count = 0});
}

enum CardType { red, blue, green, yellow}


class ColourService extends ChangeNotifier{
  List<ColourTapModel> colourTapModels = [
    ColourTapModel(cardType: CardType.red, color: Colors.red),
    ColourTapModel(cardType: CardType.blue, color: Colors.blue),
    ColourTapModel(cardType: CardType.green, color: Colors.green),
    ColourTapModel(cardType: CardType.yellow, color: Colors.yellow),
  ];

  void increment (CardType cardType) {
    final card = colourTapModels.firstWhere((colourTapModel) => colourTapModel.cardType == cardType);
    card.count++;
    notifyListeners();
  }
}