From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] error.3: change perror(errnum) to strerror(errnum) in description
Date: Sun, 29 Aug 2010 07:08:46 +0200
Message-ID: <AANLkTin0ZkocCMKn4KW_6s3Z+nv93dogjxJ9cqGLbTJu@mail.gmail.com>
References: <AANLkTikb5QCDgbZDZDvrS+jmfkugptFC1KSTA4Gj=aQy@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikb5QCDgbZDZDvrS+jmfkugptFC1KSTA4Gj=aQy-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Nilsson <lajnold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Linus,

On Thu, Aug 19, 2010 at 3:22 AM, Linus Nilsson <lajnold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> This patch changes perror to strerror, as strerror is the one that ta=
kes an
> error code.
> The patch also adds a \fP after the underlining of "errnum", so the t=
ext
> following it is no longer underlined.

Thanks. Applied for man-pages-3.26.

Cheers,

Michael

> The patch applies to current git.
>
> --- a/man3/error.3
> +++ b/man3/error.3
> @@ -55,7 +55,7 @@ the program name, a colon and a space, the message
> specified by the
> =A0.BR printf (3)-style
> =A0format string \fIformat\fP, and, if \fIerrnum\fP is
> =A0nonzero, a second colon and a space followed by the string given b=
y
> -\fBperror(\fIerrnum\fB)\fP.
> +\fBstrerror(\fP\fIerrnum\fP\fB)\fP.
> =A0Any arguments required for
> =A0.I format
> =A0should follow
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
