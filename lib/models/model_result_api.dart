class ResultModel {
  final bool success;
  final String status;
  final String message;
  final dynamic data;

  ResultModel({
    required this.status,
    required this.success,
    required this.message,
    this.data,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      status: json['status'] ?? '',
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'],
    );
  }
}
