From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typo in stdio manpage
Date: Wed, 2 Jan 2013 21:18:59 +0100
Message-ID: <CAKgNAkgaZzgi9VinWvFh0AWSeZbbiPN5vTQpnL+8PP43t+hsZQ@mail.gmail.com>
References: <1357138301-22108-1-git-send-email-maxin.john@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357138301-22108-1-git-send-email-maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Maxin B. John" <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: daan.f.spitz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Maxin, Daan,

On Wed, Jan 2, 2013 at 3:51 PM, Maxin B. John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: "Maxin B. John" <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> stdio: resolve typo in stdio.3 manpage

Patch applied.

Cheers,

Michael


> Reported-by: Daan Spitz <daan.f.spitz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Maxin B. John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man3/stdio.3 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man3/stdio.3 b/man3/stdio.3
> index 0c773e9..9a478df 100644
> --- a/man3/stdio.3
> +++ b/man3/stdio.3
> @@ -113,7 +113,7 @@ and
>  .IR stderr .
>  When opened, the standard error stream is not fully buffered; the standard
>  input and output streams are fully buffered if and only if the streams do
> -not to refer to an interactive device.
> +not refer to an interactive device.
>  .PP
>  Output streams that refer to terminal devices are always line buffered by
>  default; pending output to such streams is written automatically whenever
> --
> 1.7.10.4
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
