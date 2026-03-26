import 'package:glady/core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../appointment/model/join_video_call_model.dart';

class VideoCallController extends GetxController {
  late RtcEngine agoraEngine;

  String _appId = '';
  String channelName = '';
  String _token = '';

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
    final appointmentId = Get.arguments as String;
    _loadAndInitialize(appointmentId);
  }

  @override
  void onClose() {
    _durationTimer?.cancel();
    _leaveChannel();
    agoraEngine.release();
    super.onClose();
  }

  Future<void> _loadAndInitialize(String appointmentId) async {
    try {
      final result = await getVideoCallInfo(appointmentId);
      _appId = result.data.appId;
      channelName = result.data.channel;
      _token = result.data.token;
      await _initializeAgora();
    } catch (e) {
      print('Error loading video call info: $e');
      CustomSnackBar.error('Failed to load video call info');
    }
  }

  Future<void> _initializeAgora() async {
    try {
      await _requestPermissions();

      agoraEngine = createAgoraRtcEngine();

      // Doc অনুযায়ী শুধু appId দিতে হবে
      await agoraEngine.initialize(RtcEngineContext(appId: _appId));

      _setupEventHandlers();

      await agoraEngine.enableVideo();

      // Doc অনুযায়ী startPreview() নেই
      await _joinChannel();
    } catch (e) {
      print('Error initializing Agora: $e');
      CustomSnackBar.error('Failed to initialize video call');
    }
  }

  Future<void> _requestPermissions() async {
    final statuses = await [Permission.camera, Permission.microphone].request();
    if (statuses[Permission.camera] != PermissionStatus.granted ||
        statuses[Permission.microphone] != PermissionStatus.granted) {
      CustomSnackBar.error('Camera and microphone permission required');
    }
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
        onError: (ErrorCodeType err, String msg) {
          print('Agora Error: $err - $msg');
        },
      ),
    );
  }

  Future<void> _joinChannel() async {
    try {
      await agoraEngine.joinChannel(
        token: _token,
        channelId: channelName,
        uid: 0,
        options: const ChannelMediaOptions(
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
          channelProfile: ChannelProfileType.channelProfileCommunication,
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
    _durationTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
      isCameraFlipped.value = !isCameraFlipped.value;
    } catch (e) {
      print('Error toggling camera: $e');
    }
  }

  Future<void> toggleMute() async {
    try {
      isMuted.value = !isMuted.value;
      await agoraEngine.muteLocalAudioStream(isMuted.value);
    } catch (e) {
      print('Error toggling mute: $e');
    }
  }

  Future<void> flipCamera() async {
    try {
      await agoraEngine.switchCamera();
      isCameraFlipped.value = !isCameraFlipped.value;
    } catch (e) {
      print('Error flipping camera: $e');
    }
  }

  Future<void> endCall() async {
    try {
      _durationTimer?.cancel();
      await _leaveChannel();
      Get.back();
    } catch (e) {
      print('Error ending call: $e');
    }
  }

  Future<JoinVideoCallModel> getVideoCallInfo(String id) async {
    return ApiRequest().get(
      fromJson: JoinVideoCallModel.fromJson,
      endPoint: '/appointments/$id/video/token',
      isLoading: isRemoteUserJoined,
    );
  }
}
