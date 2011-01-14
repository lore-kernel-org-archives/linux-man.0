From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 26762] New: io_cancel manpage documented required headers are
 incomplete/wrong
Date: Fri, 14 Jan 2011 23:16:45 GMT
Message-ID: <bug-26762-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D26762

           Summary: io_cancel manpage documented required headers are
                    incomplete/wrong
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
        ReportedBy: yanegomi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


io_cancel(2) claims:

IO_CANCEL(2)               Linux Programmer=E2=80=99s Manual           =
   IO_CANCEL(2)

NAME
       io_cancel - cancel an outstanding asynchronous I/O operation

SYNOPSIS
       #include <libaio.h>

       int io_cancel(aio_context_t ctx_id, struct iocb *iocb,
                     struct io_event *result);

       Link with -laio.

This doesn't compile though:

$ gcc -c test_iocancel.c
test_iocancel.c: In function =E2=80=98main=E2=80=99:
test_iocancel.c:5: error: =E2=80=98aio_context_t=E2=80=99 undeclared (f=
irst use in this
function)
test_iocancel.c:5: error: (Each undeclared identifier is reported only =
once
test_iocancel.c:5: error: for each function it appears in.)
test_iocancel.c:5: error: expected =E2=80=98;=E2=80=99 before =E2=80=98=
ctx=E2=80=99
test_iocancel.c:9: error: =E2=80=98ctx=E2=80=99 undeclared (first use i=
n this function)
$ cat test_iocancel.c=20
#include <libaio.h>
int
main(void)
{
    aio_context_t ctx;
    struct iocb cb;
    struct io_event res;

    return io_cancel(ctx, &cb, &res);
}
$ grep -r aio_context_t /usr/include/
/usr/include/linux/aio_abi.h:typedef unsigned long    aio_context_t;
$

The manpages are based off of Fedora 13, as is the image that I'm curre=
ntly
running in VMware fusion.

$ yum list installed libaio
Loaded plugins: presto, refresh-packagekit
Installed Packages
libaio.i686                 0.3.109-2.fc13               =20
@released/$releasever

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
