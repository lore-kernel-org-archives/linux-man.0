From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] quotactl.2: clarification regarding Q_XQUOTASYNC,
 which is present but no-op in recent kernels
Date: Thu, 10 Nov 2016 08:18:12 +0100
Message-ID: <6e6ef0f4-3835-9a39-e792-08439f97251f@gmail.com>
References: <20161109173036.GA19381@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161109173036.GA19381@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Eugene,

On 11/09/2016 06:30 PM, Eugene Syromyatnikov wrote:
> ---
>  man2/quotactl.2 |   16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)

Thanks. Applied.

Cheers,

Michael


> diff --git a/man2/quotactl.2 b/man2/quotactl.2
> index 2fc791f..c68b44f 100644
> --- a/man2/quotactl.2
> +++ b/man2/quotactl.2
> @@ -657,13 +657,17 @@ Quotas must have already been turned off.
>  The
>  .I id
>  argument is ignored.
> -.PP
> -There is no command equivalent to
> -.B Q_SYNC
> -for XFS since
> +.TP
> +.B Q_XQUOTASYNC
> +This command was an XFS quota equivalent to
> +.IR Q_SYNC ,
> +.\" 4b217ed9e30f94b6e8e5e262020ef0ceab6113af
> +but it is no-op since Linux 3.4, as
>  .BR sync (1)
> -writes quota information to disk (in addition to the other filesystem
> -metadata that it writes out).
> +writes quota information to disk now (in addition to the other filesystem
> +metadata that it writes out). The
> +.IR special ", " id " and " addr
> +arguments are ignored.
>  .SH RETURN VALUE
>  .LP
>  On success,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
