import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_quantity_selector.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restraunt, child) => Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                      //food image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          cartItem.food.imagePath,
                          width: 100,
                          height: 100,
                        ),
                      ),

                      const SizedBox(
                        width: 10,
                      ),
                      //name and price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItem.food.name),
                          Text("\$" + cartItem.food.price.toString()),
                          const SizedBox(height: 10),
                           MyQuantitySelector(
                          quantity: cartItem.quantity,
                          food: cartItem.food,
                          onIncrement: () {
                            restraunt.addToCart(
                                cartItem.food, cartItem.selectedAddons);
                          },
                          onDecrement: () {
                            restraunt.removeFromCart(cartItem);
                          }),
                        ],
                      ),

                      const Spacer(),

                      //increment or decrement quqntity
                     
                    ]),
                  ),

                  //addons

                  SizedBox(
                    height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                      children:
                          cartItem.selectedAddons.map((addon) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FilterChip(
                                label: Row(
                                  children: [
                                    Text(addon.name),
                                    Text("(\$" + addon.price.toString()+ ")", 
                                    style: TextStyle(color: Theme.of(context).colorScheme.primary),)
                                  ],
                                ),
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: Theme.of(context).colorScheme.primary,
                                    ),
                                ),
                                onSelected: (value) {},
                                backgroundColor: Theme.of(context).colorScheme.secondary,
                                labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                fontSize: 12,
                                ),
                                ),
                          ),).toList(),
                    ),
                  ),
                ],
              ),
            ));
  }
}
