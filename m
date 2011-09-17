From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] mlock.2: generalize EPERM description
Date: Sat, 17 Sep 2011 07:14:37 +0200
Message-ID: <CAKgNAkifmm7cSnWqEUvx4f3=Ok_F2mJ4ueuPFv_9N8n0XacbEw@mail.gmail.com>
References: <4E5E4BA9.8000609@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E4BA9.8000609-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Seonghun,

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: EPERM error code is not only set by munlock(), but also by other calls.
>
>
> diff --git a/man2/mlock.2 b/man2/mlock.2
> --- a/man2/mlock.2
> +++ b/man2/mlock.2
> @@ -151,8 +151,7 @@ soft resource limit was 0.
> .TP
> .B EPERM
> (Linux 2.6.8 and earlier)
> -The calling process has insufficient privilege to call
> -.BR munlockall ().
> +The calling process has insufficient privilege.
> Under Linux the
> .B CAP_IPC_LOCK
> capability is required.

Thanks for the report. Instead, I applied a simplifying patch for 3.33.

Thanks,

Michael

diff --git a/man2/mlock.2 b/man2/mlock.2
index 45f5f1d..535a7db 100644
--- a/man2/mlock.2
+++ b/man2/mlock.2
@@ -24,7 +24,7 @@
 .\" Software Foundation, Inc., 59 Temple Place, Suite 330,
 .\" Boston, MA 02111, USA.
 .\"
-.TH MLOCK 2 2010-10-30 "Linux" "Linux Programmer's Manual"
+.TH MLOCK 2 2011-09-10 "Linux" "Linux Programmer's Manual"
 .SH NAME
 mlock, munlock, mlockall, munlockall \- lock and unlock memory
 .SH SYNOPSIS
@@ -143,19 +143,9 @@ half of RAM.
 .\" pages, which of course is not true.  (MTK, Nov 04, kernel 2.4.28)
 .TP
 .B EPERM
-(Linux 2.6.9 and later) the caller was not privileged
+The caller is not privileged, but needs privilege
 .RB ( CAP_IPC_LOCK )
-and its
-.B RLIMIT_MEMLOCK
-soft resource limit was 0.
-.TP
-.B EPERM
-(Linux 2.6.8 and earlier)
-The calling process has insufficient privilege to call
-.BR munlockall ().
-Under Linux the
-.B CAP_IPC_LOCK
-capability is required.
+to perform the requested operation.
 .\"SVr4 documents an additional EAGAIN error code.
 .LP
 For

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
