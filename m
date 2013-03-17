From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] capabilities.7: tfix
Date: Sun, 17 Mar 2013 08:06:50 +0100
Message-ID: <CAKgNAkgmvENGVUDbY8FCpndRc1i7e23uUS+dbTDS35pi5eKvsA@mail.gmail.com>
References: <1363474685-21413-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363474685-21413-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Simon. Applied.

On Sat, Mar 16, 2013 at 11:58 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> ---
>  man7/capabilities.7 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man7/capabilities.7 b/man7/capabilities.7
> index 19a7309..637a99c 100644
> --- a/man7/capabilities.7
> +++ b/man7/capabilities.7
> @@ -491,7 +491,7 @@ create memory mappings at addresses below the value specified by
>  .IR /proc/sys/vm/mmap_min_addr ;
>  .IP *
>  map files in
> -.IR /proc/pci/bus ;
> +.IR /proc/bus/pci ;
>  .IP *
>  open
>  .IR /dev/mem
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
