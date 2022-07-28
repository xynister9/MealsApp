
import 'package:flutter/material.dart';

class Category {
  final String id ;
  final String title ;
  final Color color ;
  static int randomId = 1 ;
  Category({ required this.id , required this.title ,  this.color = Colors.orange  } ){randomId++;} 
}