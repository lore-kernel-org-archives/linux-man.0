From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] getrandom.2: mention bug concerning treatment of
 interrupts
Date: Thu, 22 Jan 2015 20:58:20 +0100
Message-ID: <54C1565C.90908@gmail.com>
References: <CAKgNAkiQUXFZ82jDNqEPxpBmdkKOg03uQXg=iEuUNzg0rvgkZA@mail.gmail.com> <1421951410-6420-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421951410-6420-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 01/22/2015 07:30 PM, Heinrich Schuchardt wrote:
> Theodore Ts'o confirmed the bug described in
> https://lkml.org/lkml/2014/11/29/16
> 
> It should be mentioned in the manpage.

Thanks, Heinrich. Applied.

Cheers,

Michael



> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/getrandom.2 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/getrandom.2 b/man2/getrandom.2
> index 5bf57b7..e9f62c5 100644
> --- a/man2/getrandom.2
> +++ b/man2/getrandom.2
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  
> -.TH GETRANDOM 2 2014-10-03 "Linux" "Linux Programmer's Manual"
> +.TH GETRANDOM 2 2015-01-22 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  getrandom \- obtain a series of random bytes
>  .SH SYNOPSIS
> @@ -252,6 +252,13 @@ failure:
>  }
>  .fi
>  .in
> +.SH BUGS
> +As of Linux 3.19, the following bug exists:
> +.PP
> +.\" FIXME patch proposed https://lkml.org/lkml/2014/11/29/16
> +Depending on CPU load
> +.BR getrandom ()
> +does not react to interrupts before reading all bytes requested.
>  .SH SEE ALSO
>  .BR random (4),
>  .BR urandom (4)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
