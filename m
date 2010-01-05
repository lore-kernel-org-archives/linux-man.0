From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: execve signal reset
Date: Wed, 6 Jan 2010 04:12:53 +1300
Message-ID: <cfd18e0f1001050712u2a46a62bk944805e2a6c8557@mail.gmail.com>
References: <20100105142136.GI5847@riva.ucam.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100105142136.GI5847-K2jUmMR1UYV4cg9Nei1l7Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Watson <cjwatson-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Colin,

On Wed, Jan 6, 2010 at 3:21 AM, Colin Watson <cjwatson-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> Using man-pages 3.23 on Ubuntu lucid, I recently had cause to look up
> what happens to signal handlers across execve(). The execve(2) manual
> page contains the following sentence:
>
> =A0The dispositions of any signals that are being caught are reset to
> =A0being ignored.
>
> As it happened, though, the signal I'm interested in right now defaul=
ts
> to "terminate process", so I found this statement ambiguous, and look=
ed
> up POSIX, which says "Signals set to be caught by the calling process
> image shall be set to the default action in the new process image".
>
> How about the following patch?

Obviously correct, and applied for 2.34.

Thanks,

Michael

>
> diff --git a/man2/execve.2 b/man2/execve.2
> index 0ea50db..11bec18 100644
> --- a/man2/execve.2
> +++ b/man2/execve.2
> @@ -120,7 +120,8 @@ All process attributes are preserved during an
> =A0except the following:
> =A0.IP *
> =A0The dispositions of any signals that are being caught are
> -reset to being ignored.
> +reset to the default action
> +.RB ( signal (7)).
> =A0.IP *
> =A0Any alternate signal stack is not preserved
> =A0.RB ( sigaltstack (2)).
>
> Thanks,
>
> --
> Colin Watson =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 [cjwatson-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org]
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
