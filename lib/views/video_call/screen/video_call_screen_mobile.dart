part of 'video_call_screen.dart';

class VideoCallScreenMobile extends GetView<VideoCallController> {
  const VideoCallScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Obx(
              () => Container(
                color: Colors.grey.shade200,
                child:
                    controller.remoteVideoWidget.value ??
                    Center(
                      child: CircularProgressIndicator(
                        color: CustomColors.primary,
                      ),
                    ),
              ),
            ),
          ),

          Positioned(
            top: 60,
            right: 16,
            child: Obx(
              () => Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                  child:
                      controller.localVideoWidget.value ??
                      Center(
                        child: Icon(
                          Icons.person,
                          size: 40.h,
                          color: Colors.grey,
                        ),
                      ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Center(
              child: Obx(
                () => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    controller.callDuration.value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildControlButton(
                  icon: Icons.cameraswitch,
                  onTap: controller.toggleCamera,
                  backgroundColor: Colors.white.withOpacity(0.9),
                ),
                Obx(
                  () => _buildControlButton(
                    icon: controller.isMuted.value ? Icons.mic_off : Icons.mic,
                    onTap: controller.toggleMute,
                    backgroundColor: Colors.white.withOpacity(0.9),
                  ),
                ),

                Obx(
                  () => _buildControlButton(
                    icon: controller.isCameraFlipped.value
                        ? Icons.flip_camera_ios
                        : Icons.flip_camera_android,
                    onTap: controller.flipCamera,
                    backgroundColor: Colors.white.withOpacity(0.9),
                  ),
                ),

                _buildControlButton(
                  icon: Icons.call_end,
                  onTap: controller.endCall,
                  backgroundColor: Colors.red,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),

          // Connection status indicator
          Positioned(
            top: 100,
            left: 16,
            child: Obx(() {
              if (!controller.isConnected.value) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: CustomColors.primary.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 12.w,
                        height: 12.h,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.w,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            CustomColors.primary,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Connecting...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return SizedBox.shrink();
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color backgroundColor,
    Color? iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor ?? Colors.black87, size: 28.h),
      ),
    );
  }
}
