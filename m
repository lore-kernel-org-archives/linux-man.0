From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] aio.7: Some minor typos (Was: Missing word in aio.7)
Date: Sat, 9 Oct 2010 16:46:17 +0200
Message-ID: <AANLkTik+eJRw9Eb5Jmb7ac3SwNhpS5VWCxNM3e6E1s_1@mail.gmail.com>
References: <AANLkTi=TgkncPeFgP8WTKnHn96Qm6xYK4mdLzumY6Vie@mail.gmail.com> <4CADEABC.1040005@altern.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4CADEABC.1040005-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello David,

On Thu, Oct 7, 2010 at 5:43 PM, David Pr=E9vot <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> Please find inline a patch including Denis' proposal and two others
> spotted during translation, against current aio(7) manual page.
>
>
> diff --git a/man7/aio.7 b/man7/aio.7
> index e1d6d2b..5a0f734 100644
> - --- a/man7/aio.7
> +++ b/man7/aio.7
> @@ -119,11 +119,11 @@ This is the size of the buffer pointed to by
> =A0.I aio_reqprio
> =A0This field specifies a value that is subtracted
> =A0from the calling thread's real-time priority in order to
> - -determine the priority for execution of this I/O request.
> +determine the priority for execution of this I/O request (see
> =A0.BR pthread_setschedparam (3)).
> =A0The specified value must be between 0 and the value returned by
> =A0.IR sysconf(_SC_AIO_PRIO_DELTA_MAX) .
> - -This field is ignored file synchronization operations.
> +This field is ignored during file synchronization operations.
> =A0.TP
> =A0.I aio_sigevent
> =A0This field is a structure that specifies how the caller is
> @@ -448,7 +448,7 @@ main(int argc, char *argv[])
> =A0.BR io_setup (2),
> =A0.BR io_cancel (2),
> =A0.BR io_destroy (2),
> - -.BR io_getevents (2)),
> +.BR io_getevents (2),
> =A0.BR aio_cancel (3),
> =A0.BR aio_error (3),
> =A0.BR aio_init (3),

I had already myself found and fixed the first two problems, but the
third one I had missed. Thanks for the patch. Applied for 3.29.

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
