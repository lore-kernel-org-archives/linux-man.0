From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: IEEE/TOG grant permission to distribute POSIX.1-2013 man pages for
 Linux
Date: Wed, 22 Jan 2014 16:56:48 +0100
Message-ID: <52DFEA40.8020305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrew Josey <ajosey-7882/jkIBncuagvECLh61g@public.gmane.org>, Felix Janda <felix.janda-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

The manual pages produced by the Linux man-pages project attempt
to document deviations between Linux behavior and the POSIX.1 standard.
However, the pages are no substitute for the standard itself.

In 2004, the IEEE and The Open Group decided to grant permission to the 
Linux man-pages project to distribute parts of the then-current version
of POSIX.1 in manual page format. That decision provided an extremely
valuable resource for Linux programmers who wanted to write applications
that are portable across UNIX systems. Evidence of that value has been
demonstrated by regular requests in the last few years that the project
should update its copy of the POSIX manual pages to the latest
version provided by The Austin Group (the umbrella group that works
on development of the POSIX.1 standard).

We are pleased to announce that, once again, the IEEE and The Open Group
have kindly granted us permission to distribute extracts from the 
latest version of the POSIX.1 standard:

    IEEE Std 1003.1, 2013 Edition, Standard for Information 
    Technology--Portable Operating System Interface (POSIX), 
    The Open Group Base Specifications Issue 7, 
    Copyright (C) 2013 by the Institute of Electrical and 
    Electronics Engineers, Inc and The Open Group.

(For those curious about the "2013" designation, this is
POSIX.1-2008 with the 2013 Technical Corrigendum 1 applied.) 

Thanks to some excellent scripting work by Felix Janda, the source 
files supplied by IEEE and The Open Group have been cleanly converted 
to  "man" format. The result is that portions of the standard are now
made available for easy reference  as (1139!) manual pages. Those 
pages are divided into three sections:

    Section 0p = POSIX headers (specifications for header files)
    Section 1p = POSIX utilities (i.e., specifications shell commands)
    Section 3p = POSIX functions (specifications for functions)

Tarballs containing the pages can be found at
https://www.kernel.org/pub/linux/docs/man-pages/man-pages-posix/man-pages-posix-2013-a.tar.gz
and
https://www.kernel.org/pub/linux/docs/man-pages/man-pages-posix/man-pages-posix-2013-a.tar.xz

Please note that all pages carry the following disclaimer:

    In the event of any discrepancy between this version and the original 
    IEEE and The Open Group Standard, the original IEEE and The Open 
    Group Standard is the referee document. The original Standard can 
    be obtained online at http://www.unix.org/online.html .

    Any typographical or formatting errors that appear in this page are
    most likely to have been introduced during the conversion of the 
    source files to man page format. To report such errors, see 
    https://www.kernel.org/doc/man-pages/reporting_bugs.html .

Thanks,

Michael

--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
