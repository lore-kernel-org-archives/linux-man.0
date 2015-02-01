From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] tzset.3: typos and version bump
Date: Sun, 01 Feb 2015 16:32:24 +0100
Message-ID: <54CE4708.3080509@gmail.com>
References: <54CE2689.7000704@gmx.com> <54CE278A.9000604@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54CE278A.9000604-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/01/2015 02:18 PM, J William Piggott wrote:

Thanks, William. Applied. Note that there's no need to bump the
page timestamp. Nowadays, my release scripts make sure it gets
updated.

Cheers,

Michael


> Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
> ---
>  man3/tzset.3 | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index 8002ee5..0347ae8 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -30,7 +30,7 @@
>  .\" Modified 2001-11-13, aeb
>  .\" Modified 2004-12-01 mtk and Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
>  .\"
> -.TH TZSET 3  2014-08-19 "" "Linux Programmer's Manual"
> +.TH TZSET 3  2015-01-30 "" "Linux Programmer's Manual"
>  .SH NAME
>  tzset, tzname, timezone, daylight \- initialize time conversion information
>  .SH SYNOPSIS
> @@ -84,9 +84,9 @@ timezone directory (see the \fBFILES\fP section below).
>  .PP
>  If the
>  .B TZ
> -variable does appear in the environment but its value is empty
> +variable does appear in the environment, but its value is empty,
>  or its value cannot be interpreted using any of the formats specified
> -below, Coordinated Universal Time (UTC) is used.
> +below, then Coordinated Universal Time (UTC) is used.
>  .PP
>  The value of
>  .B TZ
> @@ -113,7 +113,7 @@ The hour must be between 0 and 24, and the minutes and seconds
>  The \fIdst\fP string and \fIoffset\fP specify the name and offset for the
>  corresponding daylight saving timezone.
>  If the offset is omitted,
> -it default to one hour ahead of standard time.
> +it defaults to one hour ahead of standard time.
>  .PP
>  The \fIstart\fP field specifies when daylight saving time goes into
>  effect and the \fIend\fP field specifies when the change is made back to
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
