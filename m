From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] getgrent.3: Add ENOENT to error list.
Date: Wed, 10 Sep 2014 12:45:25 -0400
Message-ID: <54108025.3090500@redhat.com>
References: <54105ED1.5020206@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54105ED1.5020206-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simo Sorce <ssorce-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Hrozek <jhrozek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09/10/2014 10:23 AM, Carlos O'Donell wrote:
> Michael,
> 
> It's possible to get ENOENT returned from getgrent
> if the backend, for example say SSSD, isn't configured
> or the daemon isn't running. The same can be said of any
> of the NSS backend.
> 
> As POSIX does not list ENOENT, we can list it ourselves
> and define it how we like.
> 
> I don't know how you handle errno values that are glibc
> specific, but here is the patch that enhances getgrent
> to make users aware of what ENOENT is intended to mean
> from glibc.
> 
> Patch against master. Please apply.

While I'm fixing one I might as well fix the other.

v1
- Add ENOENT.
v2
- Add EAGAIN.

diff --git a/man3/getgrent.3 b/man3/getgrent.3
index f49c746..599b9fd 100644
--- a/man3/getgrent.3
+++ b/man3/getgrent.3
@@ -129,6 +129,11 @@ or
 .BR free (3).)
 .SH ERRORS
 .TP
+.B EAGAIN
+The service was temporarily unavailable; try again later.
+For NSS backends in glibc this indicates a temporary error talking to the backend.
+The error may correct itself, retrying later is suggested.
+.TP
 .B EINTR
 A signal was caught.
 .TP
@@ -141,6 +146,11 @@ The calling process already has too many open files.
 .B ENFILE
 Too many open files in the system.
 .TP
+.\" not in POSIX
+.B ENOENT
+A necessary input file cannot be found.
+For NSS backends in glibc this indicates the backend is not correctly configured.
+.TP
 .B ENOMEM
 .\" not in POSIX
 Insufficient memory to allocate
---

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
