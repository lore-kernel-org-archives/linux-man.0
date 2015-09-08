From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 104221] New: strxfrm: not equivalent to strncpy
Date: Tue, 08 Sep 2015 21:08:27 +0000
Message-ID: <bug-104221-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D104221

            Bug ID: 104221
           Summary: strxfrm: not equivalent to strncpy
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        Regression: No

Version 3.81 says this:

=E2=80=9CIn the POSIX or C locales strxfrm() is equivalent to copying t=
he string with
strncpy(3).=E2=80=9D

This is a bit misleading because the behavior on truncation is unspecif=
ied for
strxfrm.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
