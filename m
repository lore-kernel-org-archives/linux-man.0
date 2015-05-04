From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 97721] New: signal(7) is unclear on EINTR behavior against
 disks
Date: Mon, 04 May 2015 23:04:29 +0000
Message-ID: <bug-97721-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D97721

            Bug ID: 97721
           Summary: signal(7) is unclear on EINTR behavior against disk=
s
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: sgunderson-jG/AHqQBv7lBDgjK7y7TUQ@public.gmane.org
        Regression: No

Hi,

This came up in a discussion recently; signal(7) says:

       If a blocked call to one of the following interfaces is interrup=
ted
       by a signal handler, then the call will be automatically restart=
ed
       after the signal handler returns if the SA_RESTART flag was used=
;
       otherwise the call will fail with the error EINTR:

           * read(2), readv(2), write(2), writev(2), and ioctl(2) calls=
 on
             "slow" devices.  A "slow" device is one where the I/O call=
 may
             block for an indefinite time, for example, a terminal, pip=
e, or
             socket.  (A disk is not a slow device according to this
             definition.)  If an I/O call on a slow device has already
             transferred some data by the time it is interrupted by a s=
ignal
             handler, then the call will return a success status (norma=
lly,
             the number of bytes transferred).

In other words, for "slow" devices, it's defined that you get restart o=
r EINTR
depending on SA_RESTART setting; that's fine. However, while it seems t=
he
_intention_ of the last paragraph is to say that "fast" devices never c=
an get
EINTR (always restart), it is possible to read it leaving the behavior =
of fast
devices entirely up to the reader's imagination (ie., the paragraph sim=
ply says
nothing about that). The practical behavior, to the best of my knowledg=
e, is
that these calls against filesystems on disks always restart (never EIN=
TR). I
believe this should be written out more explicitly in this section.

A different question is what counts as =E2=80=9Cfast=E2=80=9D or =E2=80=
=9Cslow=E2=80=9D in edge cases. In
particular, NFS coutns as a =E2=80=9Cfast=E2=80=9D device when mounted =
with the =E2=80=9Chard=E2=80=9D option
(the default), but not with the =E2=80=9Csoft=E2=80=9D or =E2=80=9Cintr=
=E2=80=9D options. This is documented in
nfs(5), but could maybe do with a reference. Then there's FUSE filesyst=
ems,
which seemingly always count as =E2=80=9Cslow=E2=80=9D; even simple ope=
rations can return
EINTR. I don't know if this is a bug or intentional, so one should prob=
ably
exercise caution before documenting it.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
