From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] tzset.3: There are only two TZ formats
Date: Sun, 01 Feb 2015 16:31:29 +0100
Message-ID: <54CE46D1.1080303@gmail.com>
References: <54CE2689.7000704@gmx.com> <54CE272A.1090003@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54CE272A.1090003-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/01/2015 02:16 PM, J William Piggott wrote:
> 
> tzset(3) currently states that there are three TZ formats. The
> first two it lists are actually variations of the POSIX-style
> TZ format, of which there are at least five variations.
> 
> This patch corrects this to match the POSIX specification of
> TZ having only two formats.

Thanks, William. Applied.

Cheers,

Michael


> http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html
> 
> Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
> ---
>  man3/tzset.3 | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
> 
> diff --git a/man3/tzset.3 b/man3/tzset.3
> index ed7f406..8002ee5 100644
> --- a/man3/tzset.3
> +++ b/man3/tzset.3
> @@ -90,12 +90,12 @@ below, Coordinated Universal Time (UTC) is used.
>  .PP
>  The value of
>  .B TZ
> -can be one of three formats.
> -The first format is used
> -when there is no daylight saving time in the local timezone:
> +can be one of two formats.
> +The first format is a string of characters that directly represent the
> +timezone to be used:
>  .sp
>  .RS
> -.I std offset
> +.RI stdoffset[ dst [ offset ][, start [ /time ], end [ /time ]]]
>  .RE
>  .sp
>  There are no spaces in the specification.
> @@ -110,15 +110,6 @@ east.
>  The hour must be between 0 and 24, and the minutes and seconds
>  0 and 59.
>  .PP
> -The second format is used when there is daylight saving time:
> -.sp
> -.RS
> -.RI stdoffset[ dst [ offset ][, start [ /time ], end [ /time ]]]
> -.RE
> -.sp
> -There are no spaces in the specification.
> -The initial \fIstd\fP and
> -\fIoffset\fP specify the standard timezone, as described above.
>  The \fIdst\fP string and \fIoffset\fP specify the name and offset for the
>  corresponding daylight saving timezone.
>  If the offset is omitted,
> @@ -161,7 +152,7 @@ and the changeovers happen at the default time of 02:00:00:
>      TZ="NZST-12:00:00NZDT-13:00:00,M10.1.0,M3.3.0"
>  .fi
>  .PP
> -The third format specifies that the timezone information should be read
> +The second format specifies that the timezone information should be read
>  from a file:
>  .sp
>  .RS
> @@ -175,7 +166,7 @@ If \fIfilespec\fP is given, it specifies another
>  file to read the timezone information from.
>  If \fIfilespec\fP does not begin with a \(aq/\(aq, the file specification is
>  relative to the system timezone directory.  If the colon is omitted each
> -of the above three \fBTZ\fP formats will be tried in order.
> +of the above \fBTZ\fP formats will be tried.
>  .PP
>  Here's an example, once more for New Zealand:
>  .nf
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
