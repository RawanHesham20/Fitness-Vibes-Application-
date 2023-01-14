import 'package:flutter/material.dart';

import '../../Data/foodlist.dart';

import 'nutrition_details.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var foodList = FoodList(
    name: '',
    foodCategory: '',
    id: 0,
  );
  List<FoodList> _foodList = [];
  @override
  void initState() {
    _foodList = foodList.foodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
              height: 100,
            ),
            Text('Food Nutrients')
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(
                "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.heart.org%2Fen%2Fhealthy-living%2Fhealthy-eating%2Feat-smart%2Fnutrition-basics%2Fhow-can-i-eat-more-nutrient-dense-foods&psig=AOvVaw3r5OGqebhGnj0a04sxrFEE&ust=1673475681942000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCLCUq-6EvvwCFQAAAAAdAAAAABAm"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
            itemCount: _foodList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(_foodList[index].id)),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_foodList[index].name}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      ),
                      Text(
                        "${_foodList[index].foodCategory}",
                        style: TextStyle(fontSize: 16, color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
