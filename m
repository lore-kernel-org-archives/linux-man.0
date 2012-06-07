From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] typo and formating fixes
Date: Fri, 8 Jun 2012 00:25:05 +1200
Message-ID: <CAKgNAkii+cWHiQVQAx4LqMEWd3XGHrFyddk86q=sRKqWBWCD0Q@mail.gmail.com>
References: <CALhU9t=Wyy7EaMAHSFJ7BATu4UdO=PsZgnsKYDa1sN-8+e4t+Q@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9t=Wyy7EaMAHSFJ7BATu4UdO=PsZgnsKYDa1sN-8+e4t+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Akihiro,

On Sat, Jun 2, 2012 at 4:19 AM, Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> Here is a typo and formating fixes against man-pages 3.41.
> --
> Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

It's a little easier for me for review purposes if you put the patch
inline. (By all means *also* attach it, if you think your mailer will
break things.) Also, I'd prefer to split out the formatting fixes and
the spelling fixes into two separate matches.

Anyway, thanks for spotting all of these, and for your patch (which
I've quoted below). I applied all of the changes for 3.42.

Cheers,

Michael

diff --git a/man2/open.2 b/man2/open.2
index 7fe6602..ad318b1 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -776,7 +776,7 @@ I/Os should never be run concurrently with the
 system call,
 if the memory buffer is a private mapping
 (i.e., any mapping created with the
-.BR mmap(2)
+.BR mmap (2)
 .BR MAP_PRIVATE
 flag;
 this includes memory allocated on the heap and statically allocated buffers).
@@ -799,7 +799,7 @@ flag.
 Nor does this restriction apply when the memory buffer has been advised as
 .B MADV_DONTFORK
 with
-.BR madvise(2),
+.BR madvise (2),
 ensuring that it will not be available
 to the child after
 .BR fork (2).
diff --git a/man2/select.2 b/man2/select.2
index ff78008..394a9f6 100644
--- a/man2/select.2
+++ b/man2/select.2
@@ -417,7 +417,7 @@ The
 interface described in this page is implemented by glibc.
 The underlying Linux system call is named
 .BR pselect6 ().
-This system call has somewhat different behavior from the gibc
+This system call has somewhat different behavior from the glibc
 wrapper function.

 The Linux
@@ -436,7 +436,7 @@ argument;
 this is the behavior required by POSIX.1-2001.

 The final argument of the
-.BR pselect6()
+.BR pselect6 ()
 system call is not a
 .I "sigset_t\ *"
 pointer, but is instead a structure of the form:
diff --git a/man3/aio_cancel.3 b/man3/aio_cancel.3
index 8b80275..c800075 100644
--- a/man3/aio_cancel.3
+++ b/man3/aio_cancel.3
@@ -104,7 +104,7 @@ The cause of the error can be found by inspecting
 is not a valid file descriptor.
 .TP
 .B ENOSYS
-.BR aio_cancel()
+.BR aio_cancel ()
 is not implemented.
 .SH VERSIONS
 The
diff --git a/man3/aio_suspend.3 b/man3/aio_suspend.3
index 1215ff7..05d045d 100644
--- a/man3/aio_suspend.3
+++ b/man3/aio_suspend.3
@@ -97,7 +97,7 @@ waiting for); see
 .BR signal (7).
 .TP
 .B ENOSYS
-.BR aio_suspend()
+.BR aio_suspend ()
 is not implemented.
 .SH VERSIONS
 The
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
