From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] lseek.2: Document SEEK_HOLE/SEEK_DATA on FreeBSD and DragonFlyBSD
Date: Sun, 25 Sep 2011 07:11:14 +0200
Message-ID: <CAKgNAkhB_AocQ0totU9WozHURV8gwvoqdZhF-swbJfhxbLMV6g@mail.gmail.com>
References: <20110925041533.GA10286@gaara.hadrons.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110925041533.GA10286-v62vTE6/wQGgM1MOaoewpti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Sep 25, 2011 at 6:15 AM, Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org> wr=
ote:
> Signed-off-by: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
> ---
> =A0man2/lseek.2 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)

Thanks Guillem. Applied for 3.35.

Cheers,

Michael

> diff --git a/man2/lseek.2 b/man2/lseek.2
> index 9a59fa6..2f9cd8f 100644
> --- a/man2/lseek.2
> +++ b/man2/lseek.2
> @@ -193,7 +193,7 @@ SVr4, 4.3BSD, POSIX.1-2001.
> =A0.BR SEEK_DATA
> =A0and
> =A0.BR SEEK_HOLE
> -are nonstandard extensions also present in Solaris;
> +are nonstandard extensions also present in Solaris, FreeBSD and Drag=
onFlyBSD;
> =A0they are proposed for inclusion in the next POSIX revision (Issue =
8).
> =A0.\" FIXME . Review http://austingroupbugs.net/view.php?id=3D415 in=
 the future
> =A0.SH NOTES
> --
> 1.7.6.3
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
