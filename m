From: Archie Cobbs <archie.cobbs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Issue with asprintf()
Date: Mon, 11 May 2015 17:46:10 -0500
Message-ID: <CANSoFxs8XW6Z7ph2Uy1wFdeQPOGb7zvwJKExSLoUrMQ94b-8XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk-manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

There seems to be an issue with the asprintf() man page and underlying
implementation (I'm using openSUSE 13.1 - man-pages-3.53).

Since asprintf() is not POSIX, the man page effectively becomes the
specification of its behavior. The man page says:

    If memory allocation wasn't possible, or some other error occurs,
these functions will return -1, and the contents of strp is undefined.

The problem is that:

  o What actually happens is that the contents of strp are
_unmodified_ (not _undefined_)
  o There is critical code out there that depends on this undocumented
behavior (e.g., systemd)
  o Maintainers of that critical code don't believe their code doing
anything wrong (https://bugs.freedesktop.org/show_bug.cgi?id=90017)

This is a great way to create a security hole five years from now,
when someone optimizes asprintf() so that it actually does clobber
strp on error.

One argument says well, Leonnard is just wrong .. but let's not
restart that debate here :)

On the other hand, he has a good point: a much simpler fix, which
would make life easier for programmers everywhere, would be to change
the specified behavior from undefined -> unmodified, because this
allows the caller to initialize strp to NULL and get back a
free()'able value no matter what.

So... is is possible to tighten the "undefined" to be "unmodified" and
reflect reality?

FWIW, FreeBSD sets *strp to null on error, which is even nicer for the
programmer.

-Archie

-- 
Archie L. Cobbs
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
