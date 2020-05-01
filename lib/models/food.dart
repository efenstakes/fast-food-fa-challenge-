

class Food {
  String id;
  String name;
  String price;
  String description;
  String type;
  String image;

  Food({
    this.id, 
    this.name,
    this.price,
    this.description,
    this.type,
    this.image,
  });
}

List<Food> foods = [
   
  Food(
    id: '1',
    name: 'Grilled Beef',
    price: '2300',
    description: 'Grilled beef steak and potatoes on plate isolated with more food',
    type: 'Peruvian Food',
    image: 'assets/images/one.jpg',
  ),
  
  Food(
    id: '2',
    name: 'Saltado',
    price: '1700',
    description: 'Grilled beef steak and potatoes on plate isolated with more food',
    type: 'South African Food',
    image: 'assets/images/four.jpg',
  ),
  
  Food(
    id: '3',
    name: 'Steamed Beef',
    price: '1500',
    description: 'Grilled beef steak and potatoes on plate isolated with more food',
    type: 'South African Food',
    image: 'assets/images/three.jpg',
  ),
  
  Food(
    id: '4',
    name: 'Beef Stew Macaroni',
    price: '1200',
    description: 'Grilled beef steak and potatoes on plate isolated with more food',
    type: 'Peruvian Food',
    image: 'assets/images/two.jpg',
  ),
  
  Food(
    id: '5',
    name: 'Grilled Liver and Pilau',
    price: '1300',
    description: 'Grilled beef steak and potatoes on plate isolated with more food',
    type: 'Italian Food',
    image: 'assets/images/five.jpg',
  ),
  
  Food(
    id: '6',
    name: 'Fried Beef and Ugali',
    price: '4300',
    description: 'Grilled beef steak and potatoes on plate isolated with more food',
    type: 'Tanzanian Food',
    image: 'assets/images/six.jpg',
  ),


];