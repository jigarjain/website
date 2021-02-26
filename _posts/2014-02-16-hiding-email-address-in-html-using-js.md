---
layout: post
title: Hiding email address in HTML using JS
---

> Archived from old blog

In one of my projects, I had to display the contact details & email address of the user on a html web page but making sure that the automated bots couldn’t scrape those details.
Following is the method which I adopted to hide such personal details from those dirty email harvester bots.
The technique is simple since we will only be reversing the string and store it in JS variable. Inside the document.ready() function we would then write the reverse string backwards into the html.

In the view(.php) file, we would declare a JS variable which will store the personal data like email by reversing it.

```javascript

var rev_email = <?= strrev($email) ?>;

```

Now comes the little tricky part where we have to actually print the reversed email address stored in `email` variable forward. This can be done as below

``` javascript

var email = rev_email.split("").reverse().join("");
$("span.contact_detail").html(email);

```

Now this hack is good to prevent the email addresses from been harvested only by the small bots since the email address is inserted into DOM by JS. From the stories I have heard so far, there are big monsters out there who can easily sniff the email address even after this hack.

I would love to hear which other methods you have came across or implemented to win the fight against those email harvesters out there.

