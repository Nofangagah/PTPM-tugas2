import 'package:flutter/material.dart';

class FavoriteButtonPage extends StatefulWidget {
  const FavoriteButtonPage({super.key});

  @override
  State<FavoriteButtonPage> createState() => _FavoriteButtonPageState();
}

class _FavoriteButtonPageState extends State<FavoriteButtonPage> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.green : Colors.grey),
        child: const Text(
          "Favorite",
          style: TextStyle(color: Colors.white),
        ));
  }
}
