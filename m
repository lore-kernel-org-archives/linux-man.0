From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] fopen.3: tfix
Date: Sat, 22 Mar 2014 08:50:03 +0100
Message-ID: <532D40AB.4030505@gmail.com>
References: <20140322112627.40281645@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140322112627.40281645-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/22/2014 08:26 AM, Yuri Kozlov wrote:
> Hello.
> 
> diff --git a/man3/fopen.3 b/man3/fopen.3
> index c01d8e9..d979df9 100644
> --- a/man3/fopen.3
> +++ b/man3/fopen.3
> @@ -137,7 +137,7 @@ or
>  operation between write and read operations on such a stream.
>  This operation may be an apparent no-op
>  (as in \fIfseek(..., 0L, SEEK_CUR)\fP
> -called for its synchronizing side effect.
> +called for its synchronizing side effect).
>  .PP
>  Opening a file in append mode (\fBa\fP as the first character of
>  .IR mode )
> 

Thanks, Yuri. Applied.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
