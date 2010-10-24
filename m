From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] ip.7: Convention, order, and typo
Date: Sun, 24 Oct 2010 08:18:36 +0200
Message-ID: <AANLkTikvhHjDQsS9JQ9RFRUt42mMWh9qRn9sXyuk0krf@mail.gmail.com>
References: <i9qub7$jge$1@dough.gmane.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <i9qub7$jge$1@dough.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello David,

On Fri, Oct 22, 2010 at 4:53 AM, David Pr=E9vot <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> Please find inline a patch against current ip(7) manual page, in orde=
r
> to fix some issue spotted while reviewing it's translation.
>
> The first part goal is to mark in _italic_ the text that should be
> replaced with appropriate argument, as it is correctly used in other
> parts of the page (and in the other pages).
>
> The second part of the patch is a nip-ticking one, proposed in case y=
ou
> find it justified to also follow this rule for INADDR_*.
>
> I also noticed that socket options used to be order alphabetically,
> this is addressed in the following parts of the patch.
>
> Finally, maybe the most important one if I'm not mistaken, the last
> part of the patch fixes a socket option name issue.

Thanks. I applied these changes in 3 pieces. (See git.) The changes
will be in man-pages-3.30.

Thanks,

Michael

> diff --git a/man7/ip.7 b/man7/ip.7
> index d8480e9..a517c82 100644
> - --- a/man7/ip.7
> +++ b/man7/ip.7
> @@ -41,7 +41,7 @@ For more information on sockets, see
> =A0An IP socket is created by calling the
> =A0.BR socket (2)
> =A0function as
> - -.BR "socket(AF_INET, socket_type, protocol)" .
> +.BR "socket(AF_INET, \fIsocket_type\fB, \fIprotocol\fB)" .
> =A0Valid socket types are
> =A0.B SOCK_STREAM
> =A0to open a
> @@ -151,7 +151,7 @@ member of
> =A0.I struct in_addr
> =A0contains the host interface address in network byte order.
> =A0.I in_addr
> - -should be assigned one of the INADDR_* values (e.g.,
> +should be assigned one of the \fBINADDR_\fI*\fR values (e.g.,
> =A0.BR INADDR_ANY )
> =A0or set using the
> =A0.BR inet_aton (3),
> @@ -263,6 +263,19 @@ or
> =A0structure similar to
> =A0.BR IP_ADD_MEMBERSHIP .
> =A0.TP
> +.BR IP_FREEBIND " (since Linux 2.4)"
> +.\" Precisely: 2.4.0-test10
> +If enabled, this boolean option allows binding to an IP address
> +that is nonlocal or does not (yet) exist.
> +This permits listening on a socket,
> +without requiring the underlying network interface or the
> +specified dynamic IP address to be up at the time that
> +the application is trying to bind to it.
> +This option is the per-socket equivalent of the
> +.IR ip_nonlocal_bind
> +.I /proc
> +interface described below.
> +.TP
> =A0.BR IP_HDRINCL " (since Linux 2.0)"
> =A0If enabled,
> =A0the user supplies an IP header in front of the user data.
> @@ -278,19 +291,6 @@ When this flag is enabled the values set by
> =A0and
> =A0.B IP_TOS
> =A0are ignored.
> - -.TP
> - -.BR IP_FREEBIND " (since Linux 2.4)"
> - -.\" Precisely: 2.4.0-test10
> - -If enabled, this boolean option allows binding to an IP address
> - -that is nonlocal or does not (yet) exist.
> - -This permits listening on a socket,
> - -without requiring the underlying network interface or the
> - -specified dynamic IP address to be up at the time that
> - -the application is trying to bind to it.
> - -This option is the per-socket equivalent of the
> - -.IR ip_nonlocal_bind
> - -.I /proc
> - -interface described below.
> =A0.\"
> =A0.\" FIXME Document IP_IPSEC_POLICY
> =A0.\" Since Linux 2.5.47
> @@ -449,18 +449,6 @@ puts the current IP options used for sending int=
o the supplied buffer.
> =A0.\" commit 2c7946a7bf45ae86736ab3b43d0085e43947945c
> =A0.\" Author: Catherine Zhang <cxzhang-aZOuKsOsJu3MbYB6QlFGEg@public.gmane.org>
> =A0.TP
> - -.BR IP_RECVORIGDSTADDR " (since Linux 2.6.29)"
> - -.\" FIXME: Document IP_ORIGDSTADDR+IP_RECVORIGDSTADDR, added in Li=
nux 2.6.29
> - -.\" commit e8b2dfe9b4501ed0047459b2756ba26e5a940a69
> - -This boolean option enables the
> - -.B IP_ORIGDSTADDR
> - -ancillary message in
> - -.BR recvmsg (2),
> - -in which the kernel returns the original destination address
> - -of the datagram being received.
> - -The ancillary message contains a
> - -.IR "struct sockaddr_in" .
> - -.TP
> =A0.BR IP_PKTINFO " (since Linux 2.2)"
> =A0.\" Precisely: 2.1.68
> =A0Pass an
> @@ -661,6 +649,18 @@ Not supported for
> =A0.B SOCK_STREAM
> =A0sockets.
> =A0.TP
> +.BR IP_RECVORIGDSTADDR " (since Linux 2.6.29)"
> +.\" FIXME: Document IP_ORIGDSTADDR+IP_RECVORIGDSTADDR, added in Linu=
x 2.6.29
> +.\" commit e8b2dfe9b4501ed0047459b2756ba26e5a940a69
> +This boolean option enables the
> +.B IP_ORIGDSTADDR
> +ancillary message in
> +.BR recvmsg (2),
> +in which the kernel returns the original destination address
> +of the datagram being received.
> +The ancillary message contains a
> +.IR "struct sockaddr_in" .
> +.TP
> =A0.BR IP_RECVTOS " (since Linux 2.2)"
> =A0.\" Precisely: 2.1.68
> =A0If enabled the
> @@ -733,7 +733,7 @@ socket option (see
> =A0.\" Author: KOVACS Krisztian <hidden-fxaCF9evXcoHWmgEVkV9KA@public.gmane.org>
> =A0.\" http://lwn.net/Articles/252545/
> =A0.TP
> - -.BR IP_TTL " (since Linux 2.6.24)"
> +.BR IP_TRANSPARENT " (since Linux 2.6.24)"
> =A0.\" commit f5715aea4564f233767ea1d944b2637a5fd7cd2e
> =A0.\" =A0 =A0 This patch introduces the IP_TRANSPARENT socket option=
: enabling that
> =A0.\" =A0 =A0 will make the IPv4 routing omit the non-local source a=
ddress check on
>
>
> Regards
>
> David
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.10 (GNU/Linux)
>
> iEYEARECAAYFAkzA/KUACgkQ18/WetbTC/rgiQCgk6vSXqUdHcLZ8JqpwdnSOG6s
> r+UAn2GD2C063PcEdmdo+zk/ispXwvOQ
> =3DNO7w
> -----END PGP SIGNATURE-----
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
