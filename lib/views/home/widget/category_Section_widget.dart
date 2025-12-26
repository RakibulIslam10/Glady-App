part of '../screen/home_screen.dart';

class CategorySectionWidget extends GetView<HomeController> {
  const CategorySectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.defaultHorizontalSize),
      height: 120.h,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.widthSize,
            vertical: Dimensions.verticalSize * 0.4,
          ),
          margin: EdgeInsets.only(right: Dimensions.widthSize),
          decoration: BoxDecoration(
            color: Color(0xffF8F8F8),
            border: Border.all(
              color: CustomColors.disableColor.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius * 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://www.iconpacks.net/icons/2/free-medicine-icon-3193-thumb.png',
                height: 35.h,
                color: CustomColors.primary,
                errorWidget: (context, url, error) =>
                    Icon(Icons.error_outline, color: CustomColors.rejected),
              ),

              Space.height.v10,
              TextWidget(
                "Medicine",
                fontSize: Dimensions.titleLarge,
                color: CustomColors.primary,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
