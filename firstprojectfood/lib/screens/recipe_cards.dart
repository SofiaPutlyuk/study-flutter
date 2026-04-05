import "package:firstprojectfood/models/model_cards.dart";
import "package:firstprojectfood/services/service_card.dart";
import "package:flutter/material.dart";

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meal categories")),
      body: FutureBuilder<List<Category>>(
        future: fetchRecipes() as Future<List<Category>>?,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: $snapshot.error"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No categories "));
          } else {
            final categories = snapshot.data!;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(categories[index].name));
              },
            );
          }
        },
      ),
    );
  }
}
