From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 115721] New: rtnetlink(7) / RTM_GETROUTE specifies incorrect
 structure
Date: Fri, 01 Apr 2016 10:40:33 +0000
Message-ID: <bug-115721-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=115721

            Bug ID: 115721
           Summary: rtnetlink(7) / RTM_GETROUTE specifies incorrect
                    structure
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: dacut-YzQ35w7zxAfYtjvyW6yDsg@public.gmane.org
        Regression: No

The current manpage for rtnetlink(7) states:

RTM_NEWROUTE, RTM_DELROUTE, RTM_GETROUTE
  Create, remove or receive information about a network route.  These messages
contain an rtmsg structure with an optional sequence of rtattr structures
following.

However, this appears to be incorrect as of this commit:
https://github.com/torvalds/linux/commit/88c5b5ce5cb57af6ca2a7cf4d5715fa320448ff9

Updated by:
https://github.com/torvalds/linux/commit/e5eca6d41f53db48edd8cf88a3f59d2c30227f8e


Prior to 88c5b5ce, the correct structure was a struct rtgenmsg (not rtmsg),
which only has the family parameter. On and after 88c5b5ce, this was changed to
struct ifinfomsg.

iproute2 shows the usage of this before and after the change:
https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/commit/?id=63338dca45135c85c7f588bd5068e6e77ff816eb

I'm not quite sure what the text should say. ifinfomsg has a number of other
fields beyond ifi_family, but they seem to be unused with this API.

Thanks.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
