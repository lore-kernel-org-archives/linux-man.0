From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 79411] New: poll() fd negation trick doesn't work for fd 0
Date: Wed, 02 Jul 2014 13:19:39 +0000
Message-ID: <bug-79411-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=79411

            Bug ID: 79411
           Summary: poll() fd negation trick doesn't work for fd 0
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org
        Regression: No

poll(2) contains the following paragraph:

       The  field  fd  contains  a  file descriptor for an open file.  If this
       field is negative, then the corresponding events field is  ignored  and
       the revents field returns zero.  (This provides an easy way of ignoring
       a file descriptor for a  single  poll()  call:  simply  negate  the  fd
       field.)

The negation technique described here will work with one important assumption -
that fd 0 isn't one of the polled descriptors. This will normally be the case
(fd 0 will be stdin and not be polled), but it doesn't strictly have to be this
way. I think this needs to be pointed out. Perhaps say:

        (This provides an easy way of ignoring a file descriptor for a  single 
poll()  call:  simply  negate  the  fd field. This technique will not work if
one of the polled fd is 0).

Issue discovered by Avi Kivity.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
