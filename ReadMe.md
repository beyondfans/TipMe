# Pre-work - *TipMe*

**TipMe** is a tip calculator application for iOS.

Submitted by: **Larry Chew**

Time spent: **22** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] customizable party size and Tip percentage.
- [x] Allow user to add current entry to Records.
- [x] Records page to view stored entries.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/ow2qWos.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** [xCode is petty easy to use but more hardware restriction than Android Studio. I like the drag and map feature in storyboard to swift code editor.  It is not like Android studio that have to deal directly with xml for the constraints and variables.  My understanding of outlets and actions that it both are the keywords in Xcode use for declare variable or method between code and interface builder.]

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** [In order to avoid Strong Reference Cycles for Closures, you can declare each captured reference to be a weak or unowned reference.].

## Notes

Describe any challenges encountered while building the app.
* UI Constraints
* UserDefaults with customs Class

## License

Copyright [2017] [Larry Chew]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
