import '../../../core/utils/basic_import.dart';
import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCallController extends GetxController {
  static const String appId = "296efbe76c6947018979a48113a46c7a";
  final String channelName = "test_channel";
  final String token =
      "007eJxTYJg2iXFJ0KQzOa+XvFZjMtxm1rvH6xJH4oTShW6sp/foyxUpMBhZmqWmJaWamyWbWZqYGxhaWJpbJppYGBoaJ5qYJZsnaiQGZzYEMjKEerYzMTJAIIjPw1CSWlwSn5yRmJeXmsPAAADXPSBN";

  late RtcEngine agoraEngine;

  final RxBool isMuted = false.obs;
  final RxBool isCameraFlipped = false.obs;
  final RxBool isConnected = false.obs;
  final RxString callDuration = '00:00'.obs;
  final RxBool isLocalUserJoined = false.obs;
  final RxBool isRemoteUserJoined = false.obs;

  int? localUid;
  int? remoteUid;

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

  Future<void> _initializeAgora() async {
    try {
      await _requestPermissions();

      agoraEngine = createAgoraRtcEngine();

      await agoraEngine.initialize(
        const RtcEngineContext(
          appId: appId,
          channelProfile: ChannelProfileType.channelProfileCommunication,
        ),
      );

      _setupEventHandlers();

      await agoraEngine.enableVideo();
      await agoraEngine.startPreview();

      await _joinChannel();
    } catch (e) {
      print('Error initializing Agora: $e');
      Get.snackbar('Error', 'Failed to initialize video call');
    }
  }

  Future<void> _requestPermissions() async {
    await [Permission.camera, Permission.microphone].request();
  }

  void _setupEventHandlers() {
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          print('Local user joined: ${connection.localUid}');
          localUid = connection.localUid;
          isLocalUserJoined.value = true;
          isConnected.value = true;
          _startDurationTimer();
        },

        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          print('Remote user joined: $remoteUid');
          this.remoteUid = remoteUid;
          isRemoteUserJoined.value = true;
        },

        onUserOffline:
            (
              RtcConnection connection,
              int remoteUid,
              UserOfflineReasonType reason,
            ) {
              print('Remote user left: $remoteUid');
              this.remoteUid = null;
              isRemoteUserJoined.value = false;
            },

        onNetworkQuality:
            (
              RtcConnection connection,
              int remoteUid,
              QualityType txQuality,
              QualityType rxQuality,
            ) {
              print('Network quality - TX: $txQuality, RX: $rxQuality');
            },

        onError: (ErrorCodeType err, String msg) {
          print('Agora Error: $err - $msg');
        },
      ),
    );
  }

  Future<void> _joinChannel() async {
    try {
      await agoraEngine.joinChannel(
        token: token,
        channelId: channelName,
        uid: 0,
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

  void _startDurationTimer() {
    _seconds = 0;
    _durationTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds++;
      final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
      final seconds = (_seconds % 60).toString().padLeft(2, '0');
      callDuration.value = '$minutes:$seconds';
    });
  }

  Future<void> toggleCamera() async {
    try {
      bool isEnabled = !isCameraFlipped.value;
      await agoraEngine.enableLocalVideo(isEnabled);
      print('Camera ${isEnabled ? 'enabled' : 'disabled'}');
    } catch (e) {
      print('Error toggling camera: $e');
    }
  }

  Future<void> toggleMute() async {
    try {
      isMuted.value = !isMuted.value;
      await agoraEngine.muteLocalAudioStream(isMuted.value);
      print('Microphone ${isMuted.value ? 'muted' : 'unmuted'}');
    } catch (e) {
      print('Error toggling mute: $e');
    }
  }

  Future<void> flipCamera() async {
    try {
      await agoraEngine.switchCamera();
      isCameraFlipped.value = !isCameraFlipped.value;
      print('Camera flipped to ${isCameraFlipped.value ? 'back' : 'front'}');
    } catch (e) {
      print('Error flipping camera: $e');
    }
  }

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
