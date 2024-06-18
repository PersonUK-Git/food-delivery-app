import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {

  final Food food;
  final Map<Addon , bool> selectedAddons = {};
   FoodPage({super.key, required this.food,}){
    //initialize selected addons
    for(Addon addon in food.availableAddons){
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method to add to cart 
  void addToCart(Food food, Map<Addon, bool> selectedAddons){

    //close the current page and navigate to the home page
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentSelectedAddons = [];
    for(Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon] == true){
        currentSelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(food, currentSelectedAddons);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          
          children: [
        
            //food image
          Image.asset(widget.food.imagePath,),
          
        
            //food name 
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.food.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
        
                Text("\$"+widget.food.price.toString(),
                style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
                ),),         
              //food description
            Text(widget.food.description,
            style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.tertiary,
                ),),
        
                const SizedBox(height: 10,),
        
                Divider(color: Theme.of(context).colorScheme.secondary,),
        
                const SizedBox(height: 10,),
        
                Text("Add-Ons",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
        
                const SizedBox(height: 10,),
              //addons
            Container(
              decoration: BoxDecoration(border: Border.all(color: Theme.of(context).colorScheme.tertiary), borderRadius: BorderRadius.circular(8),),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: widget.food.availableAddons.length,
                itemBuilder: (context, index) {
                  //get individual addon
                  Addon addon = widget.food.availableAddons[index];
              
                  //return checkbox UI
                  return CheckboxListTile(
                    title: Text(addon.name),
                    subtitle: Text("\$"+addon.price.toString(), style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                    value : widget.selectedAddons[addon],

                    onChanged: (bool? value) {
                        setState(() {
                          widget.selectedAddons[addon] = value!;
                        });
                    },
                  );
                },
              ),
            )
              ],
            ),
          ),
            //button
        
            MyButton(text: "Add to cart", onTap: ()=> addToCart(widget.food, widget.selectedAddons)),

            const SizedBox(height: 25,),
        ],
            ),
      ),
      ),


      //back button
      Opacity(
        opacity: 0.6,
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 20, top: 15),
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle),
            child: IconButton(icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => Navigator.pop(context),)
          ),
        ),
      )
      ],
    );
    
      
  }
}