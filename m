From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] setjmp(3): fix typo and clarify return
Date: Fri, 26 Jun 2009 15:07:20 +0200
Message-ID: <cfd18e0f0906260607k1f5d228ckdaf37f5bed978514@mail.gmail.com>
References: <1245775803-1692-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1245775803-1692-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Tue, Jun 23, 2009 at 6:50 PM, Mike Frysinger<vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrot=
e:
> The word "signal" was duplicated in the NOTES, and the RETURN section
> refers to setjmp and sigsetjmp, but only longjmp.
>
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

Thanks.  Applied for 3.22.

Cheers,

Michael


> ---
> =A0man3/setjmp.3 | =A0 =A04 +++-
> =A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/man3/setjmp.3 b/man3/setjmp.3
> index 5dae1ab..2368242 100644
> --- a/man3/setjmp.3
> +++ b/man3/setjmp.3
> @@ -75,6 +75,8 @@ and
> =A0return 0 if returning directly, and
> =A0non-zero when returning from
> =A0.BR longjmp (3)
> +or
> +.BR siglongjmp (3)
> =A0using the saved context.
> =A0.SH "CONFORMING TO"
> =A0C89, C99, and POSIX.1-2001 specify
> @@ -84,7 +86,7 @@ POSIX.1-2001 specifies
> =A0.SH NOTES
> =A0POSIX does not specify whether
> =A0.BR setjmp ()
> -will save the signal signal mask.
> +will save the signal mask.
> =A0In System V it will not.
> =A0In 4.3BSD it will, and there
> =A0is a function \fB_setjmp\fP that will not.
> --
> 1.6.3
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
