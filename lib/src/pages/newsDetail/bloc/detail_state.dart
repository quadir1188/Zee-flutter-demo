import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/models/newsResponseModel.dart';

import '../../../models/newsDetailsResponse.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class LoadingDetails extends DetailState {}

class LoadedDetails extends DetailState {
  final NewsDetail newsDetail;
  final String type;

  const LoadedDetails({@required this.newsDetail, this.type});

  @override
  List<Object> get props => [newsDetail];

  @override
  String toString() => 'Loaded { items: ${newsDetail.url} }';
}

class FailureDetails extends DetailState {}
