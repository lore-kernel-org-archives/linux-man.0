From: Maxin John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] removing EINVAL error from cacheflush() man page
Date: Thu, 7 May 2009 15:10:19 +0530
Message-ID: <9debc4410905070240w63b20e9q35e5e6d5f9c3f6e4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

The cacheflush() man page states that cacheflush() will set  EINVAL if
cache parameter is not one of ICACHE, DCACHE, or BCACHE. I have tried
to verify this behavior in linux-2.6.29.1 and observed that this check
is not implemented in the kernel. Based on this observation, I have
proposed one patch to LKML and the details are available in the below
listed URL:

http://lkml.org/lkml/2009/4/9/203

At first, this patch
(mips-cacheflush-system-call-not-returning-einval-checkpatch-fixes.patch)
 was added to the -mm tree and later dropped. Mr. Ralf Baechle and Mr.
Andrew Morton have expressed their views on why it was dropped.

Ralf Baechle :
"There is no point in checking the arguments which are being ignored anyway."

Andrew Morton:
"
> There is no point in checking the arguments which are being ignored
> anyway.
>
Well, there _is_ a point.  So that people don't write buggy userspace
which "seems" to work, but which will fail if at some time in the
future we _do_ start using the argument.  ie: for
future-compatibility.
But it's too late to fix that up now."

The reference to -EINVAL  is present from the very first release of
cacheflush() man page :
man-pages-1.10.tar.gz which was released on Jan 15  1996.
Thanks to Mr. Michael Kerrisk for providing the URL which helped me to
trace out the  history of cacheflush() man page:
ftp://ftp.win.tue.nl/pub/linux-local/manpages.archive/

Based on this, I think , we should modify the cacheflush() man page.

Signed-off-by: Maxin B. John <maxin.john-qujY0cBTTHtBDgjK7y7TUQ@public.gmane.org>
--------
diff -uNr man-pages-3.21-orig/man2/cacheflush.2 man-pages-3.21/man2/cacheflush.2
--- man-pages-3.21-orig/man2/cacheflush.2       2009-04-15
21:35:32.000000000 +0530
+++ man-pages-3.21/man2/cacheflush.2    2009-05-07 15:06:31.350544848 +0530
@@ -63,14 +63,6 @@
 to
 .I (addr+nbytes-1)
 is not accessible.
-.TP
-.B EINVAL
-.I cache
-is not one of
-.BR ICACHE ,
-.BR DCACHE ,
-or
-.BR BCACHE .
 .SH CONFORMING TO
 This Linux-specific system call is only available on MIPS based systems.
 .\" FIXME This system call was only on MIPS back in 1.2 days, but
~
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
