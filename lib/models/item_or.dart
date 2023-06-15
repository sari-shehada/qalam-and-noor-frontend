// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemOr<T> {
  final T message;
  final bool success;
  ItemOr({
    required this.message,
    required this.success,
  });

  ItemOr<T> copyWith({
    T? message,
    bool? success,
  }) {
    return ItemOr<T>(
      message: message ?? this.message,
      success: success ?? this.success,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'item': item.toMap(),
  //     'success': success,
  //   };
  // }

  factory ItemOr.fromMap(Map<String, dynamic> map) {
    return ItemOr<T>(
      message: map['message'] as T,
      success: map['success'] as bool,
    );
  }

  // String toJson() => json.encode(toMap());

  factory ItemOr.fromJson(String source) =>
      ItemOr.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ItemOr(message: $message, success: $success)';

  @override
  bool operator ==(covariant ItemOr<T> other) {
    if (identical(this, other)) return true;

    return other.message == message && other.success == success;
  }

  @override
  int get hashCode => message.hashCode ^ success.hashCode;

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'message': message.toMap(),
  //     'success': success,
  //   };
  // }

  // String toJson() => json.encode(toMap());
}
