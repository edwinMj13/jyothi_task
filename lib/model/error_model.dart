class ErrorModel{
  final String message;

  ErrorModel({required this.message});

  fromJson(json){
    return ErrorModel(
message: json["message"],
    );
  }
}