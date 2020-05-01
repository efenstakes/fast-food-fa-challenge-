import 'package:fast_food/models/food.dart';
import 'package:fast_food/screens/details/details_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedFilter = 'Peruvian';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      body: SafeArea(
        child: ListView(
          children: <Widget>[

            // app bar
            FDAppBar(),

            SizedBox(height: 32,),

            // filter chips
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  _buildFilterChip(label: 'Polish'),
                  SizedBox(width: 28,),
                  _buildFilterChip(label: 'Peruvian'),
                  SizedBox(width: 28,),
                  _buildFilterChip(label: 'Italian'),

                ],
              ),
            ),

            SizedBox(height: 40,),

            // foods
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                 
                  ...foods.map((Food food) {

                    return GestureDetector(
                      child: FoodCard( food: food ),
                      onTap: ()=> this._goToDetails(food: food),
                    );
                  }).toList(),

                ],
              ),
            ),

          ],
        ),
      )

    );
  }// Widget build(BuildContext context) { .. }

  
  Widget _buildFilterChip({ @required String label }) {
    bool isSelected = label == this._selectedFilter;

    return GestureDetector(
      child: Chip(
        label: Text(
          label,
        ),

        padding: EdgeInsets.symmetric(
          horizontal: 24, vertical: 12,
        ),
        backgroundColor: isSelected ? Color(0xfff211c19) : Color(0xfff7f2eb),
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: isSelected ? Color(0xfff7f2eb) : Color(0xff211c19),
          letterSpacing: 1.2
        ),
      ),

      onTap: ()=> setState(()=> this._selectedFilter = label),
    );
  }

  void _goToDetails({ @required Food food }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_)=> DetailsScreen(food: food)
      )
    );
  }// void _goToDetails() { .. }


}


class FoodCard extends StatelessWidget {
  final Food food;
  
  FoodCard({ this.food });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height*0.7,
      width: screenSize.width*0.6,
      margin: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        color: Color(0xffff7f2eb),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30, vertical: 28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              // name
              Hero(
                tag: '${food.id} name',
                child: Text(
                  food.name,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                  ),
                ),
              ),

              // type
              Text(
                food.type,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                  color: Colors.black45,
                ),
              ),

              SizedBox(height: 48,),

              // image
              Hero(
                tag: food.id,
                child: ClipOval(
                  child: Image.asset(
                    food.image,
                    fit: BoxFit.cover,
                    height: screenSize.width*0.4,
                    width: screenSize.width*0.4,
                  ),
                ),
              ),

              SizedBox(height: 48,),

              // price
              Text(
                '\$${food.price}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                ),
              ),

              SizedBox(height: 20,),

              // description
              Text(
                food.description,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20,),

              // buy button
              Container(
                width: 120,
                height: 44,
                decoration: BoxDecoration(
                  color: Color(0xffff7d80f),
                  borderRadius: BorderRadius.circular(40),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Buy',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }// Widget build(BuildContext context) { .. }
}


class FDAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          
          // menu
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Color(0xfff7f2eb),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: 
              Icon(
                Icons.menu,
                size: 24,
              ),
          ),

          // fast food test
          Text(
            'Fast Food',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800
            ),
          ),

          // user avatar
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Color(0xfff7f2eb),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: 
              Icon(
                Icons.person,
                size: 24,
              ),
          ),

        ],
      ),
    );
  }
}