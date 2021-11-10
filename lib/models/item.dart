part of "models.dart";

class Item {
  String? rating;
  String name;
  int price;
  String image;
  String? note;

  Item(this.name, this.price, this.image, {this.note, this.rating});
}

List<Item> dummyItems = [
  Item(
    "SOUNDTECH GOLEM TWS",
    550000,
    "assets/item1.jpg",
    rating: "5.0 | 200+",
  ),
  Item(
    "SAKUMINI Y6 ROUND",
    129000,
    "assets/item2.jpg",
    rating: "4.0 | 150+",
  ),
  Item(
    "Xiomi Mi A1",
    2700000,
    "assets/item3.jpg",
    rating: "4.5 | 175+",
  ),
  Item(
    "HP XIAOMI REDMI 7A",
    1300000,
    "assets/item4.jpg",
    rating: "3.0 | 100+",
  ),
  Item(
    "BACKPACK PRIA BESAR",
    65000,
    "assets/item5.jpg",
    rating: "3.5 | 125+",
  ),
  Item(
    "tas ransel distro pria",
    58200,
    "assets/item6.jpg",
    rating: "4.0 | 150+",
  ),
];

List<Item> dummySavedNoted = [
  Item("tas ransel distro pria", 58200, "assets/item6.jpg",
      rating: "4.0 | 150+",
      note:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore"),
  Item("BACKPACK PRIA BESAR", 65000, "assets/item5.jpg",
      rating: "3.5 | 125+",
      note:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore"),
];

List<String> dummySlider = [
  "assets/item1.jpg",
  "assets/item2.jpg",
  "assets/item3.jpg"
];
