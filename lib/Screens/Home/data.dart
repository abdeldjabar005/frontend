import 'package:flutter/material.dart';

class Property {
  String label;
  String name;
  String rooms;
  String bathrooms;
  String garages;
  String price;
  String location;
    List<double> Latlng;
  String sqm;
  String description;
  String frontImage;
  String ownername;
  String ownerImage;
  List<String> images;

  Property(
      this.label,
      this.name,
      this.rooms,
      this.bathrooms,
      this.garages,
      this.price,
      this.location,
            this.Latlng,
      this.sqm,
      this.description,
      this.frontImage,
      this.ownername,
      this.ownerImage,
      this.images);
}

List<Property> getPropertyList() {
  return <Property>[
    Property(
      "SALE",
      "Clinton Villa",
      "07",
      "03",
      "03",
      "2,500.00",
      "Alger",
       [
        36.771721,
        3.051760,
      ],
      "2,456",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_01.jpg",
      "Real Estate",
      "assets/images/owner.jpg",
      [
        "assets/images/kitchen.jpg",
        "assets/images/bath_room.jpg",
        "assets/images/swimming_pool.jpg",
        "assets/images/bed_room.jpg",
        "assets/images/living_room.jpg",
      ],
    ),
    Property(
      "RENT",
      "Salu House",
      "07",
      "03",
      "03",
      "3,500.00",
      "Constantine",
        [
        36.351830,
        6.611630,
      ],
      "3,300",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_04.jpg",
      "Real Estate",
      "assets/images/owner.jpg",
      [
        "assets/images/kitchen.jpg",
        "assets/images/bath_room.jpg",
        "assets/images/swimming_pool.jpg",
        "assets/images/bed_room.jpg",
        "assets/images/living_room.jpg",
      ],
    ),
    Property(
      "RENT",
      "Hilton House",
      "07",
      "03",
      "03",
      "1,200.00",
      "Annaba",
        [
        36.351830,
        6.611630,
      ],
      "2,100",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_02.jpg",
      "Real Estate",
      "assets/images/owner.jpg",
      [
        "assets/images/kitchen.jpg",
        "assets/images/bath_room.jpg",
        "assets/images/swimming_pool.jpg",
        "assets/images/bed_room.jpg",
        "assets/images/living_room.jpg",
      ],
    ),
    Property(
      "SALE",
      "Ibe House",
      "07",
      "03",
      "03",
      "4,400.00",
      "Oran",
        [
        36.351830,
        6.611630,
      ],
      "4,100",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_03.jpg",
      "Real Estate",
      "assets/images/owner.jpg",
      [
        "assets/images/kitchen.jpg",
        "assets/images/bath_room.jpg",
        "assets/images/swimming_pool.jpg",
        "assets/images/bed_room.jpg",
        "assets/images/living_room.jpg",
      ],
    ),
    Property(
      "SALE",
      "Aventura",
      "07",
      "03",
      "03",
      "5,200.00",
      "Batna",
        [
        36.351830,
        6.611630,
      ],
      "3,100",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_05.jpg",
      "Real Estate",
      "assets/images/owner.jpg",
      [
        "assets/images/kitchen.jpg",
        "assets/images/bath_room.jpg",
        "assets/images/swimming_pool.jpg",
        "assets/images/bed_room.jpg",
        "assets/images/living_room.jpg",
      ],
    ),
  ];
}
