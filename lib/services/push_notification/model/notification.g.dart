// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Notification> _$notificationSerializer =
    new _$NotificationSerializer();

class _$NotificationSerializer implements StructuredSerializer<Notification> {
  @override
  final Iterable<Type> types = const [Notification, _$Notification];
  @override
  final String wireName = 'Notification';

  @override
  Iterable<Object?> serialize(Serializers serializers, Notification object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.notificationType;
    if (value != null) {
      result
        ..add('notificationType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notificationId;
    if (value != null) {
      result
        ..add('notificationId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.notificationTitle;
    if (value != null) {
      result
        ..add('notificationTitle')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.notificationBody;
    if (value != null) {
      result
        ..add('notificationBody')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Notification deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'notificationType':
          result.notificationType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'notificationId':
          result.notificationId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'notificationTitle':
          result.notificationTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'notificationBody':
          result.notificationBody = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Notification extends Notification {
  @override
  final String? notificationType;
  @override
  final int? notificationId;
  @override
  final String? notificationTitle;
  @override
  final String? notificationBody;

  factory _$Notification([void Function(NotificationBuilder)? updates]) =>
      (new NotificationBuilder()..update(updates)).build();

  _$Notification._(
      {this.notificationType,
      this.notificationId,
      this.notificationTitle,
      this.notificationBody})
      : super._();

  @override
  Notification rebuild(void Function(NotificationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationBuilder toBuilder() => new NotificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Notification &&
        notificationType == other.notificationType &&
        notificationId == other.notificationId &&
        notificationTitle == other.notificationTitle &&
        notificationBody == other.notificationBody;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, notificationType.hashCode), notificationId.hashCode),
            notificationTitle.hashCode),
        notificationBody.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Notification')
          ..add('notificationType', notificationType)
          ..add('notificationId', notificationId)
          ..add('notificationTitle', notificationTitle)
          ..add('notificationBody', notificationBody))
        .toString();
  }
}

class NotificationBuilder
    implements Builder<Notification, NotificationBuilder> {
  _$Notification? _$v;

  String? _notificationType;
  String? get notificationType => _$this._notificationType;
  set notificationType(String? notificationType) =>
      _$this._notificationType = notificationType;

  int? _notificationId;
  int? get notificationId => _$this._notificationId;
  set notificationId(int? notificationId) =>
      _$this._notificationId = notificationId;

  String? _notificationTitle;
  String? get notificationTitle => _$this._notificationTitle;
  set notificationTitle(String? notificationTitle) =>
      _$this._notificationTitle = notificationTitle;

  String? _notificationBody;
  String? get notificationBody => _$this._notificationBody;
  set notificationBody(String? notificationBody) =>
      _$this._notificationBody = notificationBody;

  NotificationBuilder();

  NotificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _notificationType = $v.notificationType;
      _notificationId = $v.notificationId;
      _notificationTitle = $v.notificationTitle;
      _notificationBody = $v.notificationBody;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Notification other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Notification;
  }

  @override
  void update(void Function(NotificationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Notification build() {
    final _$result = _$v ??
        new _$Notification._(
            notificationType: notificationType,
            notificationId: notificationId,
            notificationTitle: notificationTitle,
            notificationBody: notificationBody);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
