class ImageUploadResponseModel {
  String? uploadUrl;
  String? fileName;

  ImageUploadResponseModel({
    this.uploadUrl,
    this.fileName,
  });

  factory ImageUploadResponseModel.fromJson(Map<String, dynamic> json) =>
      ImageUploadResponseModel(
        uploadUrl: json["uploadUrl"],
        fileName: json["fileName"],
      );

  Map<String, dynamic> toJson() => {
        "uploadUrl": uploadUrl,
        "fileName": fileName,
      };
}
