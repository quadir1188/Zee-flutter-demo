import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';


class CategoryNewsModel extends Equatable {
  final String image;
  final String title;


  CategoryNewsModel({this.image,this.title});

  @override
  List<Object> get props => [image, title];

  @override
  String toString() {
    return 'CategoryNewsModel{image: $image, title: $title}';
  }
}
