import 'package:equatable/equatable.dart';

 class DetailsEvent extends Equatable{
  String url;
  DetailsEvent({this.url});

  @override
  List<Object> get props => [];
}
class FetchDetails extends DetailsEvent {
   String url;
  FetchDetails({this.url});
  @override
  List<Object> get props => [url];

  @override
  String toString() => 'Fetch $url news';
}
