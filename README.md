# Pre-work - Tip Calculator

Tip Calculator is a tip calculator application for iOS.

Submitted by: David Wayman

Time spent: 34 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Added more default tip values
- [X] Created application icon
- [X] Able to add a custom tip percentage value

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![Tip Calculator Demo](tipCalcDemo_v3.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

The hardest thing about building the app was setting the user defaults and
saving the settings when switching to a different view controller. Once I
figured that out, it made being able to save the bill amount/tip/total values
easier across app restarts.

## License

    Copyright 2015 David Wayman

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
