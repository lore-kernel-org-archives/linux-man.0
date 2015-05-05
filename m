From: Guillem Jover <guillem-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] man7/multiarch.7: new manpage
Date: Tue, 5 May 2015 09:55:12 +0200
Message-ID: <20150505075511.GA10402@gaara.hadrons.org>
References: <1428368938-104443-1-git-send-email-shawn@churchofgit.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1428368938-104443-1-git-send-email-shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cross-build-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org, debian-embedded-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!

The CC list seems to include only some barely related lists. I'm also
a bit conflicted about whether this belongs in man-pages upstream,
being it pretty much distribution-specific. OTOH having something like
this there, might make it easier to understand for people outside the
Debian-world.

On Mon, 2015-04-06 at 18:08:58 -0700, Shawn Landden wrote:
> diff --git a/man7/multiarch.7 b/man7/multiarch.7
> new file mode 100644
> index 0000000..dc80859
> --- /dev/null
> +++ b/man7/multiarch.7
> @@ -0,0 +1,105 @@
> +.\" Copyright (c) 2015 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

I don't think that's correct?

> +.SH DESCRIPTION
> +Multiarch
> +is a way of installing multiple binary targets (such as
> +.BR i386-linux-gnu
> +and
> +.BR amd64-linux-gnu )

This one should be x86_64-linux-gnu.

> +on one
> +.BR hier (7)
> +filesystem, which originated in (but is not limited to)
> +Debian and Ubuntu.
> +.sp
> +This manpage covers the filesystem aspects of multi-arch.
> +For packaging details refer either to the spec linked to at the bott=
om of this

> +document or the documentation for
> +.BR dpkg (1).
> +For a list of variables set during cross-compilation see
> +.BR dpkg-architecture (1).

This again is very Debian-centric, not sure if it belongs there?

> +.SS=20
> +.\"

A stray subsection?

> +.SH CONFORMING TO
> +.BR https://wiki.ubuntu.com/MultiarchSpec
> +.sp
> +.BR https://wiki.ubuntu.com/MultiarchCross

Those two have been either out-of-date or out-of-sync with the
implementation for a long time now=E2=80=A6

Thanks,
Guillem
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
