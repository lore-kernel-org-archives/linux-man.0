From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sigprocmask(2): add EFAULT as a possible errno value
Date: Sun, 15 Apr 2012 23:25:28 +1200
Message-ID: <CAKgNAki1vasLQ3r7GpbcRnZg=4Pwi=cM4gCRdmmS5T4dpAYrYA@mail.gmail.com>
References: <1326588223-8739-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1326588223-8739-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Sun, Jan 15, 2012 at 1:43 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> This func takes pointers, and invalid ones will result in EFAULT.
>
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
> =A0man2/sigprocmask.2 | =A0 =A08 ++++++++
> =A01 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/man2/sigprocmask.2 b/man2/sigprocmask.2
> index bd4065d..14222b6 100644
> --- a/man2/sigprocmask.2
> +++ b/man2/sigprocmask.2
> @@ -92,6 +92,14 @@ is unspecified in a multithreaded process; see
> =A0.BR sigprocmask ()
> =A0returns 0 on success and \-1 on error.
> =A0.SH ERRORS
> +.TP
> +.B EFAULT
> +The specified
> +.I set
> +or
> +.I oldset
> +pointed outside the process's allocated address space.
> +.TP
> =A0.B EINVAL
> =A0The value specified in
> =A0.I how

Thanks. I've applied a slightly edited version of this for man-pages-3.=
39.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
