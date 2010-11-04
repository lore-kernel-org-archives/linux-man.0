From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nroff syntax error in man2/kexec_load.2
Date: Thu, 4 Nov 2010 07:15:42 +0100
Message-ID: <AANLkTimtKQFbYSFGLxLZ1z8goHm+QEAvc8zEQRM2QHvQ@mail.gmail.com>
References: <AANLkTikqy1T+DSM9DTkj6D61i1vEBvDFZN+a53f56A0o@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikqy1T+DSM9DTkj6D61i1vEBvDFZN+a53f56A0o-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Nov 2, 2010 at 12:13 AM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> Hello,
>
> Here is a trivial patch to fix nroff syntax.

Applied for 3.31.

Thanks,

Michael

> Michael, there is something wrong on your git repository, master
> points to 09fa72f instead of d84f58c.
>
>
> diff --git a/man2/kexec_load.2 b/man2/kexec_load.2
> index e0dff72..dc250c4 100644
> --- a/man2/kexec_load.2
> +++ b/man2/kexec_load.2
> @@ -25,7 +25,7 @@
> =A0.SH NAME
> =A0kexec_load \- load a new kernel for later execution
> =A0.SH SYNOPSIS
> -.b #include <linux/kexec.h>
> +.B #include <linux/kexec.h>
> =A0.br
> =A0.BI "long kexec_load(unsigned long " entry ", unsigned long " nr_s=
egments ","
> =A0.br
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
