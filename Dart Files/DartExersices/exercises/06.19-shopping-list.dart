// // # Exercise: Shopping List

// // Given the following program:

// // ```dart
// // void main() {
// //   const bananas = 5;
// //   const apples = 6;
// //   const grains = {
// //     'pasta': '500g',
// //     'rice': '1kg',
// //   };
// //   const addGrains = true;
// //   var shoppingList = {};
// //   if (bananas > 0) {
// //     shoppingList['bananas'] = bananas;
// //   }
// //   if (apples > 0) {
// //     shoppingList['apples'] = apples;
// //   }
// //   if (addGrains) {
// //     shoppingList.addAll(grains);
// //   }
// //   print(shoppingList);
// //   // prints {bananas: 5, apples: 6, pasta: 500g, rice: 1kg}
// // }
// // ```

// // Rewrite this code so that the `shoppingList` variable is initialized using **collection-if**, **collection-for** or **spreads**, and the program output is the same.

// import 'dart:io';

// void main() {
//   var walmartStock = {
//     'bananas': 10,
//     'apples': 6,
//     'grains': {
//       'pasta': '500g',
//       'rice': '102kg',
//     }
//   };

//   var ShoppingList = {};

//   int convertToGrams(String quantity) {
//     if (quantity[quantity.length - 2] == 'k') {
//       return int.parse(quantity.replaceAll('kg', ''));
//     } else if (quantity.endsWith('g')) {
//       return int.parse(quantity.replaceAll('g', ''));
//     }
//     return 0;
//   }

//   String convertToString(int grams) {
//     if (grams >= 1000) {
//       return '${grams ~/ 1000}kg';
//     } else {
//       return '${grams}g';
//     }
//   }

//   print("Current Stock : ${walmartStock}");
//   walmartStock.forEach((key, value) {
//     switch (key) {
//       case 'bananas':
//         if (value is int) {
//           print("How Much Bananas do you want to buy? ");
//           String? input = stdin.readLineSync();
//           int banana = int.parse(input ?? '0');

//           if (banana < 0) {
//             throw "Invalid Number of ask";
//           } else if (banana > value) {
//             throw "Sorry We Don't Have that much bananas \n we have ${value} bananas";
//           } else {
//             ShoppingList['bananas'] = banana;
//             walmartStock[key] = value - banana;
//           }
//         }
//         break;

//       case 'apples':
//         if (value is int) {
//           print("How Much Apples do you want to buy? ");
//           String? input = stdin.readLineSync();
//           int apple = int.parse(input ?? '0');
//           try {
//             if (apple < 0) {
//               throw "Invalid Number of ask";
//             } else if (apple > value) {
//               throw "Sorry We Don't Have that much apples \n we have ${value} apples";
//             } else {
//               ShoppingList['apples'] = apple;
//               walmartStock[key] = value - apple;
//             }
//           } catch (e) {
//             print(e);
//           }
//         }
//         break;

//       case 'grains':
//         var grainsStock = value as Map<String, String>;

//         grainsStock.forEach((grain, quantity) {
//           int stockQuantityInGrams = convertToGrams(quantity);

//           print("How much $grain do you want to buy? (Available: $quantity)");

//           String? input = stdin.readLineSync();
//           int requestedQuantityInGrams = int.parse(input ?? '0');

//           if (requestedQuantityInGrams < 0) {
//             print("Invalid Quantity.");
//           } else if (requestedQuantityInGrams > stockQuantityInGrams) {
//             print(
//                 "Sorry, we don't have that much $grain. Available: $quantity");
//           } else {
//             int updatedStockInGrams =
//                 stockQuantityInGrams - requestedQuantityInGrams;
//             grainsStock[grain] = convertToString(updatedStockInGrams);
//             String value = requestedQuantityInGrams.toString() + 'g';
//             ShoppingList[grain] = value;
//           }
//         });
//         break;

//       default:
//         print("Bye!!!");
//     }
//   });

//   print("Your Shopping List is : ${ShoppingList}");
//   print("Walmart's Remaining Stock is : ${walmartStock}");
// }

import 'dart:io';

void shoppingListGame() {
  var StockInShop = {
    'bananas': 10,
    'apples': 6,
    'grains': {
      'pasta': '500g',
      'rice': '102kg',
    }
  };

  var pricesOfSingleGood = <String, int>{
    'bananas': 5,
    'apples': 30,
    'pasta': 1,
    'rice': 50,
  };

  var ShoppingCart = {};

  int convertToInt(String quantity) {
    if (quantity.endsWith('kg')) {
      return int.parse(quantity.replaceAll('kg', '')) * 1000;
    } else if (quantity.endsWith('g')) {
      return int.parse(quantity.replaceAll('g', ''));
    }
    return 0;
  }

  int calculatePrice(int quantity, int price) {
    int totalPrice = quantity * price;
    return totalPrice;
  }

  int calculateStoreMoney() {
    int money = 0;
    StockInShop.forEach((key, value) {
      if (value is int) {
        if (pricesOfSingleGood.containsKey(key)) {
          money += pricesOfSingleGood[key]! * value;
        }
      } else if (value is Map<String, String>) {
        value.forEach((grainKey, quantity) {
          if (pricesOfSingleGood.containsKey(grainKey)) {
            int curr;
            if (grainKey == "rice") {
              curr = int.parse(quantity.replaceAll('kg', '')) *
                  pricesOfSingleGood[grainKey]!;
            } else {
              curr = convertToInt(quantity) * pricesOfSingleGood[grainKey]!;
            }
            money += curr;
          }
        });
      }
    });
    return money;
  }

  bool gameOver = false;
  int myWalletMoney = 100000;
  int cartPrice = 0;
  int StoreMoneyRemainingToSell = calculateStoreMoney();
  print(StoreMoneyRemainingToSell);

  void playGame() {
    StockInShop.forEach((key, availableQuantity) {
      print("Current Stock we have in shop is : ${StockInShop}");
      if (key == "bananas") {
        print(
            "How Much Bananas Do you want to buy? We have $availableQuantity available");

        int quantity = int.parse(stdin.readLineSync()!);
        int price = pricesOfSingleGood[key]!;
        int totalPrice = calculatePrice(quantity, price);

        if (totalPrice > myWalletMoney) {
          print("You Dont Have Enough Money Darling");
          return;
        }

        if (availableQuantity is int) {
          if (quantity > availableQuantity) {
            print("We Dont have that much $key, Sorry");
            return;
          } else if (quantity <= availableQuantity) {
            StockInShop[key] = availableQuantity - quantity;
            ShoppingCart[key] = quantity;
            print("Added $quantity $key in shopping Cart Successfully");
            myWalletMoney -= totalPrice;
            cartPrice += totalPrice;
          }
        } else {
          print("Enter Valid Integer Value");
          return;
        }
      }

      if (key == "apples") {
        print(
            "How Much $key Do you want to buy? we have $availableQuantity available");

        int quantity = int.parse(stdin.readLineSync()!);
        int price = pricesOfSingleGood[key]!;
        int totalPrice = calculatePrice(quantity, price);

        if (totalPrice > myWalletMoney) {
          print("You Dont Have Enough Money Darling");
          return;
        }

        if (availableQuantity is int) {
          if (quantity > availableQuantity) {
            print("We Dont have that much $key, Sorry");
            return;
          } else if (quantity <= availableQuantity) {
            StockInShop[key] = availableQuantity - quantity;
            ShoppingCart[key] = quantity;
            print("Added $quantity $key in shopping Cart Successfully");
            myWalletMoney -= totalPrice;
            cartPrice += totalPrice;
          }
        } else {
          print("Enter Valid Integer Value");
          return;
        }
      }
    });

    StoreMoneyRemainingToSell = calculateStoreMoney();

    print("");
    print("Current Stock we have in shop is : ${StockInShop}");
    print("Remaining Money in your Wallet is : $myWalletMoney");
    print("Shopping cart is ${ShoppingCart} and CartTotal is $cartPrice");
    print("Store Money to sell remaining $StoreMoneyRemainingToSell");

    gameOver = true;
  }

  do {
    playGame();
  } while (!gameOver);
}

void main() {
  shoppingListGame();
}
