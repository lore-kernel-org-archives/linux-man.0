From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fanotify.7: double mounted paths
Date: Tue, 28 Oct 2014 13:02:12 +0100
Message-ID: <544F85C4.5070404@gmail.com>
References: <1414094958-3584-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414094958-3584-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/23/2014 10:09 PM, Heinrich Schuchardt wrote:
> Unfortunately fanotify does not inform listeners for all paths
> under which a touched file system object is visible
> but only the listener using the same path as the process
> touching the file system object.

Hi Heinrich

I applied this patch, and then did some tweaking which you 
can see in Git. I also gave the patch what I hope is a more
meaningful title:

    fanotify notifies only events generated on the same mount

Cheers,

Michael



> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/fanotify.7 | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> index bc5a11c..7f915c2 100644
> --- a/man7/fanotify.7
> +++ b/man7/fanotify.7
> @@ -488,6 +488,14 @@ In this case, events are lost.
>  As of Linux 3.17,
>  the following bugs exist:
>  .IP * 3
> +On Linux a file system object may be accessible through multiple paths,
> +e.g. a part of the file system may be remounted using
> +.B mount (8)
> +--bind.
> +A listener that marked a mount will only be notified of events that were
> +triggered for a file system object using the same mount.
> +Any other event will pass unnoticed.
> +.IP *
>  .\" FIXME . A patch was proposed.
>  When an event is generated,
>  no check is made to see whether the user ID of the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
