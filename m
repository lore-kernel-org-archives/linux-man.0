From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] ipv6.7: documents SOL_IPV6 as an alternative to IPPROTO_IPV6
 for socket level.
Date: Wed, 04 Mar 2015 07:24:53 +0100
Message-ID: <54F6A535.3030103@gmail.com>
References: <1425424838-17615-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425424838-17615-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 472447-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi St=C3=A9phane,

On 03/04/2015 12:20 AM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
>=20
> Fix for Debian bug #472447 reported by David Madore <david.madore@ens=
=2Efr>

I know it's tiresome, but it's nice to have a URL for easy clicking:

https://bugs.debian.org/472447

But, I am skeptical about the bug report. The reporter says that the
page "[does not] mention SOL_IPV6 as an alternative to IPPROTO_IPV6
for socket level.  It would be nice if it could."

This is not a very useful report. *Why* would it be nice? SOL_IPV6 is
not in any standard as far as I can see, nor on any other implementatio=
n.
=46urthermore, ip(7) says of the analogous "SOL_IP" constant:

       Using  SOL_IP  socket  options  level  isn't  portable, BSD-base=
d
       stacks use IPPROTO_IP level.

So, it appears to me that mentioning SOL_IPV6 is just leading people=20
into a portability trap.

In general: one must question bug reports. The reporter may suggest=20
that something is true or desirable, but that needs explanation or
justification.

Summary: I won't apply this. (I would entertain a patch that mention=20
SOL_IPV6 in NOTES, with a careful note that it is nonportable.)

Cheers,

Michael

>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man7/ipv6.7 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/man7/ipv6.7 b/man7/ipv6.7
> index c4e6cac..cd1af35 100644
> --- a/man7/ipv6.7
> +++ b/man7/ipv6.7
> @@ -195,7 +195,9 @@ IPv6 supports some protocol-specific socket optio=
ns that can be set with
>  and read with
>  .BR getsockopt (2).
>  The socket option level for IPv6 is
> -.BR IPPROTO_IPV6 .
> +.BR IPPROTO_IPV6=20
> +(or its alternative
> +.BR SOL_IPV6 ).
>  A boolean integer flag is zero when it is false, otherwise true.
>  .TP
>  .B IPV6_ADDRFORM
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
