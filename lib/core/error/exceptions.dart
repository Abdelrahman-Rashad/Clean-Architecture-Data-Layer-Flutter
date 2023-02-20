// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_layer/core/error/error_massage_model.dart';

class ServerException implements Exception {
  ErrorMassageModel errorMassageModel;
  ServerException({
    required this.errorMassageModel,
  });
}
