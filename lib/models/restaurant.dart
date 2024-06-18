import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:food_delivery/models/cart_item.dart";
import "package:intl/intl.dart";

import "food.dart";

class Restaurant extends ChangeNotifier{
 


final List<Food> _menu = [
  // Burgers
  Food(
    name: "classic burger",
    description: "A juicy burger",
    imagePath: "lib/images/burgers/classic.png",
    price: 0.99,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Extra Cheese", price: 1.0),
      Addon(name: "Extra Patty", price: 2.0),
    ],
  ),
  Food(
    name: "veggie burger",
    description: "A fresh and tasty veggie burger",
    imagePath: "lib/images/burgers/veggie.png",
    price: 1.49,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Avocado", price: 1.5),
      Addon(name: "Grilled Mushrooms", price: 1.0),
    ],
  ),
  Food(
    name: "bacon cheeseburger",
    description: "A burger with crispy bacon and cheese",
    imagePath: "lib/images/burgers/bacon_cheese.png",
    price: 1.99,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Extra Bacon", price: 1.5),
      Addon(name: "Onion Rings", price: 1.0),
    ],
  ),
  Food(
    name: "mushroom swiss burger",
    description: "A burger with mushrooms and Swiss cheese",
    imagePath: "lib/images/burgers/mushroom_swiss.png",
    price: 2.49,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Grilled Onions", price: 1.0),
      Addon(name: "Extra Swiss Cheese", price: 1.0),
    ],
  ),
  Food(
    name: "BBQ burger",
    description: "A burger with BBQ sauce and crispy onions",
    imagePath: "lib/images/burgers/bbq.png",
    price: 2.99,
    category: FoodCategory.burgers,
    availableAddons: [
      Addon(name: "Extra BBQ Sauce", price: 0.5),
      Addon(name: "Jalapenos", price: 0.5),
    ],
  ),

  // Salads
  Food(
    name: "chicken caesar salad",
    description: "A classic Caesar salad with grilled chicken",
    imagePath: "lib/images/salads/chicken_caesar.png",
    price: 3.49,
    category: FoodCategory.salad,
    availableAddons: [
      Addon(name: "Extra Chicken", price: 2.0),
      Addon(name: "Parmesan Cheese", price: 1.0),
    ],
  ),
  Food(
    name: "greek salad",
    description: "A fresh salad with feta cheese and olives",
    imagePath: "lib/images/salads/greek.png",
    price: 2.99,
    category: FoodCategory.salad,
    availableAddons: [
      Addon(name: "Extra Feta", price: 1.0),
      Addon(name: "Grilled Chicken", price: 2.0),
    ],
  ),
  Food(
    name: "garden salad",
    description: "A mix of fresh garden vegetables",
    imagePath: "lib/images/salads/garden.png",
    price: 2.49,
    category: FoodCategory.salad,
    availableAddons: [
      Addon(name: "Avocado", price: 1.5),
      Addon(name: "Hard Boiled Egg", price: 1.0),
    ],
  ),
  Food(
    name: "cobb salad",
    description: "A hearty salad with chicken, bacon, and avocado",
    imagePath: "lib/images/salads/cobb.png",
    price: 3.99,
    category: FoodCategory.salad,
    availableAddons: [
      Addon(name: "Extra Bacon", price: 1.5),
      Addon(name: "Blue Cheese", price: 1.0),
    ],
  ),
  Food(
    name: "spinach salad",
    description: "A salad with fresh spinach and strawberries",
    imagePath: "lib/images/salads/spinach.png",
    price: 2.99,
    category: FoodCategory.salad,
    availableAddons: [
      Addon(name: "Goat Cheese", price: 1.0),
      Addon(name: "Candied Pecans", price: 1.0),
    ],
  ),

  // Sides
  Food(
    name: "french fries",
    description: "Crispy golden fries",
    imagePath: "lib/images/sides/fries.png",
    price: 1.99,
    category: FoodCategory.sides,
    availableAddons: [
      Addon(name: "Cheese Sauce", price: 0.5),
      Addon(name: "Bacon Bits", price: 1.0),
    ],
  ),
  Food(
    name: "onion rings",
    description: "Crispy battered onion rings",
    imagePath: "lib/images/sides/onion_rings.png",
    price: 2.49,
    category: FoodCategory.sides,
    availableAddons: [
      Addon(name: "Ranch Dip", price: 0.5),
      Addon(name: "BBQ Sauce", price: 0.5),
    ],
  ),
  Food(
    name: "mozzarella sticks",
    description: "Fried mozzarella cheese sticks",
    imagePath: "lib/images/sides/mozzarella_sticks.png",
    price: 2.99,
    category: FoodCategory.sides,
    availableAddons: [
      Addon(name: "Marinara Sauce", price: 0.5),
      Addon(name: "Ranch Dip", price: 0.5),
    ],
  ),
  Food(
    name: "side salad",
    description: "A small fresh salad",
    imagePath: "lib/images/sides/side_salad.png",
    price: 1.99,
    category: FoodCategory.sides,
    availableAddons: [
      Addon(name: "Balsamic Dressing", price: 0.5),
      Addon(name: "Ranch Dressing", price: 0.5),
    ],
  ),
  Food(
    name: "sweet potato fries",
    description: "Crispy sweet potato fries",
    imagePath: "lib/images/sides/sweet_potato_fries.png",
    price: 2.49,
    category: FoodCategory.sides,
    availableAddons: [
      Addon(name: "Chipotle Mayo", price: 0.5),
      Addon(name: "Honey Mustard", price: 0.5),
    ],
  ),

  // Desserts
  Food(
    name: "chocolate brownie",
    description: "A rich and gooey chocolate brownie",
    imagePath: "lib/images/desserts/brownie.png",
    price: 2.49,
    category: FoodCategory.desserts,
    availableAddons: [
      Addon(name: "Vanilla Ice Cream", price: 1.5),
      Addon(name: "Whipped Cream", price: 0.5),
    ],
  ),
  Food(
    name: "apple pie",
    description: "A classic apple pie slice",
    imagePath: "lib/images/desserts/apple_pie.png",
    price: 2.99,
    category: FoodCategory.desserts,
    availableAddons: [
      Addon(name: "Vanilla Ice Cream", price: 1.5),
      Addon(name: "Caramel Sauce", price: 0.5),
    ],
  ),
  Food(
    name: "cheesecake",
    description: "Creamy New York style cheesecake",
    imagePath: "lib/images/desserts/cheesecake.png",
    price: 3.49,
    category: FoodCategory.desserts,
    availableAddons: [
      Addon(name: "Strawberry Sauce", price: 0.5),
      Addon(name: "Whipped Cream", price: 0.5),
    ],
  ),
  Food(
    name: "ice cream sundae",
    description: "Vanilla ice cream with chocolate syrup and nuts",
    imagePath: "lib/images/desserts/sundae.png",
    price: 2.99,
    category: FoodCategory.desserts,
    availableAddons: [
      Addon(name: "Extra Nuts", price: 0.5),
      Addon(name: "Sprinkles", price: 0.5),
    ],
  ),
  Food(
    name: "lemon tart",
    description: "A tangy lemon tart with a flaky crust",
    imagePath: "lib/images/desserts/lemon_tart.png",
    price: 2.99,
    category: FoodCategory.desserts,
    availableAddons: [
      Addon(name: "Whipped Cream", price: 0.5),
      Addon(name: "Raspberry Sauce", price: 0.5),
    ],
  ),

  // Drinks
  Food(
    name:

 "lemonade",
    description: "A refreshing glass of lemonade",
    imagePath: "lib/images/drinks/lemonade.png",
    price: 1.99,
    category: FoodCategory.drinks,
    availableAddons: [
      Addon(name: "Mint", price: 0.5),
      Addon(name: "Extra Lemon", price: 0.3),
    ],
  ),
  Food(
    name: "iced tea",
    description: "A cold glass of iced tea",
    imagePath: "lib/images/drinks/iced_tea.png",
    price: 1.99,
    category: FoodCategory.drinks,
    availableAddons: [
      Addon(name: "Lemon", price: 0.3),
      Addon(name: "Mint", price: 0.5),
    ],
  ),
  Food(
    name: "milkshake",
    description: "A thick and creamy milkshake",
    imagePath: "lib/images/drinks/milkshake.png",
    price: 2.99,
    category: FoodCategory.drinks,
    availableAddons: [
      Addon(name: "Whipped Cream", price: 0.5),
      Addon(name: "Cherry", price: 0.3),
    ],
  ),
  Food(
    name: "coffee",
    description: "A hot cup of coffee",
    imagePath: "lib/images/drinks/coffee.png",
    price: 1.49,
    category: FoodCategory.drinks,
    availableAddons: [
      Addon(name: "Extra Shot", price: 0.5),
      Addon(name: "Flavor Syrup", price: 0.5),
    ],
  ),
  Food(
    name: "smoothie",
    description: "A refreshing fruit smoothie",
    imagePath: "lib/images/drinks/smoothie.png",
    price: 3.49,
    category: FoodCategory.drinks,
    availableAddons: [
      Addon(name: "Protein Powder", price: 1.0),
      Addon(name: "Chia Seeds", price: 0.5),
    ],
  ),
];

final List<CartItem> _cart = [];

//delivery address that user can change or update


String _deliveryAddress = '99 street';

/*
GETTERS
*/
List<Food> get menu => _menu;
List<CartItem> get cart => _cart;
String get deliveryAddress => _deliveryAddress;
/* 
OPERATIONS

*/

//add to cart

void addToCart (Food food, List<Addon> selectedAddons){
  CartItem? cartItem = _cart.firstWhereOrNull((item) {
    //check if the food items are  same
    bool isSameFood = item.food == food;

    //check if the selected addons are the same
    bool isSameAddon = ListEquality().equals(item.selectedAddons, selectedAddons);

    return isSameFood && isSameAddon;
  });


  //if item already exists , increase the quantity
  if(cartItem != null){
    cartItem.quantity++;
  }else{
    //add new item
    _cart.add(CartItem(food: food, selectedAddons: selectedAddons,),);
  }
  notifyListeners();
}

//remove from cart

void removeFromCart(CartItem cartItem){
  int cartIndex = _cart.indexOf(cartItem);

  if(cartIndex!= -1){
      if(_cart[cartIndex].quantity > 1){
        _cart[cartIndex].quantity--;
        
      }else{
        _cart.removeAt(cartIndex);
      }
  }

  notifyListeners();
}

//get total price

 double getTotalPrice(){
  double total = 0.0;
  for(CartItem cartItem in _cart){
    double itmeTotal = cartItem.food.price;

    for(Addon addon in cartItem.selectedAddons){
        itmeTotal += addon.price;
    }

    total += itmeTotal * cartItem.quantity;
  }

  return total;
 }

//get total number of items

int getTotalItemCount(){
  int totalItemCount = 0;

  for(CartItem cartItem in _cart){
    totalItemCount += cartItem.quantity;
  }

  return totalItemCount;
}



//clear cart

void clearCart(){
  _cart.clear();
  notifyListeners();
}

// update delivery address
void updateDeliveryAddress(String address){
  _deliveryAddress = address;
  notifyListeners();
}

/*
HELPERS
*/


//generate a reciept
String displayCartRecipt(){
  final recipt = StringBuffer();
  recipt.writeln("Here's your recipt.");
  recipt.writeln();

  



//format the date to include up to second only
String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
 recipt.writeln(formattedDate);

 recipt.writeln();

 recipt.writeln("--------------------------------");

 for(final cartItem in _cart){
  recipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
  if(cartItem.selectedAddons.isNotEmpty){
    recipt.writeln("Add-ons : ${_formatAddons(cartItem.selectedAddons)}");
  }

  recipt.writeln();
 }

 recipt.writeln("--------------------------------");
 recipt.writeln();
 recipt.writeln("Total Items : ${getTotalItemCount()}");
 recipt.writeln("Total Price : ${_formatPrice(getTotalPrice())}");
 recipt.writeln();

 return recipt.toString();

}


//format double value into money
String _formatPrice(double price){
  return "\$ ${price.toStringAsFixed(2)}";
}

//format list of addons into a string summary
String _formatAddons(List<Addon> addons){
  return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
} 

}