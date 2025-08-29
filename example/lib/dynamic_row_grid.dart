// part of '../dynamic_row_grid.dart';

import 'dart:math';

import 'package:flutter/material.dart';

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
    this.gridDecoration,
    this.header,
    this.footer,
    this.emptyStateWidget,
    this.horizontalScroll = false,
  });

  /// The total number of items in the grid.
  final int itemCount;

  /// A builder function to create each item in the grid.
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// The number of items in each row while using a horizontal layout.
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

  /// The decoration for the entire grid.
  final BoxDecoration? gridDecoration;

  /// An optional header widget for the grid.
  final Widget? header;

  /// An optional footer widget for the grid.
  final Widget? footer;

  /// A widget to display when the grid is empty.
  final Widget? emptyStateWidget;

  /// A widget to enable horizontal scrolling.
  final bool horizontalScroll;

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return emptyStateWidget ?? const SizedBox.shrink();
    }

    return Container(
      decoration: gridDecoration,
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.vertical,
        padding: padding,
        physics: physics,
        child: Column(
          children: [
            if (header != null) header!,
            horizontalScroll
                ? SingleChildScrollView(
                    physics: physics,
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: alignment == Alignment.center ||
                              alignment == Alignment.bottomCenter ||
                              alignment == Alignment.topCenter
                          ? CrossAxisAlignment.center
                          : alignment == Alignment.topLeft ||
                                  alignment == Alignment.centerLeft ||
                                  alignment == Alignment.bottomLeft
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                      spacing: verticalSpacing,
                      children: List.generate(
                        (itemCount / crossAxisCount).ceil(),
                        (index) {
                          return item(index, context);
                        },
                      ),
                    ),
                  )
                : Wrap(
                    spacing: horizontalSpacing,
                    runSpacing: verticalSpacing,
                    alignment: alignment == Alignment.center ||
                            alignment == Alignment.bottomCenter ||
                            alignment == Alignment.topCenter
                        ? WrapAlignment.center
                        : alignment == Alignment.topLeft ||
                                alignment == Alignment.centerLeft ||
                                alignment == Alignment.bottomLeft
                            ? WrapAlignment.start
                            : WrapAlignment.end,
                    children: List.generate(itemCount, (buttonIndex) {
                      return itemBuilder(context, buttonIndex);
                    }).toList(),
                  ),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }

  Widget item(int realIndex, context) {
    return Row(
      spacing: horizontalSpacing,
      children: List.generate(
        min(crossAxisCount, itemCount - realIndex * crossAxisCount),
        (innerIndex) {
          final buttonIndex = realIndex * crossAxisCount + innerIndex;
          return itemBuilder(context, buttonIndex);
        },
      ),
    );
  }
}
