From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 104511]
 New:=?UTF-8?Q?=20Add=20=E2=80=9Clocale=20=2Dc=20charmap=E2=80=9D=20as=20an=20example=20to=20locale?=(1)
Date: Mon, 14 Sep 2015 09:41:25 +0000
Message-ID: <bug-104511-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D104511

            Bug ID: 104511
           Summary: Add =E2=80=9Clocale -c charmap=E2=80=9D as an examp=
le to locale(1)
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

This prints =E2=80=9CLC_CTYPE=E2=80=9D followed by the name of the char=
set.  This is often
quite useful information, and there does not seem to be another conveni=
ent way
to get this information from the shell.  It's also not apparent how to =
get this
information from locale(1).

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
