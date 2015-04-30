From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] fanotify.7: BUGS fallocate fixed
Date: Thu, 30 Apr 2015 12:12:48 +0200
Message-ID: <55420020.5010308@gmail.com>
References: <1430169995-23006-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430169995-23006-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Heinrich,

Thanks for following through on this with a man pages patch.
I actually applied a different patch. See below.

On 04/27/2015 11:26 PM, Heinrich Schuchardt wrote:
> Since Linux 3.19 (820c12d5d6c0890bc93dd63893924a13041fdc35)
> fallocate.2 creates FAN_MODIFY and IN_MODIFY events.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/fanotify.7 | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> index 83d83c0..97402e1 100644
> --- a/man7/fanotify.7
> +++ b/man7/fanotify.7
> @@ -485,7 +485,7 @@ Monitoring mounts offers the capability to monitor a whole directory tree.
>  The event queue can overflow.
>  In this case, events are lost.
>  .SH BUGS
> -As of Linux 3.17,
> +As of Linux 4.0,
>  the following bugs exist:
>  .IP * 3
>  On Linux, a filesystem object may be accessible through multiple paths,
> @@ -497,10 +497,6 @@ A listener that marked a mount will be notified only of events that were
>  triggered for a filesystem object using the same mount.
>  Any other event will pass unnoticed.
>  .IP *
> -Calling
> -.BR fallocate (2)
> -does not create any fanotify events.
> -.IP *
>  .\" FIXME . A patch was proposed.
>  When an event is generated,
>  no check is made to see whether the user ID of the

A patch that preserves the historical information is better, since both
fallocate(2) and fanotify are longstanding, and some people may be using
older kernels. I applied the patch below.

Cheers,

Michael

--- a/man7/fanotify.7
+++ b/man7/fanotify.7
@@ -485,6 +485,17 @@ Monitoring mounts offers the capability to monitor a whole directory tree.
 The event queue can overflow.
 In this case, events are lost.
 .SH BUGS
+Before Linux 3.19,
+.BR fallocate (2)
+did not generate fanotify events.
+Since Linux 3.19,
+.\" commit 820c12d5d6c0890bc93dd63893924a13041fdc35
+calls to
+.BR fallocate (2)
+generate
+.B FAN_MODIFY
+events.
+
 As of Linux 3.17,
 the following bugs exist:
 .IP * 3
@@ -497,10 +508,6 @@ A listener that marked a mount will be notified only of events that were
 triggered for a filesystem object using the same mount.
 Any other event will pass unnoticed.
 .IP *
-Calling
-.BR fallocate (2)
-does not create any fanotify events.
-.IP *
 .\" FIXME . A patch was proposed.
 When an event is generated,
 no check is made to see whether the user ID of the

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
