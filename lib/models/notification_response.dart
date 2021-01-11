// To parse this JSON data, do
//
//     final notificationResponse = notificationResponseFromJson(jsonString);

import 'dart:convert';

NotificationResponse notificationResponseFromJson(String str) =>
    NotificationResponse.fromJson(json.decode(str));

String notificationResponseToJson(NotificationResponse data) =>
    json.encode(data.toJson());

class NotificationResponse {
  NotificationResponse({
    this.success,
    this.data,
    this.lastRefreshed,
    this.lastOriginUpdate,
  });

  bool success;
  Data data;
  DateTime lastRefreshed;
  DateTime lastOriginUpdate;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      NotificationResponse(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        lastRefreshed: json["lastRefreshed"] == null
            ? null
            : DateTime.parse(json["lastRefreshed"]),
        lastOriginUpdate: json["lastOriginUpdate"] == null
            ? null
            : DateTime.parse(json["lastOriginUpdate"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data.toJson(),
        "lastRefreshed":
            lastRefreshed == null ? null : lastRefreshed.toIso8601String(),
        "lastOriginUpdate": lastOriginUpdate == null
            ? null
            : lastOriginUpdate.toIso8601String(),
      };
}

class Data {
  Data({
    this.notifications,
  });

  List<Notification> notifications;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notifications: json["notifications"] == null
            ? null
            : List<Notification>.from(
                json["notifications"].map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications": notifications == null
            ? null
            : List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class Notification {
  Notification({
    this.title,
    this.link,
  });

  String title;
  String link;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        title: json["title"] == null ? null : json["title"],
        link: json["link"] == null ? null : json["link"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "link": link == null ? null : link,
      };
}
