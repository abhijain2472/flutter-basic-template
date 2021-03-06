import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'notification.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Notification,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
