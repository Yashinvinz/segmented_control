<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Present your list of items into selectable customizable segments

## Features

Change border radius
Change colors of segment, text and borders
Get the index of the selected value

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

body: Center(
child: SegmentedControl(
segmentCount: 3,
borderRadius: 30,
borderColor: Colors.blueAccent,
segmentColor: Colors.lightBlue,
selectedSegmentColor: Colors.blue,
textColor: Colors.black38,
selectedTextColor: Colors.white,
segmentText: ['One', 'Two', 'Three'],
onSelected: (val) {
print('value is $val');
}),
));

## Additional information

https://github.com/Yashinvinz/segmented_control
