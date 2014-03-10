From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: sync man page in coreutils and man-pages
Date: Mon, 10 Mar 2014 13:03:41 +0100
Message-ID: <531DAA1D.6060705@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: coreutils-mXXj517/zsQ@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jim Meyering <jim-Oxw1nKZkIVjk1uMJSBkQmQ@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

Sometime in the 20th century (before my watch), a sync(8)
page made its way into the Linux man-pages set that I maintain
(http://man7.org/linux/man-pages/man8/sync.8.html). It purportedly
documents the sync command from fileutils, which gives an idea
of its age, and the piece under notes notes some behavior of sync(2)
that ceased to be true many years ago.

The man-pages project generally focuses on only Linux kernel and
(g)libc interfaces, so this sync(8) page doesn't really belong,
and I would like to remove it. Also, I see that coreutils has a=20
sync(1) page which covers the same command. However, I see that
that page lacks some details that are in the sync(8) page. Before
I retire the sync(8) page, would you be interested to integrate=20
any of the following detail into the coreutils sync(1) page?

       The  kernel  keeps  data  in  memory to avoid doing (relatively
       slow) disk reads and writes.  This improves performance, but if
       the  computer crashes, data may be lost or the file system cor=E2=
=80=90
       rupted as a result.  sync ensures that everything in memory  is
       written to disk.

       sync  should  be  called  before  the processor is halted in an
       unusual manner (e.g., before causing a kernel panic when debug=E2=
=80=90
       ging  new  kernel  code).   In general, the processor should be
       halted using the shutdown(8) or reboot(8) or halt(8)  commands,
       which  will  attempt  to  put  the  system in a quiescent state
       before calling sync(2).  (Various implementations of these com=E2=
=80=90
       mands  exist;  consult  your documentation; on some systems one
       should not call reboot(8) and halt(8) directly.)

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
