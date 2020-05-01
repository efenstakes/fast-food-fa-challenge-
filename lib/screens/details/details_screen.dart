import 'package:fast_food/models/food.dart';
import 'package:flutter/material.dart';


class DetailsScreen extends StatefulWidget {
  final Food food;

  const DetailsScreen({Key key, this.food}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String _selectedSize = 'Small';
  Food food;

  @override
  void initState() {
    super.initState();
    this.food = widget.food;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      // body: ListView(
      //   children: <Widget>[
          
      //     // app bar
      //     _buildAppBar(),
          
      //     SizedBox(height: 40,),

      //     // food details
      //     _buildFoodDetails(),

      //     // buy section screenSize.height*0.7
      //     _buildBuySection(),

      //   ],
      // ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 20,),
            // app bar
            _buildAppBar(),
            
            SizedBox(height: 40,),

            Stack(
              overflow: Overflow.visible,
              children: <Widget>[

                // food details
                _buildFoodDetails(),

                // buy section screenSize.height*0.7
                Positioned(
                  left: 0,
                  right: 0,
                  top: screenSize.height*0.68,
                  child: _buildBuySection(),
                )

              ],
            ),


          ],
        ),
      ),
      
    );
  }

  Widget _buildAppBar() {

    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32, vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            
            // back button
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Color(0xffff7f2eb),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_left),
                iconSize: 36,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),

            // title
            Text(
              'Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8
              ),
            ),

            // more icon
            Icon(
              Icons.more_vert,
              size: 28,
            ),

          ],
        ),
      );
  }

  Widget _buildSizeSelector({ @required String size }) {
    bool isSelected = size == this._selectedSize;

    return GestureDetector(
      child: Container(
        height: 48,
        width: 120,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xfff211c19) : Color(0xffff8f4ed),
          borderRadius: BorderRadius.circular(40)
        ),
        alignment: Alignment.center,
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Color(0xffff8f4ed) : Color(0xfff211c19),
            fontSize: 18,
          ),
        ),
      ),

      onTap: () {
        setState(()=> this._selectedSize = size);
      },
    );
  }// Widget _buildSizeSelector({ @required String size }) { .. }

  Widget _buildFoodDetails() {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
        height: screenSize.height*0.85,
        decoration: BoxDecoration(
          color: Color(0xffff8f4ed),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )
        ),
        padding: EdgeInsets.only(
          left: 20, right: 20, top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            // name and fav icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Hero(
                  tag: '${food.id} name',
                  child: Text(
                    widget.food.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6
                    ),
                  ),  
                ),                  

                Icon(
                  Icons.favorite,
                  size: 40,
                  color: Color(0xfffa35430),
                ),

              ],
            ),

            // little description
            Text(
              'Sauteed meat with vegetables',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
                color: Colors.black54,
              ),
            ), 

            SizedBox(height: 40,),

            // image
            Hero(
              tag: food.id,
              child: Center(
                child: ClipOval(
                  child: Image.asset(
                    widget.food.image,
                    fit: BoxFit.cover,

                    width: screenSize.width*0.6,
                    height: screenSize.width*0.6,
                  ),
                ),
              ),
            ),

            SizedBox(height: 40,),

            // size selectors
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                _buildSizeSelector(size: 'Small'),
                _buildSizeSelector(size: 'Medium'),
                _buildSizeSelector(size: 'Large'),

              ],
            ),

          ],
        ),
      );
  }// Widget _buildFoodDetails() { .. }

  Widget _buildBuySection() {

    return Container(
        height: 200,
        decoration: BoxDecoration(
          color: Color(0xfff211c19),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  'Now',
                  style: TextStyle(
                    color: Color(0xffff8f4ed),
                    fontWeight: FontWeight.w500
                  ),
                ),
                
                SizedBox(height: 10,),
                
                Text(
                  '\$${food.price}',
                  style: TextStyle(
                    color: Color(0xffff8f4ed),
                    fontWeight: FontWeight.w900
                  ),
                ),
                
                SizedBox(height: 10,),

                Text(
                  '50% Dscnt',
                  style: TextStyle(
                    color: Color(0xffff8f4ed),
                  ),
                ),
                  
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  'Before',
                  style: TextStyle(
                    color: Color(0xffff8f4ed),
                    fontWeight: FontWeight.w500
                  ),
                ),

                SizedBox(height: 10,),

                Text(
                  '\$${food.price}',
                  style: TextStyle(
                    color: Color(0xffff8f4ed),
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w900
                  ),
                ),
                  
              ],
            ),
            
            Container(
              width: 174,
              height: 48,
              child: FloatingActionButton.extended(
                      label: Text(
                        'Buy',
                        style: TextStyle(
                          color: Color(0xfff211c19),
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      onPressed: (){ },
                      backgroundColor: Color(0xffff7d80f),
                    ),
            ),
            

          ],
        ),
      );
  }// Widget _buildBuySection() { .. }


}