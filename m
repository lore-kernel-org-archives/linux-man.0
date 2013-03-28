From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: Simplify the example of printing out environ
Date: Thu, 28 Mar 2013 10:20:43 +0100
Message-ID: <CAKgNAkig04HXDF=n8CFP6M0Xw-sbGCXLxV97xf35rHGw3=wOrg@mail.gmail.com>
References: <1364292699-10259-1-git-send-email-krzysztof.konopko@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364292699-10259-1-git-send-email-krzysztof.konopko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Konopko <krzysztof.konopko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Kris,

On Tue, Mar 26, 2013 at 11:11 AM, Krzysztof Konopko
<krzysztof.konopko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The `binutils' package contains a very handy utility to
> print out null-byte delimited strings from a file.  This
> can replace a rather complex expression with `cat'
> provided as an example for printing out
> `/proc/[pid]/environ'.

Thanks. Applied.

Cheers,

Michael


> ---
>  man5/proc.5 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index 22b7cd0..8688a40 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -182,7 +182,7 @@ Thus, to print out the environment of process 1, you would do:
>  .nf
>
>  .ft CW
> -.RB "$" " (cat /proc/1/environ; echo) | tr \(aq\e000\(aq \(aq\en\(aq"
> +.RB "$" " strings /proc/1/environ"
>  .fi
>  .ft P
>  .in
> --
> 1.8.1.4
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
