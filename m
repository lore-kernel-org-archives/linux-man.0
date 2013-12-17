From: Janne Blomqvist <blomqvist.janne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Clarification for mkostemp/mkostemps man page
Date: Tue, 17 Dec 2013 09:56:35 +0200
Message-ID: <CAO9iq9FDnF+VmDq-vtrSC-kYXf+t12EmOrJDEWdGTOqN2vX-xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

currently the man page for mkostemp/mkostemps says

"""The mkostemp() function is like mkstemp(), with the difference that
flags as for open(2) may be specified in flags (e.g., O_APPEND,
O_SYNC)."""

To be more precise, the implementation massages the flags argument as follows:

(flags & ~O_ACCMODE) | O_RDWR | O_CREAT | O_EXCL

That is, there is no need to explicitly include O_RDWR | O_CREAT |
O_EXCL in flags, as it's added implicitly.

So I suggest that the manpage should instead state that *additional*
flags may be specified in the flags argument.

This issue is a potential portability problem. FreeBSD 10+ also has
mkostemp{s}, but generates an error if O_RDWR | O_CREAT | O_EXCL is
present instead of silently accepting it. While annoying, this
difference in behavior seems Ok by the proposed addition of mkostemp
to some future POSIX standard, see

http://austingroupbugs.net/view.php?id=411

"""
The mkostemp( ) function shall be equivalent to the mkstemp( )
function, except that the flag argument may contain additional flags
(from <fcntl.h>) to be used as if by open( ). Behavior is unspecified
if the flag argument contains more than the following flags:

O_APPEND Set append mode.

O_CLOEXEC Set the FD_CLOEXEC file descriptor flag.

<SIO>O_DSYNC Write according to the synchronized I/O data integrity
completion.</SIO>

<SIO>O_RSYNC Synchronized read I/O operations.</SIO>

<XSI|SIO>O_SYNC Write according to synchronized I/O file integrity
completion.</XSI|SIO>
"""

-- 
Janne Blomqvist
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
