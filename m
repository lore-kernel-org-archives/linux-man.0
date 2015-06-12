From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale.5: refer to locale(7) more prominently
Date: Fri, 12 Jun 2015 21:37:58 +0200
Message-ID: <CAKgNAkhupg0z-e6RDPsALHn0vL1oK3xwoMF1egphKOC9qi=GKg@mail.gmail.com>
References: <5576F5B0.3010404@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5576F5B0.3010404-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 9 June 2015 at 16:18, Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Michael,
>
> it's probably a good idea to refer to locale(7) so that a reader
> can check what a category is about before describing them in
> detail.

Thanks, Marko. Applied.

Cheers,

Michael



> ---
>  man5/locale.5 |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/man5/locale.5 b/man5/locale.5
> index ee0d353..374f6b2 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -34,6 +34,8 @@ command needs to convert it into the binary locale database.
>
>  The definition files consist of sections which each describe a
>  locale category in detail.
> +.BR locale (7)
> +provides additional descriptions for these categories.
>  .SS Syntax
>  The locale definition file starts with a header that may consist
>  of the following keywords:
>
> Thanks,
>
> --
> Marko Myllynen



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
