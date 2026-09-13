/// Notification payload — a typed, stable identifier carrier.
///
/// Payloads must remain small. Never embed full entity objects.
library;

import 'dart:convert';

/// The payload carried in every scheduled notification.
class NotificationPayload {
  const NotificationPayload({
    required this.type,
    required this.entityId,
    this.routePath,
  });

  /// Deserialize from JSON string (as stored in the notification payload).
  factory NotificationPayload.fromJson(String json) {
    final map = jsonDecode(json) as Map<String, dynamic>;
    return NotificationPayload(
      type: map['type'] as String,
      entityId: map['entityId'] as String,
      routePath: map['routePath'] as String?,
    );
  }

  /// The notification category type.
  final String type;

  /// The stable entity identifier (event ID, prayer name, etc.).
  final String entityId;

  /// Optional deep-link route path to navigate on tap.
  final String? routePath;

  /// Serialize to JSON string for storage in the notification payload field.
  String toJson() => jsonEncode({
        'type': type,
        'entityId': entityId,
        if (routePath != null) 'routePath': routePath,
      });
}
