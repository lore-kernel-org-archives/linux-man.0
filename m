From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sendto() on UDP can return EACCES
Date: Fri, 6 May 2011 10:36:47 +0300
Message-ID: <BANLkTimfzcHPUD4MdPFjCkwSZXFf_M8pYQ@mail.gmail.com>
References: <AANLkTikmut_ro+FEiqgazjYz_hsJ3+wDK3xaDRUJj9+Y@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikmut_ro+FEiqgazjYz_hsJ3+wDK3xaDRUJj9+Y-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

Ping! :)

On Mon, Mar 21, 2011 at 12:49 PM, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> w=
rote:
> Hi,
>
> It seems sendto() can return EACCES for UDP as well; the current man
> page in git only says it can return EACCES for Unix sockets:
>
> EACCES
> (For =A0UNIX =A0domain =A0sockets, which are identified by pathname) =
Write
> permission is denied on the destination socket file, or
> =A0 =A0 =A0 =A0 =A0 =A0 =A0search permission is denied for one of the=
 directories
> the path prefix. =A0(See path_resolution(7).)
>
> I was able to make sendto() return EACCES if I try to send from
> 192.168.1.1/24 to 192.168.1.0. I think the relevant code (in kernel
> 2.6.38, but also present in 2.6.7 and 2.6.32, the 2 kernels we use) i=
s
> this (net/ipv4/udp.c, udp_sendmsg()):
>
> =A0910 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D -EACCES;
> =A0911 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((rt->rt_flags & RTCF_BROADC=
AST) &&
> =A0912 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0!sock_flag(sk, SOCK_BRO=
ADCAST))
> =A0913 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
>
> So I guess if the kernel finds a route to the destination and it's a
> broadcast route (and the socket doesn't have the broadcast flag), the=
n
> it returns EACCES.
>
> I can verify the behavior with a very simple program (attached). I've
> run it on my Ubuntu 10.10 (2.6.35 kernel) and got this:
>
> stefan@spuiu-vml2:~/src/test/broadcast$ ./broadcast_test 10.205.20.94
> 10.205.20.1
> sendto() returned 4
> stefan@spuiu-vml2:~/src/test/broadcast$ ./broadcast_test 10.205.20.94
> 10.205.20.0
> sendto() returned negative, errno: 13/Permission denied
>
> (10.205.20.94 is my local IP, of course).
>
> How about updating the send.2 page like this?
>
> diff --git a/man2/send.2 b/man2/send.2
> index 69287fb..4d2faed 100644
> --- a/man2/send.2
> +++ b/man2/send.2
> @@ -288,6 +288,8 @@ or search permission is denied for one of the dir=
ectories
> =A0the path prefix.
> =A0(See
> =A0.BR path_resolution (7).)
> +(For UDP sockets) An attempt was made to sendto() to a
> +network/broadcast address like it was a unicast address.
> =A0.TP
> =A0.BR EAGAIN " or " EWOULDBLOCK
> =A0.\" Actually EAGAIN on Linux
>
> Thanks,
> Stefan.
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
