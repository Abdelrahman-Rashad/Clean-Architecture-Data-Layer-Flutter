import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String originalLang;
  final String title;

  const Movie({required this.id, required this.originalLang, required this.title});

  @override
  List<Object?> get props => [originalLang];
}

class UserEntity {
  final String email;

  UserEntity(this.email);
}
