From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Makefile: provide check-groff-warnings target
Date: Sun, 21 Oct 2012 09:25:17 +0200
Message-ID: <CAKgNAkhcqDJkTxCuWh+b0JPL+R+ShSV3umwQW6yJvSE1eG0FRg@mail.gmail.com>
References: <1346008541-25624-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1346008541-25624-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Simon. That's a useful addition. I tweaked very slightly, so
that the loop ignores link files and thus runs somewhat faster.

On Sun, Aug 26, 2012 at 9:15 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> ---
>  Makefile |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index f5229c5..a4713ee 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -55,5 +55,16 @@ install:
>                 install -m 644 "$$i"/* $(DESTDIR)$(MANDIR)/"$$i" || exit $$?; \
>         done; \
>
> +# Check if groff reports warnings (may be words of sentances not displayed)
> +# from http://lintian.debian.org/tags/manpage-has-errors-from-man.html
> +GROFF_LOG := $(shell mktemp /tmp/manpages-checksXXXX)
> +check-groff-warnings:
> +       for i in man?/*.*; \
> +       do \
> +          LC_ALL=en_US.UTF-8 MANWIDTH=80 man --warnings -E UTF-8 -l $$i > /dev/null 2>$(GROFF_LOG); \
> +          [ -s $(GROFF_LOG) ] && ( echo "$$i: " ; cat $(GROFF_LOG) ; echo "" ); \
> +          rm $(GROFF_LOG) 2>/dev/null; \
> +       done
> +
>  # someone might also want to look at /var/catman/cat2 or so ...
>  # a problem is that the location of cat pages varies a lot
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
