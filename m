From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] tzset.3: Incorrect TZ string representation
Date: Sun, 01 Feb 2015 16:31:00 +0100
Message-ID: <54CE46B4.1010707@gmail.com>
References: <54CE2689.7000704@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54CE2689.7000704-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/01/2015 02:13 PM, J William Piggott wrote:
> 
> The TZ string representation indicates that the start/end
> rules are required; this is incorrect.
> 
> Updated the TZ string format to the POSIX specification and
> improve its readability by having only the optional parts in
> italics.

Thanks, William. Applied.

Cheers,

Michael


> http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html
> 
> Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
> ---
>  man3/tzset.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index 9cb9d32..ed7f406 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -113,7 +113,7 @@ The hour must be between 0 and 24, and the minutes and seconds
>  The second format is used when there is daylight saving time:
>  .sp
>  .RS
> -.I std offset dst [offset],start[/time],end[/time]
> +.RI stdoffset[ dst [ offset ][, start [ /time ], end [ /time ]]]
>  .RE
>  .sp
>  There are no spaces in the specification.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
