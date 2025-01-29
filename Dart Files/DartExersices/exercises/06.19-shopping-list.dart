// # Exercise: Shopping List

// Given the following program:

// ```dart
// void main() {
//   const bananas = 5;
//   const apples = 6;
//   const grains = {
//     'pasta': '500g',
//     'rice': '1kg',
//   };
//   const addGrains = true;
//   var shoppingList = {};
//   if (bananas > 0) {
//     shoppingList['bananas'] = bananas;
//   }
//   if (apples > 0) {
//     shoppingList['apples'] = apples;
//   }
//   if (addGrains) {
//     shoppingList.addAll(grains);
//   }
//   print(shoppingList);
//   // prints {bananas: 5, apples: 6, pasta: 500g, rice: 1kg}
// }
// ```

// Rewrite this code so that the `shoppingList` variable is initialized using **collection-if**, **collection-for** or **spreads**, and the program output is the same.

import 'dart:io';

void main() {
  var walmartStock = {
    'bananas': 10,
    'apples': 6,
    'grains': {
      'pasta': '500g',
      'rice': '102kg',
    }
  };

  var ShoppingList = {};

  int convertToGrams(String quantity) {
    if (quantity[quantity.length - 2] == 'k') {
      return int.parse(quantity.replaceAll('kg', ''));
    } else if (quantity.endsWith('g')) {
      return int.parse(quantity.replaceAll('g', ''));
    }
    return 0;
  }

  String convertToString(int grams) {
    if (grams >= 1000) {
      return '${grams ~/ 1000}kg';
    } else {
      return '${grams}g';
    }
  }

  print("Current Stock : ${walmartStock}");
  walmartStock.forEach((key, value) {
    switch (key) {
      case 'bananas':
        if (value is int) {
          print("How Much Bananas do you want to buy? ");
          String? input = stdin.readLineSync();
          int banana = int.parse(input ?? '0');

          if (banana < 0) {
            throw "Invalid Number of ask";
          } else if (banana > value) {
            throw "Sorry We Don't Have that much bananas \n we have ${value} bananas";
          } else {
            ShoppingList['bananas'] = banana;
            walmartStock[key] = value - banana;
          }
        }
        break;

      case 'apples':
        if (value is int) {
          print("How Much Apples do you want to buy? ");
          String? input = stdin.readLineSync();
          int apple = int.parse(input ?? '0');
          try {
            if (apple < 0) {
              throw "Invalid Number of ask";
            } else if (apple > value) {
              throw "Sorry We Don't Have that much apples \n we have ${value} apples";
            } else {
              ShoppingList['apples'] = apple;
              walmartStock[key] = value - apple;
            }
          } catch (e) {
            print(e);
          }
        }
        break;

      case 'grains':
        var grainsStock = value as Map<String, String>;

        grainsStock.forEach((grain, quantity) {
          int stockQuantityInGrams = convertToGrams(quantity);

          print("How much $grain do you want to buy? (Available: $quantity)");

          String? input = stdin.readLineSync();
          int requestedQuantityInGrams = int.parse(input ?? '0');

          if (requestedQuantityInGrams < 0) {
            print("Invalid Quantity.");
          } else if (requestedQuantityInGrams > stockQuantityInGrams) {
            print(
                "Sorry, we don't have that much $grain. Available: $quantity");
          } else {
            int updatedStockInGrams =
                stockQuantityInGrams - requestedQuantityInGrams;
            grainsStock[grain] = convertToString(updatedStockInGrams);
            String value = requestedQuantityInGrams.toString() + 'g';
            ShoppingList[grain] = value;
          }
        });
        break;

      default:
        print("Bye!!!");
    }
  });

  print("Your Shopping List is : ${ShoppingList}");
  print("Walmart's Remaining Stock is : ${walmartStock}");
}
