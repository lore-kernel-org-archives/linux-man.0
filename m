From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cciss.4: tfix
Date: Sat, 14 Jun 2014 07:39:36 +0200
Message-ID: <539BE018.3000702@gmail.com>
References: <1402721579-3971-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402721579-3971-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri. Applied.

Cheers,

Michael

On 06/14/2014 06:52 AM, Yuri Kozlov wrote:
> ---
>  man4/cciss.4 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man4/cciss.4 b/man4/cciss.4
> index 030ef69..65ce461 100644
> --- a/man4/cciss.4
> +++ b/man4/cciss.4
> @@ -329,10 +329,10 @@ The
>  .B cciss
>  driver is a block
>  driver as well as a SCSI driver and only the tape drives and medium
> -changers are presented to the SCSI midlayer
> +changers are presented to the SCSI midlayer.
>  Furthermore, unlike more
>  straightforward SCSI drivers, disk I/O continues through the block
> -side during the SCSI error-recovery process
> +side during the SCSI error-recovery process.
>  Therefore, the
>  .B cciss
>  driver implements only the first two of these actions,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
