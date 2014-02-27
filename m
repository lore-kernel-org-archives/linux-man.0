From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 71211] New: Clarify /dev/urandom utility and volume
Date: Thu, 27 Feb 2014 01:40:58 +0000
Message-ID: <bug-71211-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=71211

            Bug ID: 71211
           Summary: Clarify /dev/urandom utility and volume
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: enhancement
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: bugtrackers-w/PKm97gIPRWk0Htik3J/w@public.gmane.org
        Regression: No

First, an assumption: /dev/random and /dev/urandom are good CPRNGs, and the
definition of a "good CPRNG" includes the ability to generate a theoretically
unlimited amount of random data for daily uses.

The manpage for random(4) states, in part:

> The kernel random-number generator is designed to produce a small
> amount of high-quality seed material to seed a cryptographic pseudo-
> random number generator (CPRNG). It is designed for security, not
> speed, and is poorly suited to generating large amounts of random
> data. Users should be very economical in the amount of seed material
> that they read from /dev/urandom (and /dev/random); unnecessarily
> reading large quantities of data from this device will have a
> negative impact on other users of the device.

A lot developers take this paragraph as gospel, and I believe the way it is
phrased "spooks" them into not trusting /dev/urandom as much as they should for
daily tasks. The consequence is that they instead use OpenSSL or another
user-space CPRNG instead of their kernel, or roll their own (ugh).

We should clarify what "a large amount of random data" is, what being
"economical" means, and what a "negative impact on other users of the device"
means, and provide more specific examples of where /dev/urandom is useful. 

As a sounding board, is /dev/urandom acceptable for providing random bytes to
assist with the following tasks? Assume I'm drawing 16 bytes on average,
multiple times per second.

(1) Generating numbers/nonces, etc for secure network connections
(2) Generating signed cookies or session keys for a web application
(3) Generating random numbers for use in games of chance

References/how I ended up here:
http://man7.org/linux/man-pages/man4/random.4.html
http://blog.cr.yp.to/20140205-entropy.html
http://sockpuppet.org/blog/2014/02/25/safely-generate-random-numbers/
https://bugs.ruby-lang.org/issues/9569

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
