# ChatEvent - flutter create competition

ChatEvent lets you to open an event oriented chat, that will end in the end of the event.

**Notice**: Please use **dartmft** - I minified the files, so I can manage the 5kb limit for this app.

**Notice**: Please watch the attached video - a demo pass through this app: [video](https://youtu.be/RNYnCfriXrw)

## My Personal Challenge:
* I stumbled across Flutter Three days ago, during a YouTube exploration, when suddenly 
I saw the Flutter create challenge, and got excited - To learn a new platform, a new language AND 
submit an App under 5kb? True gold.
* The only problem was that I have about three days for this challenge, because I only heard about 
it three days ago, and tomorrow I'm traveling with my boyfriend to Switzerland!
* So three days ago I started to learn dart, by reading through the documentations, 
then learned Flutter by reading the documentation I thought I need, doing the first app tutorial, 
and watching all of "widget of the week" videos in YouTube.
* Then, I started planning my app (I got the idea from my bf), the screens, 
and started watching and reading tutorials on, for example, WhatsApp/iMessage-like apps and
 the DateTimePicker widget, and implemented the app, where I told myself that today is my personal 
 deadline (can't bring it to my vacation), so... that's it, what I managed to implement is what I sent.

## The Problem I Tried to Solve:
* Many time, we all have an event, fallowed by some group chat over WhatsApp/iMessage about it, 
like a family reunion.
* Most times, the group chat starts long before the event itself, and even after the event is over, 
people still sending messages, and you afraid to leave the chat, not to offend someone.

## The Solution:
* ChatEvent is an app, that combines scheduling an event, and starting a group chat. 
Once the event is over, the chat delete itself.

## I'm Proudest at:
* The action button's icon, I created it as a combination of the chat and the calendar icons 
from the material design icons. I think it capture the app concept itself.


## Why You Shouldn't Choose Me:
* This is just a skeleton of thee app, the app's value isn't passing through well here.
* It's larger then 5KB - it's 5.5 minimized.

## Why You Should Choose Me:
* The Idea is cool, and with a bit more space, I could have built it to be awesome!

## Future Work:
If I had more time and could use more then 5kb, I would have implemented:
* Google login - I saw a package that handle this, with FireBase.
* Save state of the chats in a FireBase database via messaging. I saw a YouTube video on it, pretty nifty.
* Dynamic data and creating a new ChatEvent.
* Fit the app to iOS using Cupertino - I don't have one, and it would scientifically increase the 
size of the app.
* SearchBar and Settings are not implemented.

## Some suggestions
During my exploration of the Flutter platform and the challenge, I stumbled across a few issues,
that will be great to fix:
* ClipRRect and Future widgets - I didn't manage to get ClipRRect to work with DateTimePicker for example,
even due it took it as a child widget - I suggests either to support it, 
or to throw an error if it dosen't support it.
* I saw in the keynote that you built in VScode a suggestion engine (https://youtu.be/ai5lnhaGm8U), 
that automatically wraps the widget with another widget - It will be great to see something like 
that on Android Studio.
* The hard 5kb limit - should be flexible to up to 10kb - the flutter code is lean, but this too small.
* Lake of Support - The challenge participants didn't have a direct way to contact the flutter team with questions,
I tried to reach out via twitter, github and gitter, with no answer. If your asking people to participate,
it is saying something if your there for the community, I know of a few friends that gave up because of that,
and it's just a same for us.
* Other then this - Great Challenge! you managed to piqued my interest and I learned Flutter and dart 
due to the challenge, so THANKS!