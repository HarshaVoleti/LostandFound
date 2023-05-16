import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lostandfound/feedpage.dart';
import 'package:lostandfound/listpage.dart';
import 'package:lostandfound/profilepage.dart';

final grey = Color.fromRGBO(89, 89, 89, 1);
final back = Color.fromRGBO(33, 37, 41, 1);

void showsnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 14),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}

class LaFItems {
  final String id;
  final String title;
  final String image;
  final DateTime date;
  final String location;
  final int number;
  final String description;
  final String owner;
  bool lost;

  LaFItems({
    required this.id,
    required this.title,
    required this.image,
    required this.date,
    required this.location,
    required this.number,
    required this.owner,
    required this.description,
    required this.lost,
  });
}

class SellItems {
  final String id;
  final String title;
  final File image;
  final DateTime date;
  final String location;
  final String description;
  final int number;
  final String owner;
  SellItems({
    required this.id,
    required this.title,
    required this.image,
    required this.date,
    required this.location,
    required this.owner,
    required this.description,
    required this.number,
  });
}

final lostandfounditems = [
  // LaFItems(
  //   id: DateTime.now().toString(),
  //   title: 'pendrive',
  //   date: DateTime.now(),
  //   image: 'assets/sandisk.png',
  //   location: 'near CK naidu stadium',
  //   number: 8919262188,
  //   owner: "Harsha Voleti",
  //   description: "Sandisk 64GB pendrive , red and black color",
  // ),
  // LaFItems(
  //   id: DateTime.now().toString(),
  //   title: 'pendrive',
  //   date: DateTime.now(),
  //   image: 'assets/sandisk.png',
  //   location: 'near CK naidu stadium',
  //   number: 8919262188,
  //   owner: "Harsha Voleti",
  //   description: "Sandisk 64GB pendrive , red and black color",
  // ),
  // LaFItems(
  //   id: DateTime.now().toString(),
  //   title: 'pendrive',
  //   date: DateTime.now(),
  //   image: 'assets/sandisk.png',
  //   location: 'near CK naidu stadium',
  //   number: 8919262188,
  //   owner: "Harsha Voleti",
  //   description: "Sandisk 64GB pendrive , red and black color",
  // ),
  // LaFItems(
  //   id: DateTime.now().toString(),
  //   title: 'pendrive',
  //   date: DateTime.now(),
  //   image: 'assets/sandisk.png',
  //   location: 'near CK naidu stadium',
  //   number: 8919262188,
  //   owner: "Harsha Voleti",
  //   description: "Sandisk 64GB pendrive , red and black color",
  // ),
];

final saleItems = [
  // SellItems(
  //   id: DateTime.now().toString(),
  //   title: "pendrive",
  //   image: 'assets/sandisk.png',
  //   date: DateTime.now(),
  //   location: "Prince Hostel",
  //   owner: "Revanth",
  //   number: 9511782143,
  // ),
  // SellItems(
  //   id: DateTime.now().toString(),
  //   title: "pendrive",
  //   image: 'assets/sandisk.png',
  //   date: DateTime.now(),
  //   location: "Prince Hostel",
  //   owner: "Revanth",
  //   number: 9511782143,
  // ),
  // SellItems(
  //   id: DateTime.now().toString(),
  //   title: "pendrive",
  //   image: 'assets/sandisk.png',
  //   date: DateTime.now(),
  //   location: "Prince Hostel",
  //   owner: "Revanth",
  //   number: 9511782143,
  // ),
  // SellItems(
  //   id: DateTime.now().toString(),
  //   title: "pendrive",
  //   image: 'assets/sandisk.png',
  //   date: DateTime.now(),
  //   location: "Prince Hostel",
  //   owner: "Revanth",
  //   number: 9511782143,
  // ),
  // SellItems(
  //   id: DateTime.now().toString(),
  //   title: "pendrive",
  //   image: 'assets/sandisk.png',
  //   date: DateTime.now(),
  //   location: "Prince Hostel",
  //   owner: "Revanth",
  //   number: 9511782143,
  // ),
  // SellItems(
  //   id: DateTime.now().toString(),
  //   title: "pendrive",
  //   image: 'assets/sandisk.png',
  //   date: DateTime.now(),
  //   location: "Prince Hostel",
  //   owner: "Revanth",
  //   number: 9511782143,
  // ),
];

List<Widget> pages = [
  const FeedPage(),
  const ListPage(),
  const ProfilePage(),
];
