part of 'all_review_screen.dart';

class AllReviewScreenMobile extends GetView<AllReviewController> {
  const AllReviewScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Review and Rating"),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
            vertical: Dimensions.verticalSize,
          ),
          itemCount: 10,
          addRepaintBoundaries: true,
          cacheExtent: 500,
          shrinkWrap: true,
          primary: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(bottom: Dimensions.heightSize * 1.2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              border: Border.all(
                color: CustomColors.grayShade.withOpacity(0.15),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultHorizontalSize,
              vertical: Dimensions.verticalSize * 0.8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget('Tiago_Felipe'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 16.sp,
                          color: Color(0xFFFF9500),
                        ),
                      ),
                    ),

                    TextWidget("1 Day Ago"),
                  ],
                ),
                Space.height.v10,
                TextWidget(
                  "There are many variations of passage",
                  fontSize: Dimensions.titleLarge * 0.8,
                  maxLines: 1,
                  fontWeight: FontWeight.w600,
                ),
                TextWidget(
                  '''the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.''',
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
