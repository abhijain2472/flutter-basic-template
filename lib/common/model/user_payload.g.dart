// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_payload.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserPayloadAdapter extends TypeAdapter<UserPayload> {
  @override
  final int typeId = 0;

  @override
  UserPayload read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPayload(
      userId: fields[0] as String,
      firstName: fields[1] as String?,
      email: fields[2] as String?,
      profilePhoto: fields[3] as String,
      deviceName: fields[4] as String?,
      deviceToken: fields[6] as String?,
      deviceType: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserPayload obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.profilePhoto)
      ..writeByte(4)
      ..write(obj.deviceName)
      ..writeByte(5)
      ..write(obj.deviceType)
      ..writeByte(6)
      ..write(obj.deviceToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPayloadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
