import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Provider1 extends ChangeNotifier {
  String? phone;
  String? name;
  String? base;
  String? uid;
  String? gmail;
  String? imgAddress;
  String? mode;
  String? time;
  String? address;
  String? number;
  String? method;
  double? lat;
  double? lon;

  List<CartItems>? items_in_cart = [];
  double? total;
  double? subtotal;
  int itemLength = 0;
  int priceSum = 0;
  Future<void> sumOfPrice() async {
    List<int> x = [];
    for (int i = 0; i < items_in_cart!.length; i++) {
      x.add(items_in_cart![i].eachCost * items_in_cart![i].count);
    }
    priceSum = x.reduce((value, element) => value + element);
    notifyListeners();
  }

  Future<void> CartCountDecreament(int counter, int index) async {
    items_in_cart![index].count = counter - 1;
    items_in_cart![index].cost =
        items_in_cart![index].cost - items_in_cart![index].eachCost;
    notifyListeners();
  }

  Future<void> CartCountIncreament(int counter, int index) async {
    items_in_cart![index].count = counter + 1;
    items_in_cart![index].cost =
        items_in_cart![index].cost + items_in_cart![index].eachCost;
    notifyListeners();
  }

  increamentCart() {
    itemLength++;
    notifyListeners();
  }

  decreamentCart() {
    if (itemLength > 0) {
      itemLength--;
    } else {
      itemLength;
    }
    notifyListeners();
  }

  notifyListeners();
}

class CartItems {
  int id;
  String imgAddress;
  String title;
  String subtitle;

  int count;
  int eachCost;
  int cost;
  CartItems(this.id, this.imgAddress, this.title, this.subtitle, this.cost,
      this.count, this.eachCost);
}
