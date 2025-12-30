part of '../screen/home_screen.dart';

class TipsCardWidget extends StatefulWidget {
  const TipsCardWidget({super.key});

  @override
  State<TipsCardWidget> createState() => _TipsCardWidgetState();
}

class _TipsCardWidgetState extends State<TipsCardWidget>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SizedBox(
      height: 140.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
        ),
        itemBuilder: (context, index) {
          return _TipsCard(
            key: ValueKey('tips_$index'),
            index: index,
          );
        },
      ),
    );
  }
}

class _TipsCard extends StatelessWidget {
  final int index;

  const _TipsCard({
    required super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.only(right: Dimensions.widthSize),
      decoration: BoxDecoration(
        color: CustomColors.secondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimensions.radius * 0.6),
          topRight: Radius.circular(Dimensions.radius * 0.6),
          topLeft: Radius.circular(Dimensions.radius * 2),
          bottomRight: Radius.circular(Dimensions.radius * 2),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize * 0.7,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextWidget(
                "Drink water regularly throughout the day to keep your body energized and functioning smoothly.",
                fontWeight: FontWeight.w600,
                color: CustomColors.whiteColor,
              ),
            ),
            const _FavoriteButton(),
          ],
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CustomColors.blackColor,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.3),
      child: Icon(
        Icons.favorite_border,
        size: Dimensions.iconSizeLarge * 0.8,
        color: CustomColors.whiteColor,
      ),
    );
  }
}