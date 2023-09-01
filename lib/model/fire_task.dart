import 'package:cloud_firestore/cloud_firestore.dart';

class FireMessage{
  String? fromUid;
  String? toUid;
  String? text;
  Timestamp? createdAt;


  FireMessage({this.fromUid, this.toUid, this.text, this.createdAt,});

  FireMessage.fromJson(Map<String, dynamic> json,) {

    fromUid = json['fromUid'];
    toUid = json['toUid'];
    text = json['text'];
    createdAt = json['createdAt'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fromUid'] = fromUid;
    data['toUid'] = toUid;
    data['text'] = text;
    data['createdAt'] = createdAt;

    return data;
  }
}