From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 46731] New: difftime(3) may suggest that time_t can be a
 non-arithmetic type
Date: Thu, 30 Aug 2012 19:25:09 +0000 (UTC)
Message-ID: <bug-46731-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=46731

           Summary: difftime(3) may suggest that time_t can be a
                    non-arithmetic type
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: mgorny-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org
        Regression: No


Created an attachment (id=78851)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=78851)
Patch changing the wording to the more exact problem

The difftime(3) manpage[1] states:

NOTES
       On a POSIX system, time_t is an arithmetic type, and one could just
define

              #define difftime(t1,t0) (double)(t1 - t0)

       when the possible overflow in the subtraction is not a concern.  On
other
       systems, the data type time_t might use some other encoding where
       subtraction doesn't work directly.

---

When I first read this, I got confused that time_t may actually be a
non-arithmetic type. But the C99 standard explicitly lists (in 7.23.1):

3   The types declared are size_t (described in 7.17); clock_t and time_t which
    are arithmetic types capable of representing times

---

I think that particular paragraphs should be re-worked to explicitly state what
differences can arise in time_t implementations and what is the reason that
they can't be used to compute time differences. As far as I understand, the
only issue is that time_t can express time in units other than seconds.

I'm attaching a patch with my wording for that.

[1]:http://man7.org/linux/man-pages/man3/difftime.3.html

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
