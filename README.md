Present your list of items into selectable customizable segments

## Features

Change border radius
Change colors of segment, text and borders
Get the index of the selected value

## Getting started

## Usage

```

body: Center(
    child: SegmentedControl(
        segmentCount: 3,
        borderRadius: 30,
        borderColor: Colors.blueAccent,
        segmentColor: Colors.white,
        selectedSegmentColor: Colors.blue,
        textColor: Colors.blue,
        selectedTextColor: Colors.white,
        segmentText: const ['One', 'Two', 'Three'],
        onSelected: (val) {
            print('value is $val');
    }),
));

```

## Additional information

https://github.com/Yashinvinz/segmented_control
