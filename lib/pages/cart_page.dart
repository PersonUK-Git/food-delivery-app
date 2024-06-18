import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_cart_tile.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        return Scaffold(
          appBar: AppBar(
            title: Text("Cart Page"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              
              //clear all cart
              
              IconButton(onPressed: (){
                showDialog(context: context, builder: (context) => AlertDialog(
                title: Text("Are you sure you want to clear the cart!"),
                actions: [
                  //cancle button
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancle")),
                  //yes button
                  TextButton(onPressed: (){
                     Navigator.pop(context);
                     restaurant.clearCart();
                  },
                   child: const Text("Yes")),
                ],
              ),);
              }, icon: const Icon(Icons.delete),)
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                   userCart.isEmpty ? const Expanded(child: Center(child: Text("Cart is empty....."))):
                     Expanded(
                      
                        child: ListView.builder(
                          itemCount: userCart.length,
                            itemBuilder: (context, index) { 
                
                              //get indivual cart item
                
                              final cartItem = userCart[index];
                              return MyCartTile(cartItem: cartItem);
                            }
                            ),
                            ),
                  ],
                ),
              ),

              //button to pay
              MyButton(text: "Go to Checkout", onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()),),),

              const SizedBox(height: 25,),
            ],
          ),
        );
      },
    );
  }
}
