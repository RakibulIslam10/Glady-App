import '../core/utils/basic_import.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllTap;
  final String viewAllText;
  final EdgeInsetsGeometry? padding;

  const SectionHeader({
    super.key,
    required this.title,
    this.onViewAllTap,
    this.viewAllText = "View All",
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.only(
            left: Dimensions.defaultHorizontalSize,
            right: Dimensions.defaultHorizontalSize,
            top: Dimensions.heightSize * 1.5,
            bottom: Dimensions.heightSize * 0.9,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            title,
            fontWeight: FontWeight.w700,
            fontSize: Dimensions.titleLarge * 0.9,
          ),
          TextWidget(
            viewAllText,
            onTap: onViewAllTap,
            color: CustomColors.blackColor.withOpacity(0.7),
            fontSize: Dimensions.titleLarge * 0.8,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}