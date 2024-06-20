// To parse this JSON data, do
//
//     final postQuickContact = postQuickContactFromJson(jsonString);

import 'dart:convert';

PostQuickContactModel postQuickContactModelFromJson(String str) => PostQuickContactModel.fromJson(json.decode(str));

String postQuickContactModelToJson(PostQuickContactModel data) => json.encode(data.toJson());

class PostQuickContactModel {
    String? name;
    String? phone;
    String? email;
    String? subject;
    String? message;
    int? id;

    PostQuickContactModel({
        this.name,
        this.phone,
        this.email,
        this.subject,
        this.message,
        this.id,
    });

    factory PostQuickContactModel.fromJson(Map<String, dynamic> json) => PostQuickContactModel(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        subject: json["subject"],
        message: json["message"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "subject": subject,
        "message": message,
        "id": id,
    };
}
