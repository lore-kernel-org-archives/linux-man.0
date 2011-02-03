From: wimpunk <wimpunk-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: Error in the example of getaddrinfo
Date: Thu, 3 Feb 2011 10:39:03 +0100
Message-ID: <AANLkTinnWoSuV-oYxDMF-9yK22hpncerkEfD7R0h2YJk@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

I believe there is a bug in de client example code of getaddrinfo.  It
is in the ubuntu 10.10 man pages (Version: 3.24-1ubuntu1) and also on
http://www.kernel.org/doc/man-pages/online/pages/man3/getaddrinfo.3.html.
The 'close(sfd);' will never happen and using the code in a loop, it
will cause your system running out of filedescriptors (at least,
that's what happened to me).  To use the code cleanly, you should code
the sfd after the last printf.

Kind regards,

wimpunk.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
