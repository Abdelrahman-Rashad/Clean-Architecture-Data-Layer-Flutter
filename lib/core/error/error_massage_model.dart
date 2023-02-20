class ErrorMassageModel {
  final int statusCode;
  final String statusMessage;
  final bool success;

  ErrorMassageModel({required this.statusCode, required this.statusMessage, required this.success});

  factory ErrorMassageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMassageModel(
      statusCode : json['status_code'],
    statusMessage : json['status_message'],
    success : json['success']
      );
  }
}