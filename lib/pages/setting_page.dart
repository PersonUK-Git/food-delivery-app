import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Setting Page"),
      backgroundColor: Theme.of(context).colorScheme.background,),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //dark mode

          
          //switch
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),),

                margin : const EdgeInsets.only(left: 25, top: 10, right: 25),
                padding: const EdgeInsets.all(25),
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              
                  Text("Dark Mode",
                        style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
                        ),),
                  CupertinoSwitch(value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                   onChanged: (Value)=> {
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme()
                   }),
                ],
              ),
            ),
        ],
      ),
    );
  }
}