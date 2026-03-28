import 'package:flutter/material.dart';
class CardRecipe extends StatelessWidget {
  const CardRecipe({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(width: 250, height: 300),
    );
  }
}
