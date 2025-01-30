import 'dart:io';

class ShoppingModelClass {
  String name;
  int itemCount;
  int singleItemPrice;

  ShoppingModelClass({
    required this.name,
    required this.itemCount,
    required this.singleItemPrice,
  });
}

class ShoppingGame {
  List<ShoppingModelClass> stockInShop = [];
  Map<String, int> shoppingCart = {};
  int myWalletMoney = 100000;
  int cartPrice = 0;
  bool gameOver = false;

  ShoppingGame() {
    stockInShop.addAll([
      ShoppingModelClass(name: "Bananas", itemCount: 10, singleItemPrice: 5),
      ShoppingModelClass(name: "Apples", itemCount: 20, singleItemPrice: 30),
      ShoppingModelClass(name: "Pasta", itemCount: 500, singleItemPrice: 100),
      ShoppingModelClass(name: "Rice", itemCount: 500, singleItemPrice: 50),
    ]);
  }

  int calculateStoreMoney() {
    return stockInShop.fold(
        0, (sum, item) => sum + (item.itemCount * item.singleItemPrice));
  }

  void printStock() {
    print("\nCurrent Stock:");
    stockInShop.forEach((item) => print(
        "Item: ${item.name}, Quantity: ${item.itemCount}, Price per unit: ${item.singleItemPrice} Rupees"));
  }

  void printGameStatus() {
    print("\nWallet Balance: ${myWalletMoney} Ruoees");
    print("Shopping Cart: $shoppingCart");
    print("Cart Total: ${cartPrice} Rupees");
    print("Store Inventory Value Available: ${calculateStoreMoney()} Rupees");
  }

  bool processTransaction(ShoppingModelClass item, int requestedQuantity) {
    int totalPrice = requestedQuantity * item.singleItemPrice;

    if (totalPrice > myWalletMoney) {
      print(
          "Insufficient funds. You need $totalPrice Rupees but have $myWalletMoney Rupees");
      return false;
    }

    if (requestedQuantity > item.itemCount) {
      print(
          "Insufficient stock. Only ${item.itemCount} ${item.name} available");
      return false;
    }

    item.itemCount -= requestedQuantity;
    shoppingCart[item.name] =
        (shoppingCart[item.name] ?? 0) + requestedQuantity;
    myWalletMoney -= totalPrice;
    cartPrice += totalPrice;

    print("Successfully added $requestedQuantity ${item.name} to cart");
    return true;
  }

  void playGame() {
    printStock();

    for (var item in stockInShop) {
      print("\nHow many ${item.name} would you like to buy?");

      try {
        String? input = stdin.readLineSync();
        if (input == null || input.isEmpty) continue;

        int quantity = int.parse(input);
        if (quantity < 0) {
          print("Please enter a valid positive number");
          continue;
        }

        if (quantity == 0) continue;

        processTransaction(item, quantity);
      } catch (e) {
        print("Please enter a valid number");
        continue;
      }
    }

    printGameStatus();
    gameOver = true;
  }

  void start() {
    do {
      playGame();
    } while (!gameOver);
  }
}

void main() {
  var game = ShoppingGame();
  game.start();
}
