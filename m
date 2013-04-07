From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] quotactl(2): rename RETURN VALUE section
Date: Sun, 7 Apr 2013 10:42:23 +0200
Message-ID: <CAKgNAki=u7OjGK9Unx-MR-u_gTN8pHNFL9Dc+qiv=Dp3=vysZg@mail.gmail.com>
References: <1364939854-12086-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364939854-12086-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Tue, Apr 2, 2013 at 11:57 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> Everywhere else we use the singular form.

Thanks, applied.

Cheers,

Michael


>
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man2/quotactl.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/quotactl.2 b/man2/quotactl.2
> index b112f02..74578c6 100644
> --- a/man2/quotactl.2
> +++ b/man2/quotactl.2
> @@ -416,7 +416,7 @@ for XFS since
>  .BR sync (1)
>  writes quota information to disk (in addition to the other file system
>  metadata that it writes out).
> -.SH RETURN VALUES
> +.SH RETURN VALUE
>  .LP
>  On success,
>  .BR quotactl ()
> --
> 1.8.1.2
>



--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
