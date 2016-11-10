From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] quotactl.2: tfix
Date: Thu, 10 Nov 2016 20:29:09 +0100
Message-ID: <d9017321-10e3-c4c3-39b4-adfd9f94455c@gmail.com>
References: <20161110183708.GA21334@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161110183708.GA21334@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/10/2016 07:37 PM, Eugene Syromyatnikov wrote:
> ---
>  man2/quotactl.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

:-}. Thanks Eugene! Patch applied.

Cheers,

Michael


> diff --git a/man2/quotactl.2 b/man2/quotactl.2
> index d1e2d20..f9a99ab 100644
> --- a/man2/quotactl.2
> +++ b/man2/quotactl.2
> @@ -658,7 +658,7 @@ The
>  .I id
>  argument is ignored.
>  .TP
> -.BR Q_XQUOTASYNC " (since Linux 2.6.15; no-up since Linux 3.4)"
> +.BR Q_XQUOTASYNC " (since Linux 2.6.15; no-op since Linux 3.4)"
>  .\" Added in commit ee34807a65aa0c5911dc27682863afca780a003e
>  This command was an XFS quota equivalent to
>  .IR Q_SYNC ,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
