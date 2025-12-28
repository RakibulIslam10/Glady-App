enum MessageType { text, image, video, audio }

class ChatMessageModel {
  /// Core ids
  final String? id; // backend message id
  final String? roomId;
  final String? senderId;
  final String? receiverId;

  /// Content
  final String message;
  final List<String>? images;

  /// Status
  final bool isMe;
  final bool isUploading;
  final bool isSeen;

  /// Meta
  final MessageType type;
  final DateTime createdAt;

  ChatMessageModel({
    this.id,
    this.roomId,
    this.senderId,
    this.receiverId,
    required this.message,
    this.images,
    required this.isMe,
    required this.type,
    this.isUploading = false,
    this.isSeen = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // ---------------------------
  // FROM JSON (socket / API)
  // ---------------------------
  factory ChatMessageModel.fromJson(Map<String, dynamic> json, String myId) {
    return ChatMessageModel(
      id: json['id']?.toString(),
      roomId: json['room_id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      message: json['message'] ?? '',
      images: json['images'] != null
          ? List<String>.from(json['images'])
          : null,
      isMe: json['sender_id'] == myId,
      isSeen: json['is_seen'] ?? false,
      isUploading: false,
      type: _parseMessageType(json['type']),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }

  // ---------------------------
  // TO JSON (emit / API)
  // ---------------------------
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'room_id': roomId,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'message': message,
      'images': images,
      'type': type.name,
      'is_seen': isSeen,
      'created_at': createdAt.toIso8601String(),
    };
  }

  // ---------------------------
  // COPY WITH (update message)
  // ---------------------------
  ChatMessageModel copyWith({
    String? id,
    String? roomId,
    String? senderId,
    String? receiverId,
    String? message,
    List<String>? images,
    bool? isUploading,
    bool? isSeen,
    MessageType? type,
    DateTime? createdAt,
  }) {
    return ChatMessageModel(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      message: message ?? this.message,
      images: images ?? this.images,
      isMe: isMe,
      type: type ?? this.type,
      isUploading: isUploading ?? this.isUploading,
      isSeen: isSeen ?? this.isSeen,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // ---------------------------
  // MESSAGE TYPE PARSER
  // ---------------------------
  static MessageType _parseMessageType(String? value) {
    switch (value) {
      case 'image':
        return MessageType.image;
      case 'video':
        return MessageType.video;
      case 'audio':
        return MessageType.audio;
      default:
        return MessageType.text;
    }
  }
}
