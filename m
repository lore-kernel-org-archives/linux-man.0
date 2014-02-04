From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small improvement for fallocate.2
Date: Tue, 04 Feb 2014 10:09:35 +0100
Message-ID: <52F0AE4F.3020708@gmail.com>
References: <20140201181050.1f23f443@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140201181050.1f23f443-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Applied.

Thanks,

Michael

On 02/01/2014 03:10 PM, Yuri Kozlov wrote:
> Hello.
> 
> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> index 2afd0e8..39e1fcd 100644
> --- a/man2/fallocate.2
> +++ b/man2/fallocate.2
> @@ -56,7 +56,7 @@ is greater than the file size.
>  Any subregion within the range specified by
>  .I offset
>  and
> -.IR len .
> +.IR len ,
>  that did not contain data before the call will be initialized to zero.
>  This default behavior closely resembles the behavior of the
>  .BR posix_fallocate (3)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
