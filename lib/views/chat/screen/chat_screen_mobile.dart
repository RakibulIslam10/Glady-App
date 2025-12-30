import 'package:glady/core/widgets/profile_avater_widget.dart';
import '../../../core/utils/basic_import.dart';
import '../controller/chat_controller.dart';

class ChatScreenMobile extends StatelessWidget {
  ChatScreenMobile({super.key});

  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Chat',isBack: false,),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
          ),
          itemCount: 10 + 1,
          addRepaintBoundaries: true,
          cacheExtent: 500,
          shrinkWrap: true,
          primary: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                margin: EdgeInsets.only(
                  bottom: Dimensions.heightSize * 2,
                  top: Dimensions.heightSize,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.borderColor),
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultHorizontalSize,
                  vertical: Dimensions.verticalSize * 0.5,
                ),
                child: Row(
                  children: [
                    Icon(Icons.search_rounded, color: CustomColors.primary),
                    Space.width.v5,
                    TextWidget(
                      "Search",
                      color: CustomColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              );
            }
            return Container(
              margin: EdgeInsets.only(bottom: Dimensions.heightSize),
              decoration: BoxDecoration(
                border: Border.all(color: CustomColors.borderColor.withOpacity(0.8)),
                borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
              ),
              child: ListTile(
                onTap: () {
                  Get.toNamed(
                    Routes.inboxScreen,
                    // parameters: {
                    //   'receiverId': participant.id,
                    //   'avatar': participant.profileImage ?? '',
                    //   'name': participant.name,
                    // },
                  );
                },

                leading: ProfileAvatarWidget(
                  imageUrl:
                      'https://raw.githubusercontent.com/ai-py-auto/souce/refs/heads/main/Rectangle%202.png',
                ),
                title: TextWidget('Luna Kellan'),
                subtitle: Text("sent you a message"),
                trailing: TextWidget(
                  '11.15 pm',
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.titleSmall,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
