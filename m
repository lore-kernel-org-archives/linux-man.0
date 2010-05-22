From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] mount.2: fix incorrect path
Date: Sat, 22 May 2010 08:37:28 +0200
Message-ID: <AANLkTikZo3HM7rIdFuH7FQZ0GFIL6rctHpx4RsthE4fu@mail.gmail.com>
References: <20100519123203.GA9081@foxbat.suse.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100519123203.GA9081-hLZXBWembXzjFM9bn6wA6Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Petr,

On Wed, May 19, 2010 at 2:32 PM, Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org> wrote:
> Signed-off-by: Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
> ---
> =A0man2/mount.2 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man2/mount.2 b/man2/mount.2
> index a79bdca..486fb4f 100644
> --- a/man2/mount.2
> +++ b/man2/mount.2
> @@ -438,7 +438,7 @@ to other processes (except child processes that t=
he caller
> =A0subsequently creates) and vice versa.
>
> =A0The Linux-specific
> -.I /proc/PID/self
> +.I /proc/PID/mounts
> =A0file exposes the list of mount points in the mount
> =A0namespace of the process with the specified ID; see
> =A0.BR proc (5)
> --
> 1.6.4.2

Thanks. Applied for 3.25.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
