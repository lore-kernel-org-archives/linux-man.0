From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Missing word in aio.7
Date: Sat, 9 Oct 2010 16:43:17 +0200
Message-ID: <AANLkTiknPL=Ovy=36643gz2EhLeNRNi0W=FYwb4Omben@mail.gmail.com>
References: <AANLkTi=TgkncPeFgP8WTKnHn96Qm6xYK4mdLzumY6Vie@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=TgkncPeFgP8WTKnHn96Qm6xYK4mdLzumY6Vie-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Denis,

On Wed, Oct 6, 2010 at 11:39 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> Hello,
>
> Around line 120 of man7/aio.7:
> =A0This field specifies a value that is subtracted
> =A0from the calling thread's real-time priority in order to
> =A0determine the priority for execution of this I/O request.
> =A0.BR pthread_setschedparam (3)).
>
> Here is a patch
> -determine the priority for execution of this I/O request.
> +determine the priority for execution of this I/O request (see
> but you may want to change punctuation.

By chance, I had already caught and fixed this.

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
