From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] Typo in select.2
Date: Thu, 8 Sep 2011 18:16:11 +0200
Message-ID: <CAKgNAkj54fLhc_VSCa14xcLVXg2zNvysjrcXdmD7EZsH8KkQeA@mail.gmail.com>
References: <BANLkTikA4Mz9OQpat5K3QpVZaPZAcFoN+w@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTikA4Mz9OQpat5K3QpVZaPZAcFoN+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Denis,

On Thu, May 12, 2011 at 3:40 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> Hello Michael,
>
> Bernard Siaud reported a typo in our French translation, but I believ=
e
> that it is also present in English. =A0Here is a patch:

Actually, this is correct English (but understandably tricky for
nonnative speakers!)

Cheers,

Michael


> diff --git a/man2/select.2 b/man2/select.2
> index 512471d..241694a 100644
> --- a/man2/select.2
> +++ b/man2/select.2
> @@ -147,7 +147,7 @@ clears a set.
> =A0.BR FD_SET ()
> =A0and
> =A0.BR FD_CLR ()
> -respectively add and remove a given file descriptor from a set.
> +respectively adds and removes a given file descriptor from a set.
> =A0.BR FD_ISSET ()
> =A0tests to see if a file descriptor is part of the set;
> =A0this is useful after
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
