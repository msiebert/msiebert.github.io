---
title: Thomas Was Alone in Ubuntu 16.04
tags: [games, ubuntu]
permalink: /blog/thomas-was-alone-ubuntu-1604
blurb: "Getting those rectangles jumping on Ubuntu 16.04!"
description: "Running Thomas Was Alone on Ubuntu 16.04 was not as simple as I would have thought. Here's how I got it running."
metaname: Thomas Was Alone in Ubuntu 16.04
image: thomas-was-alone-ubuntu-1604/thomas-was-alone.png
---
Recently, my wife decided that she wanted to try Thomas Was Alone, a really charming indie game that's one of my favorites. So I downloaded the tar file from Humble Bundle, where I'd bought the game a couple years ago and tried to run the binary. It didn't work. Here's what I had to do to get the game running.

![Thomas Was Alone](/assets/img/thomas-was-alone-ubuntu-1604/thomas-was-alone.png)

1) At first, the game wouldn't even start cause it couldn't find some `.so` files. This was solved by installing some i386 libs:

{% highlight bash %}
sudo apt-get install libglu1-mesa:i386
sudo apt-get install libxcursor1:i386
{% endhighlight %}

2) Once the game started, there wasn't any sound. Thomas Was Alone is, in my opinion, primarily a good game because of its soundscape and narration, so this was an essential fix:

{% highlight bash %}
sudo apt-get install libpulse0:i386
{% endhighlight %}

3) When we actually stared playing, the narration was silent. After digging around for a moment, I found that the game settings had defaulted the vocal noise level to -41%, and all it took was changing the setting to a positive number.

That's it! Now you can enjoy a couple of hours of helping Thomas and his friends move "predominantly up and to the right."

PS: As a bonus, here's the script I used to make an Ubuntu desktop file for the game:

{% highlight bash %}
sudo mkdir /opt/thomas-was-alone
sudo chown -R YOUR_USER:YOUR_USER /opt/thomas-was-alone
mv thomaswasalone-linux-1369349552.tar /opt/thomas-was-alone/
cd /opt/thomas-was-alone
tar xf thomaswasalone-linux-1369349552.tar
cd thomasLinuxStandalone
mv * ../
cd ..
rm -fr thomasLinuxStandalone
chmod +x thomasWasAlone

wget {{site.domain}}assets/img/thomas-was-alone-ubuntu-1604/thomas.png -O thomas.png

cat > ~/.local/share/applications/thomaswasalone.desktop <<EOL
[Desktop Entry]
Version=1.0
Name=Thomas Was Alone
Comment=Play Thomas Was Alone
Exec=/opt/thomas-was-alone/thomasWasAlone
Icon=/opt/thomas-was-alone/thomas.png
Terminal=false
Type=Application
Categories=Games;
EOL

{% endhighlight %}

After that, you'll just need to log out and log back in and you'll be able to launch Thomas Was Alone from your launcher!
