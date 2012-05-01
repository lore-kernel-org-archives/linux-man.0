From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fork(2): add ENOSYS
Date: Tue, 1 May 2012 17:38:35 +1200
Message-ID: <CAKgNAkjx1a002xLYEYtgJr8Luy8mKSiWo8J8ZT+aYbzhVrRz5g@mail.gmail.com>
References: <1335847802-15646-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335847802-15646-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Tue, May 1, 2012 at 4:50 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrot=
e:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
> =A0man2/fork.2 | =A0 =A04 ++++
> =A01 file changed, 4 insertions(+)
>
> diff --git a/man2/fork.2 b/man2/fork.2
> index 4089fb9..fb604ac 100644
> --- a/man2/fork.2
> +++ b/man2/fork.2
> @@ -184,6 +184,10 @@ capability.
> =A0.B ENOMEM
> =A0.BR fork ()
> =A0failed to allocate the necessary kernel structures because memory =
is tight.
> +.TP
> +.B ENOSYS
> +.BR fork ()
> +is not supported on this platform (e.g. a no-mmu setup).
> =A0.SH "CONFORMING TO"
> =A0SVr4, 4.3BSD, POSIX.1-2001.
> =A0.SH NOTES

I'm curious. Which architectures currently do this, do you know?

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
