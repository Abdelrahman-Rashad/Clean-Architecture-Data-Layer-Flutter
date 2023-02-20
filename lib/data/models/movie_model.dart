import 'package:data_layer/domain/entities/popular_movie_entity.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id, required super.originalLang, required super.title});

    factory MovieModel.fromjson(Map<String,dynamic> json){
      return MovieModel(
        id: json['id'],
        originalLang: json['original_language'],
        title: json['original_title']);
    }
}
