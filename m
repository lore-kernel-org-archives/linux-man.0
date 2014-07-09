From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 79751] New: snprintf and EOVERFLOW
Date: Wed, 09 Jul 2014 19:40:02 +0000
Message-ID: <bug-79751-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=79751

            Bug ID: 79751
           Summary: snprintf and EOVERFLOW
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org
        Regression: No

The snprintf() function has an interesting design problem. It takes a size_t
size, but returns an int. In most situations, on 64-bit machines, the former is
64-bit, but the latter is 32-bit. So it could be possible that snprintf()
filled more than 2 GB of the string, as requested, but now it can't return the
actual length written because the return value is just a 32-bit int.

Posix solves this problem
(http://pubs.opengroup.org/onlinepubs/9699919799/functions/snprintf.html) by
mandating that though snprintf's size parameter is size_t, snprintf should
check if size > INT_MAX (2^31-1), and if it is, snprintf should fail with
errno=EOVERFLOW. The interesting thing, not mentioned in the Linux printf(3)
manual page, is that glibc's snprintf() (and also gcc's builtin snprintf())
don't actually conform with Posix on this - they allow size >= 2^31 and work as
expected, except perhaps returning wrapped-around numbers.

I don't consider this a glibc bug - I think glibc's behavior is actually quite
sensible here - for example it allows one to use "-1" as snprintf's size
parameter, aiming at (almost) no limit - and it will work on both 32- and
64-bit machines (the Posix function would work on 32-bit but outright fail on
64-bit). EOVERFLOW should happen only if we actually needed to copy more than
2^31 bytes - not if the maximum *allowed* was more than 2^31.

But I think that this corner case should be documented: It should be documented
that on machines where sizeof(int) < sizeof(size_t), when snprintf's size >=
MAX_INT, Linux's snprintf does *not* conform with Posix's decision to return
EOVERFLOW, and instead does its works normally.

I think it should also be documented what happens if the return value ends up
being > INT_MAX (this could happen regardless of whether the "size" is big or
not) - does the Linux snprintf() cause EOVERFLOW in this case, or does it
somehow ignore this error (and result in unusable wrapped return code)?

EOVERFLOW is not mentioned at all in the snprintf(3) manual page, and I believe
that it should. Come to think of it, "errno" is not mentioned at all in this
manual page....

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
