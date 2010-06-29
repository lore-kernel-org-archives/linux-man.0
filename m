From: Paul Zimmermann <Paul.Zimmermann-/zGXu1G9BXs@public.gmane.org>
Subject: bug report: fma.3
Date: Tue, 29 Jun 2010 16:48:35 +0200
Message-ID: <E1OTc71-0007aT-IF@tarte.loria.fr>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent.Lefevre-vYW+cPY1g1pWj0EZb7rXcA@public.gmane.org
List-Id: linux-man@vger.kernel.org

       Hi,

the man page fma.3 says in release 3.22:

DESCRIPTION
       The fma() function computes x * y + z.  The result is  rounded  as  one
       ternary operation according to the current rounding mode (see fenv(3)).

However, this is wrong on most current architectures (which do not have a
hardware fma). See http://sourceware.org/bugzilla/show_bug.cgi?id=3268.

Since glibc bug #3268 is still unresolved after 4 years, it would be good to
mention on the man page that fma() might return (x*y)+z with two roundings.

Paul Zimmermann

PS: I am using Fedora 12.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
