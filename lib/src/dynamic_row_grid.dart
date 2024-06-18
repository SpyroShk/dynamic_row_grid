part of '../dynamic_row_grid.dart';

class DynamicRowGrid extends StatelessWidget {
  const DynamicRowGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.crossAxisCount = 3,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.controller,
    this.alignment = Alignment.center,
    this.horizontalSpacing = 8.0,
    this.verticalSpacing = 6.0,
    this.rowDecoration,
    this.gridDecoration,
    this.header,
    this.footer,
    this.emptyStateWidget,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int crossAxisCount;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;
  final AlignmentGeometry alignment;
  final double horizontalSpacing;
  final double verticalSpacing;
  final BoxDecoration? rowDecoration;
  final BoxDecoration? gridDecoration;
  final Widget? header;
  final Widget? footer;
  final Widget? emptyStateWidget;

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return emptyStateWidget ?? const SizedBox.shrink();
    }

    return Container(
      decoration: gridDecoration,
      child: ListView.builder(
        padding: padding,
        controller: controller,
        physics: physics,
        shrinkWrap: shrinkWrap,
        itemCount: (itemCount / crossAxisCount).ceil() +
            (header != null ? 1 : 0) +
            (footer != null ? 1 : 0),
        itemBuilder: (context, index) {
          if (header != null && index == 0) {
            return header!;
          } else if (footer != null &&
              index ==
                  (itemCount / crossAxisCount).ceil() +
                      (header != null ? 1 : 0)) {
            return footer!;
          } else {
            final realIndex = index - (header != null ? 1 : 0);
            return Container(
              decoration: rowDecoration,
              alignment: alignment,
              padding: EdgeInsets.symmetric(horizontal: horizontalSpacing / 2),
              margin: EdgeInsets.only(bottom: verticalSpacing),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: List.generate(
                    min(crossAxisCount, itemCount - realIndex * crossAxisCount),
                    (innerIndex) {
                      final buttonIndex =
                          realIndex * crossAxisCount + innerIndex;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontalSpacing / 2),
                        child: itemBuilder(context, buttonIndex),
                      );
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
