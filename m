From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] inotify.7: BUGS fallocate fixed
Date: Thu, 30 Apr 2015 12:13:29 +0200
Message-ID: <55420049.8020100@gmail.com>
References: <1430169995-23006-1-git-send-email-xypron.glpk@gmx.de> <1430169995-23006-2-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430169995-23006-2-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Heinrich,

On 04/27/2015 11:26 PM, Heinrich Schuchardt wrote:
> Since Linux 3.19 (820c12d5d6c0890bc93dd63893924a13041fdc35)
> fallocate.2 creates FAN_MODIFY and IN_MODIFY events.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/inotify.7 | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/man7/inotify.7 b/man7/inotify.7
> index 3742bb8..ec62d16 100644
> --- a/man7/inotify.7
> +++ b/man7/inotify.7
> @@ -752,10 +752,6 @@ and also the possibility that there may not be any
>  .B IN_MOVED_TO
>  event.
>  .SH BUGS
> -As of kernel 3.17, calling
> -.BR fallocate (2)
> -does not create any inotify events.
> -
>  .\" FIXME . kernel commit 611da04f7a31b2208e838be55a42c7a1310ae321
>  .\" implies that unmount events were buggy 2.6.11 to 2.6.36
>  .\"

Thanks. I instead applied the patch below, so as to preserve the historical
details.

Cheers,

Michael

--- a/man7/inotify.7
+++ b/man7/inotify.7
@@ -752,9 +752,16 @@ and also the possibility that there may not be any
 .B IN_MOVED_TO
 event.
 .SH BUGS
-As of kernel 3.17, calling
+Before Linux 3.19,
 .BR fallocate (2)
-does not create any inotify events.
+did not create any inotify events.
+Since Linux 3.19,
+.\" commit 820c12d5d6c0890bc93dd63893924a13041fdc35
+calls to
+.BR fallocate (2)
+generate
+.B IN_MODIFY
+events.
 
 .\" FIXME . kernel commit 611da04f7a31b2208e838be55a42c7a1310ae321
 .\" implies that unmount events were buggy 2.6.11 to 2.6.36



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
