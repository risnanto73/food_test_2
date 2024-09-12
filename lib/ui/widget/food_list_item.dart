part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({
    super.key,
    this.food,
    this.itemWidth
  });

  final Food? food;
  final double? itemWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
