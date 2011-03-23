From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 31752] New: pipe(2) #include <fcntl.h> is missing for the
 pipe2() function
Date: Wed, 23 Mar 2011 18:11:15 GMT
Message-ID: <bug-31752-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D31752

           Summary: pipe(2) #include <fcntl.h> is missing for the pipe2=
()
                    function
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
        ReportedBy: sebastien.wilmet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


Hello,

As explained in the title, there is a missing #include for the pipe2() =
function
in the manpage of pipe (section 2).

Indeed, we have to include fcntl.h to be able to use the flags O_NONBLO=
CK or
O_CLOEXEC.

I use Fedora 14, so it's the release 3.25. But here [1] it's not fixed =
too.

Best regards,
S=C3=A9bastien

[1] http://www.kernel.org/doc/man-pages/online/pages/man2/pipe.2.html

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
