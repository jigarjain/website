---
layout: post
title: "DYK: jQuery event propagates from child element to parent element"
---

> Archived from old blog

If there are 2 events, one on child element & other on parent element, then the event on child element gets called first and then it propagates to the event of parent element. It’s obvious that any event on parent is also effective on its child. Check out this [fiddle](https://jsfiddle.net/H7XKB/1/) demonstrating the same.

To stop the event propagation from child to parent, you can use event.stopPropagation() method provided you are using delegated events and not direct events. Another [fiddle](https://jsfiddle.net/H7XKB/2/) shows the event.stopPropagation() method to prevent event bubbling.

For those who want to understand the difference between direct & delegated events, I will guide you to this wonderful explanation on [stackoverflow](https://stackoverflow.com/questions/8110934/direct-vs-delegated-jquery-on/8111171#8111171).


