From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fanotify.7: kernel version in BUGS section
Date: Tue, 28 Oct 2014 12:55:07 +0100
Message-ID: <544F841B.4000904@gmail.com>
References: <1414094803-3486-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414094803-3486-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Heinrich,

You sent me a version of this patch already, which
I've just before  applied.

Thanks,

Michael

On 10/23/2014 10:06 PM, Heinrich Schuchardt wrote:
> Change kernel version in BUGS section to 3.17
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/fanotify.7 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> index b6456d5..bc5a11c 100644
> --- a/man7/fanotify.7
> +++ b/man7/fanotify.7
> @@ -485,7 +485,7 @@ Monitoring mounts offers the capability to monitor a whole directory tree.
>  The event queue can overflow.
>  In this case, events are lost.
>  .SH BUGS
> -As of Linux 3.15,
> +As of Linux 3.17,
>  the following bugs exist:
>  .IP * 3
>  .\" FIXME . A patch was proposed.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
