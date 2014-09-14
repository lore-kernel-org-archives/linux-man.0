From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ip.7: tfix
Date: Sat, 13 Sep 2014 19:06:32 -0700
Message-ID: <5414F828.9080502@gmail.com>
References: <1410385112-1976-1-git-send-email-taffit@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410385112-1976-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied.

Cheers,

Michael



On 09/10/2014 02:38 PM, David Pr=E9vot wrote:
> ---
>  man7/ip.7 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/man7/ip.7 b/man7/ip.7
> index 2f18015..94b5519 100644
> --- a/man7/ip.7
> +++ b/man7/ip.7
> @@ -1006,17 +1006,17 @@ the port number in a socket address is specif=
ied as 0 when calling
>  is called on a stream socket that was not previously bound;
>  .IP *
>  .BR connect (2)
> -was called on a socket that was not not previously bound;
> +was called on a socket that was not previously bound;
>  .IP *
>  .BR sendto (2)
> -is called on a datagram socket that was not not previously bound.
> +is called on a datagram socket that was not previously bound.
>  .RE
>  .IP
>  Allocation of ephemeral ports starts with the first number in
>  .IR ip_local_port_range
>  and ends with the second number.
>  If the range of ephemeral ports is exhausted,
> -then the relevant system call returns an error (but see BUGS)
> +then the relevant system call returns an error (but see BUGS).
>  .IP
>  Note that the port range in
>  .IR ip_local_port_range
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
