import '../../../core/utils/basic_import.dart';
import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';



class VideoCallController extends GetxController {
  // Agora Configuration
  static const String appId = "296efbe76c6947018979a48113a46c7a";
  final String channelName = "test_channel";
  final String token = "007eJxTYGg6vXOV/m7Hz6JPHnsvDbqpZKp/Nu9X3/VNQrfydCYtzIpSYDCyNEtNS0o1N0s2szQxNzC0sDS3TDSxMDQ0TjQxSzZPnDw3MLMhkJFB36GNhZEBAkF8HoaS1OKS+OSMxLy81BwGBgDCGCMr";


  // Agora Engine
  late RtcEngine agoraEngine;

  // Observable states
  final RxBool isMuted = false.obs;
  final RxBool isCameraFlipped = false.obs;
  final RxBool isConnected = false.obs;
  final RxString callDuration = '00:00'.obs;
  final RxBool isLocalUserJoined = false.obs;
  final RxBool isRemoteUserJoined = false.obs;

  // User IDs
  int? localUid;
  int? remoteUid;

  // Timer for call duration
  Timer? _durationTimer;
  int _seconds = 0;

  @override
  void onInit() {
    super.onInit();
    _initializeAgora();
  }

  @override
  void onClose() {
    _durationTimer?.cancel();
    _leaveChannel();
    agoraEngine.release();
    super.onClose();
  }

  /// Initialize Agora Engine
  Future<void> _initializeAgora() async {
    try {
      // Request permissions
      await _requestPermissions();

      // Create Agora Engine
      agoraEngine = createAgoraRtcEngine();

      // Initialize
      await agoraEngine.initialize(const RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileCommunication,
      ));

      // Setup event handlers
      _setupEventHandlers();

      // Enable video
      await agoraEngine.enableVideo();
      await agoraEngine.startPreview();

      // Join channel
      await _joinChannel();

    } catch (e) {
      print('Error initializing Agora: $e');
      Get.snackbar('Error', 'Failed to initialize video call');
    }
  }

  /// Request Camera and Microphone permissions
  Future<void> _requestPermissions() async {
    await [Permission.camera, Permission.microphone].request();
  }

  /// Setup Agora Event Handlers
  void _setupEventHandlers() {
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        // Local user joined
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          print('Local user joined: ${connection.localUid}');
          localUid = connection.localUid;
          isLocalUserJoined.value = true;
          isConnected.value = true;
          _startDurationTimer();
        },

        // Remote user joined
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          print('Remote user joined: $remoteUid');
          this.remoteUid = remoteUid;
          isRemoteUserJoined.value = true;
        },

        // Remote user left
        onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
          print('Remote user left: $remoteUid');
          this.remoteUid = null;
          isRemoteUserJoined.value = false;
        },

        // Network quality
        onNetworkQuality: (RtcConnection connection, int remoteUid,
            QualityType txQuality, QualityType rxQuality) {
          // Handle network quality
          print('Network quality - TX: $txQuality, RX: $rxQuality');
        },

        // Error handling
        onError: (ErrorCodeType err, String msg) {
          print('Agora Error: $err - $msg');
        },
      ),
    );
  }

  /// Join Channel
  Future<void> _joinChannel() async {
    try {
      await agoraEngine.joinChannel(
        token: token,
        channelId: channelName,
        uid: 0, // 0 means auto-generate UID
        options: const ChannelMediaOptions(
          channelProfile: ChannelProfileType.channelProfileCommunication,
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
          publishCameraTrack: true,
          publishMicrophoneTrack: true,
        ),
      );
    } catch (e) {
      print('Error joining channel: $e');
    }
  }

  /// Leave Channel
  Future<void> _leaveChannel() async {
    try {
      await agoraEngine.leaveChannel();
      isLocalUserJoined.value = false;
      isRemoteUserJoined.value = false;
      isConnected.value = false;
    } catch (e) {
      print('Error leaving channel: $e');
    }
  }

  /// Start the call duration timer
  void _startDurationTimer() {
    _seconds = 0;
    _durationTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds++;
      final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
      final seconds = (_seconds % 60).toString().padLeft(2, '0');
      callDuration.value = '$minutes:$seconds';
    });
  }

  /// Toggle camera on/off
  Future<void> toggleCamera() async {
    try {
      bool isEnabled = !isCameraFlipped.value;
      await agoraEngine.enableLocalVideo(isEnabled);
      print('Camera ${isEnabled ? 'enabled' : 'disabled'}');
    } catch (e) {
      print('Error toggling camera: $e');
    }
  }

  /// Toggle microphone mute/unmute
  Future<void> toggleMute() async {
    try {
      isMuted.value = !isMuted.value;
      await agoraEngine.muteLocalAudioStream(isMuted.value);
      print('Microphone ${isMuted.value ? 'muted' : 'unmuted'}');
    } catch (e) {
      print('Error toggling mute: $e');
    }
  }

  /// Flip camera (front/back)
  Future<void> flipCamera() async {
    try {
      await agoraEngine.switchCamera();
      isCameraFlipped.value = !isCameraFlipped.value;
      print('Camera flipped to ${isCameraFlipped.value ? 'back' : 'front'}');
    } catch (e) {
      print('Error flipping camera: $e');
    }
  }

  /// End the call
  Future<void> endCall() async {
    try {
      _durationTimer?.cancel();
      await _leaveChannel();
      Get.back();
      print('Call ended');
    } catch (e) {
      print('Error ending call: $e');
    }
  }
}