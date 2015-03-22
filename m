From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] hosts.5: mention 127.0.1.1 for FQDN and IPv6 examples
Date: Sun, 22 Mar 2015 19:55:35 +0100
Message-ID: <550F1027.2030702@gmail.com>
References: <1426194745-8406-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426194745-8406-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>, 562890-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/12/2015 10:12 PM, St=C3=A9phane Aulery wrote:
> Debian bug #562890 reported by Vincent Lefevre <vincent-buymaDBGzMOsTnJN9+BGXg@public.gmane.org>

Applied. Thanks, St=C3=A9phane.

Cheers,

Michael


> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D562890
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/hosts.5 | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/man5/hosts.5 b/man5/hosts.5
> index 9ec8cb2..2eaeb69 100644
> --- a/man5/hosts.5
> +++ b/man5/hosts.5
> @@ -106,11 +106,20 @@ I just found three, from 92,
>  94, and 95.
>  .SH EXAMPLE
>  .nf
> +# The following lines are desirable for IPv4 capable hosts
>  127.0.0.1       localhost
> +
> +# 127.0.1.1 is often used for the FQDN of the machine
> +127.0.1.1       thishost.mydomain.org  thishost
>  192.168.1.10    foo.mydomain.org       foo
>  192.168.1.13    bar.mydomain.org       bar
>  146.82.138.7    master.debian.org      master
>  209.237.226.90  www.opensource.org
> +
> +# The following lines are desirable for IPv6 capable hosts
> +::1             localhost ip6-localhost ip6-loopback
> +ff02::1         ip6-allnodes
> +ff02::2         ip6-allrouters
>  .fi
>  .SH SEE ALSO
>  .BR hostname (1),
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
