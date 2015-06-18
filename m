From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fgetgrent.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 18 Jun 2015 09:02:38 +0200
Message-ID: <55826D0E.2060509@gmail.com>
References: <1423639947-25066-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423639947-25066-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Zeng Linggang,

This patch from a while ago was sent by Ma Shimiao. Since you've now
taken up the work of Ma Shimiao, I bring you into this discussion.
The patch stalled because of some terminology questions that Ma Shimiao
wanted to resolve with Alexandre (in CC), but I'm not sure if there
was any progress. (I'll thread you into that discussion as well, which
took place off list.) Maybe you can discuss with Ma Shimiao and pursue 
with Alexandre?

Note also that this patch from Ma Shimiao appears to have been mistitled.
I believe the title should say: 

    Note function that is *not* thread-safe

Cheers,

Michael

On 02/11/2015 08:32 AM, Ma Shimiao wrote:
> The marking matches glibc marking.
> 
> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fgetgrent.3 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/man3/fgetgrent.3 b/man3/fgetgrent.3
> index 57665dd..88676b0 100644
> --- a/man3/fgetgrent.3
> +++ b/man3/fgetgrent.3
> @@ -90,6 +90,18 @@ is set to indicate the cause.
>  Insufficient memory to allocate
>  .I group
>  structure.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR fgetgrent ()
> +T}	Thread safety	MT-Unsafe race:fgetgrent
> +.TE
>  .SH CONFORMING TO
>  SVr4.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
