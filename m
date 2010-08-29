From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] send.2, recv.2: Fixed type of msg_controllen in struct msghdr
Date: Sun, 29 Aug 2010 08:30:43 +0200
Message-ID: <AANLkTi=9xfA2UFUj_M-3FiGTgJqO7QSfRnuXC+7nzgar@mail.gmail.com>
References: <20100818181346.7dee6951@Semtex>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100818181346.7dee6951@Semtex>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicholas Hunt <nhunt-GmWTxIRN22iJaUV4rX00uodd74u8MsAO@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Nicholas,

On Thu, Aug 19, 2010 at 3:13 AM, Nicholas Hunt <nhunt-GmWTxIRN22iJaUV4rX00uodd74u8MsAO@public.gmane.org=
> wrote:
> Hello,
>
> This patch fixes the type of msg_controllen in the struct msghdr
> definition given in send.2 and recv.2 to match the definition in glib=
c
> and the kernel. Applies cleanly to the current head of git (sha hash:
> 55d56b71...).

This was already a know issue, see
http://sourceware.org/bugzilla/show_bug.cgi?id=3D2448
See also the NOTES on each page.

However, your patch is probably still a good idea. I applied it for
man-pages 2.26.

Thanks,

Michael



> -Nick
>
> diff --git a/man2/recv.2 b/man2/recv.2
> index 9431b5c..d5eaf33 100644
> --- a/man2/recv.2
> +++ b/man2/recv.2
> @@ -304,7 +304,7 @@ struct msghdr {
> =A0 =A0 struct iovec *msg_iov; =A0 =A0 =A0 =A0/* scatter/gather array=
 */
> =A0 =A0 size_t =A0 =A0 =A0 =A0msg_iovlen; =A0 =A0 /* # elements in ms=
g_iov */
> =A0 =A0 void =A0 =A0 =A0 =A0 *msg_control; =A0 =A0/* ancillary data, =
see below */
> - =A0 =A0socklen_t =A0 =A0 msg_controllen; /* ancillary data buffer l=
en */
> + =A0 =A0size_t =A0 =A0 =A0 =A0msg_controllen; /* ancillary data buff=
er len */
> =A0 =A0 int =A0 =A0 =A0 =A0 =A0 msg_flags; =A0 =A0 =A0/* flags on rec=
eived message */
> =A0};
> =A0.fi
> diff --git a/man2/send.2 b/man2/send.2
> index c99b77a..c9e76b0 100644
> --- a/man2/send.2
> +++ b/man2/send.2
> @@ -250,7 +250,7 @@ struct msghdr {
> =A0 =A0 struct iovec *msg_iov; =A0 =A0 =A0 =A0/* scatter/gather array=
 */
> =A0 =A0 size_t =A0 =A0 =A0 =A0msg_iovlen; =A0 =A0 /* # elements in ms=
g_iov */
> =A0 =A0 void =A0 =A0 =A0 =A0 *msg_control; =A0 =A0/* ancillary data, =
see below */
> - =A0 =A0socklen_t =A0 =A0 msg_controllen; /* ancillary data buffer l=
en */
> + =A0 =A0size_t =A0 =A0 =A0 =A0msg_controllen; /* ancillary data buff=
er len */
> =A0 =A0 int =A0 =A0 =A0 =A0 =A0 msg_flags; =A0 =A0 =A0/* flags on rec=
eived message */
> =A0};
> =A0.fi
>
> --
> Computer Science and Engineering, University of Washington
> E-mail =A0 : nhunt-GmWTxIRN22iJaUV4rX00uodd74u8MsAO@public.gmane.org
> PGP Key =A0: http://students.washington.edu/nhunt/cs.asc
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
