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
            bottom: Dimensions.heightSize,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            title,
            fontWeight: FontWeight.w600,
            fontSize: Dimensions.titleLarge * 0.8,
          ),
          TextWidget(
            viewAllText,
            onTap: onViewAllTap,
            color: CustomColors.blackColor.withOpacity(0.7),
            fontSize: Dimensions.titleLarge * 0.7,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}