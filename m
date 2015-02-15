From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tzset.3: add offset format
Date: Sun, 15 Feb 2015 16:56:46 +0100
Message-ID: <54E0C1BE.4060204@gmail.com>
References: <54DEAE34.5090002@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54DEAE34.5090002-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JWP <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/14/2015 03:08 AM, JWP wrote:
> tzset.3 does not illustrate the POSIX offset format.
> Specifically, there is no indication in the manual
> what the optional components of it are.

Thanks for your continued input on the page, William. Patch 
applied.

Cheers,

Michael


> Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
> ---
>  man3/tzset.3 | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index 2bc246c..cfb2d4c 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -107,8 +107,12 @@ time to get Coordinated Universal Time (UTC).
>  The \fIoffset\fP is positive
>  if the local timezone is west of the Prime Meridian and negative if it is
>  east.
> -The hour must be between 0 and 24, and the minutes and seconds
> -0 and 59.
> +The hour must be between 0 and 24, and the minutes and seconds 00 and 59:
> +.sp
> +.RS
> +.RI [ + | - ] hh [ :mm [ :ss ]]
> +.RE
> +.sp
>  .PP
>  The \fIdst\fP string and \fIoffset\fP specify the name and offset for the
>  corresponding daylight saving timezone.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
