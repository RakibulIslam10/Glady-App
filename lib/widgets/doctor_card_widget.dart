import '../core/utils/basic_import.dart';

class DoctorCardWidget extends StatelessWidget {
  final String imageUrl;
  final String rating;
  final String name;
  final String profession;
  final String hospital;
  final VoidCallback? onTap;
  final double? height;

  const DoctorCardWidget({
    super.key,
    required this.imageUrl,
    required this.rating,
    required this.name,
    required this.profession,
    required this.hospital,
     this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 175.w,
        height: height,
        margin: EdgeInsets.only(right: Dimensions.widthSize),
        decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          border: Border.all(
            color: CustomColors.disableColor.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageSection(),
            Space.height.v5,
            _text(
              name,
              fontSize: Dimensions.titleLarge * 0.85,
              fontWeight: FontWeight.w600,
            ),
            _text(
              profession,
              color: CustomColors.blackColor.withOpacity(0.7),
            ),
            _text(
              hospital,
              color: CustomColors.blackColor.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageSection() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(Dimensions.radius * 2),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            height: 150.h,
            width: double.infinity,
            fit: BoxFit.cover,
            errorWidget: (_, __, ___) => Icon(
              Icons.error_outline,
              color: CustomColors.rejected,
            ),
          ),
          Positioned(
            right: 10.w,
            top: 10.h,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.widthSize * 0.8,
                vertical: Dimensions.heightSize * 0.2,
              ),
              decoration: BoxDecoration(
                color: CustomColors.whiteColor,
                borderRadius: BorderRadius.circular(
                  Dimensions.radius * 1.5,
                ),
              ),
              child: Wrap(
                spacing: Dimensions.widthSize * 0.25,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: Dimensions.iconSizeDefault,
                  ),
                  TextWidget(
                    rating,
                    fontSize: Dimensions.titleSmall * 0.9,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _text(
      String text, {
        double? fontSize,
        FontWeight? fontWeight,
        Color? color,
      }) {
    return TextWidget(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize * 0.6,
      ),
      text,
      maxLines: 1,
      textOverflow: TextOverflow.ellipsis,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color,
    );
  }
}
