From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Documenting MT-safe vs. MT-unsafe.
Date: Wed, 24 Jul 2013 21:32:25 -0400
Message-ID: <51F08029.1000403@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Peng,

The work that you are doing documenting multithreading
safety in the linux kernel man pages is excellent, and
very useful. Thank you for working on this.

Michael, Peng,

At present I am a little worried that glibc is going
to document what we want to be true e.g. MT-unsafe,
but that the linux kernel man pages project is going
to document what is actually implemented e.g. MT-safe.
This may lead users to believe functions are safe 
when they are not guaranteed to be so.

The other problem is that the two documents might
diverge and this information is very important.

What can we do to keep the two documents in sync?

When Alex completes his project we'll have MT-safety
data (with a series of exceptions) for almost all
of the glibc functions. Could we use that data to
drive the generation of the attributes in the 
linux kernel man pages?

Comments?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
