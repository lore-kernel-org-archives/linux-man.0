From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] utf-8.7: Drop an old comment about UTF-8 replacing ISO
 8859
Date: Tue, 10 Jun 2014 16:49:56 +0200
Message-ID: <53971B14.4020107@gmail.com>
References: <5396C449.5070509@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5396C449.5070509-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "H. Peter Anvin" <hpa-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Markus Kuhn <mgk25-kDbDZe0LBGWFxr2TtlUqVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Marko,

Thanks! Applied. But see one comment below.

On 06/10/2014 10:39 AM, Marko Myllynen wrote:
> Hi,
> 
> I think it's safe to drop this forward-looking statement from the utf-8(7) page now.
> 
>>From 1d43dd645ac03eeb7815d641ca041e966d7bd333 Mon Sep 17 00:00:00 2001
> From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date: Mon, 9 Jun 2014 16:35:09 +0300
> Subject: [PATCH] utf-8.7: Drop an old comment about UTF-8 replacing ISO 8859
> 
> ---
>  man7/utf-8.7 |   10 +---------
>  1 files changed, 1 insertions(+), 9 deletions(-)
> 
> diff --git a/man7/utf-8.7 b/man7/utf-8.7
> index bdf5468..65cabba 100644
> --- a/man7/utf-8.7
> +++ b/man7/utf-8.7
> @@ -258,15 +258,6 @@ The corresponding return sequence from
>  to ISO 2022 is ESC % @ ("\\x1b%@").
>  Other ISO 2022 sequences (such as
>  for switching the G0 and G1 sets) are not applicable in UTF-8 mode.
> -.PP
> -It can be hoped that in the foreseeable future,
> -.B UTF-8
> -will replace
> -.B ASCII
> -and
> -.B ISO 8859
> -at all levels as the common character encoding on POSIX systems,
> -leading to a significantly richer environment for handling plain text.
>  .SS Security
>  The
>  .BR Unicode " and " UCS
> @@ -291,6 +282,7 @@ ISO/IEC 10646-1:2000, Unicode 3.1, RFC\ 3629, Plan 9.
>  .\" .SH AUTHOR
>  .\" Markus Kuhn <mgk25-kDbDZe0LBGWFxr2TtlUqVg@public.gmane.org>
>  .SH SEE ALSO
> +.BR locale (1),

I prefer to have pieces like this noted in the change log (or even better,
since it's unrelated--send as a separate patch).

Cheers,

Michael


>  .BR nl_langinfo (3),
>  .BR setlocale (3),
>  .BR charsets (7),



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
