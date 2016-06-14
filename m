From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: locale.5: adjust conformance
Date: Tue, 14 Jun 2016 20:09:32 +0200
Message-ID: <51d557dc-ce39-2eb2-11d9-e310c9b5f80c@gmail.com>
References: <575E5EB7.7060802@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575E5EB7.7060802-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Marko,

On 06/13/2016 09:20 AM, Marko Myllynen wrote:
> Hi Michael,
> 
> Since we now know that glibc does not support all the keywords
> mentioned in ISO/IEC TR 14652 [1] and in general glibc aims to
> be conforming to POSIX first and foremost, I think it's best
> just to drop the reference to ISO/IEC TR 14652 from the man page.
> 
> 1) http://www.open-std.org/jtc1/SC22/WG20/docs/n972-14652ft.pdf

Thanks. Applied.

> After this I think the locale related man pages are finally as
> complete as they need to be.

That's a great thing... Thanks for all the work you put in, Marko!

Michael

> ---
>  man5/locale.5 | 5 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index db20368..ab7b6f7 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -1298,7 +1297,7 @@ Usual default locale archive location.
>  .I /usr/share/i18n/locales
>  Usual default path for locale definition files.
>  .SH CONFORMING TO
> -POSIX.2, ISO/IEC TR 14652.
> +POSIX.2.
>  .SH NOTES
>  The collective GNU C library community wisdom regarding
>  .IR abday ,
> 
> Thanks,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
