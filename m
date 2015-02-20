From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getsockopt.2: Corrected the RETURN VALUE
Date: Fri, 20 Feb 2015 15:32:05 +0100
Message-ID: <CAKgNAkji-5Vufx5vdCgCvKFU1w5EruEqXiCV3=DNC4zkCfKaiw@mail.gmail.com>
References: <54ed8560054c044dac40e28887da7b7a@shemyak.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54ed8560054c044dac40e28887da7b7a-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pavel Emelyanov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 20 February 2015 at 15:22, Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org> wrote:
> Hello,
>
> An almost trivial patch - but does not fit in any "XXXfix" categories.
> 'man setsockopt' tells that the return value in case of success is 0.
> But since at least 2007, setsockopt() calls the registered handler of
> the corresponding option, and returns the result of that call.
>
> Patch is made against master as of 20 Feb. 2015 (commit 35800487b675),
> both inline below and attached.

Hello Konstantin,

Sorry -- I cannot make sense of this patch.

* It seems netfilter-specific
* The man page then conveys less information than before.
  (The reader asks: "what is nf_register_sockopt()?")
* Are you saying there are case where successful
  setsockopt() via nf_register_sockopt() might return a
  value other zero?

Can you elaborate?

Thanks,

Michael

> From 19ac3ce52c7935c8f0792836dc27e02a9f26359a Mon Sep 17 00:00:00 2001
> From: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
> Date: Fri, 20 Feb 2015 15:59:19 +0200
> Subject: [PATCH] Corrected RETURN VALUE for getsockopt/setsockopt(2)
>
> ---
>  man2/getsockopt.2 | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/man2/getsockopt.2 b/man2/getsockopt.2
> index 1287efc..1c78fdc 100644
> --- a/man2/getsockopt.2
> +++ b/man2/getsockopt.2
> @@ -129,7 +129,10 @@ For a description of the available socket options see
>  .BR socket (7)
>  and the appropriate protocol man pages.
>  .SH RETURN VALUE
> -On success, zero is returned.
> +On success, the return value from the corresponding option handler
> +previously registered by
> +.I nf_register_sockopt()
> +is returned.
>  On error, \-1 is returned, and
>  .I errno
>  is set appropriately.
> --
> 1.9.1



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
