# Pre-work - tips

tips is a tip calculator application for iOS.

Submitted by: Harshil Maskai

Time spent: 15 hours spent in total

## User Stories

The following **required** functionality is complete:
* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* 
The following **optional** features are implemented:
* [x] Settings page to change the default tip percentage.
* [x] UI animations
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Customizable percentage bar. A user can customize his/her percentage bar and do calculation accordingly
- [x] Bill splitter. Helps in splitting the calculated bill according to the number of people specified by the user.
## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://cloud.githubusercontent.com/assets/15239383/12063164/29d78b48-af67-11e5-80c4-231ae1335db2.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Challenges faced:

1) The (option+mouse drag) accidentally cloned tip label fields in the same place. 
The outlet was set only for one of them.
Setting the default value of the tip label to $0.00 did not reflect as it was overlapping with a label containing $100.00.
2) A white margin to the right and the bottom appeared as I was using the iphone 6 simulator. The issue got resolved after using the iphone 5/5s simulator(as suggested by one of codepath member)
3) UI animations

## License

    Copyright [2015] [Harshil Maskai]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
