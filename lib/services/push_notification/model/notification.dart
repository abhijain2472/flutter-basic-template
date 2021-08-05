import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'notification.g.dart';

abstract class Notification
    implements Built<Notification, NotificationBuilder> {
  Notification._();

  factory Notification([updates(NotificationBuilder b)]) = _$Notification;

  String? get notificationType;

  int? get notificationId;

  String? get notificationTitle;

  String? get notificationBody;

  String toJson() {
    return json
        .encode(serializers.serializeWith(Notification.serializer, this));
  }

  static Notification? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Notification.serializer, json.decode(jsonString));
  }

  static Serializer<Notification> get serializer => _$notificationSerializer;
}
