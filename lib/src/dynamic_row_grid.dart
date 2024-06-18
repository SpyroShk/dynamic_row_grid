part of '../dynamic_row_grid.dart';

/// A widget that creates a dynamic, responsive grid layout.
class DynamicRowGrid extends StatelessWidget {
  /// Creates a [DynamicRowGrid] widget.
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

  /// The total number of items in the grid.
  final int itemCount;

  /// A builder function to create each item in the grid.
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// The number of items in each row.
  final int crossAxisCount;

  /// The physics for the scrollable grid.
  final ScrollPhysics? physics;

  /// Whether the grid should shrink-wrap its content.
  final bool shrinkWrap;

  /// The padding around the grid.
  final EdgeInsetsGeometry? padding;

  /// The controller for the scrollable grid.
  final ScrollController? controller;

  /// The alignment of items within each row.
  final AlignmentGeometry alignment;

  /// The horizontal spacing between items.
  final double horizontalSpacing;

  /// The vertical spacing between rows.
  final double verticalSpacing;

  /// The decoration for each row.
  final BoxDecoration? rowDecoration;

  /// The decoration for the entire grid.
  final BoxDecoration? gridDecoration;

  /// An optional header widget for the grid.
  final Widget? header;

  /// An optional footer widget for the grid.
  final Widget? footer;

  /// A widget to display when the grid is empty.
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
