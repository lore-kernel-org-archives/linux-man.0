From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] proc.5: Correct polling of mounts via select()
Date: Wed, 18 May 2016 22:36:47 +0200
Message-ID: <720c6f70-9320-2be7-7c98-fe57e7537db2@gmail.com>
References: <ffc3f500-cd85-0895-6ff5-6efce2254998@aim.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ffc3f500-cd85-0895-6ff5-6efce2254998-CZK690njTpI@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Nagl <simonnagl-CZK690njTpI@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Simon,

On 05/08/2016 07:04 PM, Simon Nagl wrote:
> Hello mkt,
> 
> I tried to poll for changes of /proc/mounts via select().
> 
> This does not work as expected. I found more inforamtion on stackoverflow.
> 
> http://stackoverflow.com/questions/5070801/monitoring-mount-point-changes-via-proc-mounts
>
> From 41d047b5df0dc759be621d0af1e45e5b6fba0028 Mon Sep 17 00:00:00 2001
> From: Simon Nagl <simonnagl-CZK690njTpI@public.gmane.org>
> Date: Sun, 8 May 2016 18:49:36 +0200
> Subject: [PATCH] proc.5: Correct polling of mounts via select()
> 
> Change of mounts can be polled with select via exceptfds, not readfds.
> ---
>  man5/proc.5 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index cb85b9b..a377d06 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -47,6 +47,7 @@
>  .\"     and /proc/[pid]/fdinfo/*.
>  .\" 2008-06-19, mtk, Documented /proc/[pid]/status.
>  .\" 2008-07-15, mtk, added /proc/config.gz
> +.\" 2016-05-08, Simon Nagl (simonnagl-CZK690njTpI@public.gmane.org), corrected
> /proc/[pid]/mounts
>  .\"
>  .\" FIXME . cross check against Documentation/filesystems/proc.txt
>  .\" to see what information could be imported from that file
> @@ -1186,7 +1187,7 @@ Since kernel version 2.6.15, this file is pollable:
>  after opening the file for reading, a change in this file
>  (i.e., a filesystem mount or unmount) causes
>  .BR select (2)
> -to mark the file descriptor as readable, and
> +to mark the file descriptor as an exception, and
>  .BR poll (2)
>  and
>  .BR epoll_wait (2)

Thanks for this report. I applied a somewhat more detailed patch, as below.

Cheers,

Michael

diff --git a/man7/namespaces.7 b/man7/namespaces.7
index a736711..3de8f5f 100644
--- a/man7/namespaces.7
+++ b/man7/namespaces.7
@@ -297,11 +297,20 @@ Since kernel version 2.6.15, this file is pollable:
 after opening the file for reading, a change in this file
 (i.e., a filesystem mount or unmount) causes
 .BR select (2)
-to mark the file descriptor as readable, and
+to mark the file descriptor as having an exceptional condition, and
 .BR poll (2)
 and
 .BR epoll_wait (2)
-mark the file as having an error condition.
+mark the file as having a priority event
+.RB ( POLLPRI ).
+(Before Linux 2.6.30,
+a change in this file was indicated by the file descriptor
+being marked as readable for
+.BR select (2),
+and being marked as having an error condition for
+.BR poll (2)
+and
+.BR epoll_wait (2).)
 
 The
 .IR /proc/[pid]/mountstats



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
