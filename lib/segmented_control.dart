library segmented_control;

import 'package:flutter/material.dart';

class SegmentedControl extends StatefulWidget {
  /// The count of the segments that are to be rendered on the UI
  /// accepts values in "int"
  final int segmentCount;

  /// The height of the segment control
  /// accepts values in "double"
  final double? height;

  /// The color of the unselected segment
  /// accepts values in "Color"
  final Color? segmentColor;

  /// The color of the unselected segment's text
  /// accepts values in "Color"
  final Color? textColor;

  /// The color of the entire segment control's border
  /// accepts values in "Color"
  final Color? borderColor;

  /// The border radius for the segment control
  /// accepts values in "double"
  final double? borderRadius;

  /// The values that are displayed inside each segments
  /// accepts an array of strings
  /// Ex. ['One', 'Two', 'Three']
  final List<String> segmentText;

  /// Returns the index of the selected segment when a segment is tapped
  final Function(int) onSelected;

  /// The color of the selected segment
  /// accepts values in "Color"
  final Color? selectedSegmentColor;

  /// The color of the selected segment's text
  /// accepts values in "Color"
  final Color? selectedTextColor;

  /// Constructor
  const SegmentedControl(
      {Key? key,
      required this.segmentCount,
      required this.segmentText,
      required this.onSelected,
      this.selectedTextColor = Colors.white,
      this.selectedSegmentColor = Colors.blue,
      this.height = 50,
      this.segmentColor = Colors.transparent,
      this.borderColor = Colors.black,
      this.borderRadius = 10,
      this.textColor = Colors.grey})
      : super(key: key);

  @override
  State<SegmentedControl> createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  int _selectedIndex = 0;

  /// Marks the tapped segment as the selected segment
  void onSegmentTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
        widget.onSelected(index);
      },
    );
  }

  /// Get the color of the unselected segment
  /// Returns the color of the selected and unselected segment
  Color getSegmentColor(int index) {
    if (_selectedIndex == index) {
      return widget.selectedSegmentColor!;
    }
    return widget.segmentColor!;
  }

  /// Get the color of the text inside a segment
  /// Returns the text color of the selected and unselected segments
  Color getSegmentTextColor(int index) {
    if (_selectedIndex == index) {
      return widget.selectedTextColor!;
    }
    return widget.textColor!;
  }

  // Get the border radius of the segment control
  BorderRadiusGeometry getBorderRadius(int index) {
    if (index == 0) {
      return BorderRadius.only(
        topLeft: Radius.circular(widget.borderRadius! - 2),
        bottomLeft: Radius.circular(widget.borderRadius! - 2),
      );
    } else if (index == widget.segmentCount - 1) {
      return BorderRadius.only(
        topRight: Radius.circular(widget.borderRadius! - 2),
        bottomRight: Radius.circular(widget.borderRadius! - 2),
      );
    }
    return BorderRadius.circular(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 2, color: widget.borderColor!),
          bottom: BorderSide(width: 2, color: widget.borderColor!),
          left: BorderSide(width: 2, color: widget.borderColor!),
          right: BorderSide(width: 2, color: widget.borderColor!),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(widget.borderRadius!),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.segmentCount,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => onSegmentTapped(index),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: getBorderRadius(index),
              color: getSegmentColor(index),
            ),
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                widget.segmentText[index],
                style: TextStyle(color: getSegmentTextColor(index)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
