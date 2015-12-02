From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] nsswitch.conf.5: Add list of files being read when "files"
 service is used
Date: Wed, 02 Dec 2015 20:39:40 +0100
Message-ID: <565F48FC.4090904@gmail.com>
References: <1447420472.3144.3.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447420472.3144.3.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/13/2015 02:14 PM, Nikola Forr=C3=B3 wrote:
> This is not mentioned anywhere. Users can assume that the file being =
read
> is something like /etc/$DATABASE, but that's not always the case. It'=
s better
> to explicitly specify which file is read for each respective database=
=2E
> The list of files was acquired from glibc source code.

Thanks, Nikola. Applied.

Cheers,

Michael


> Signed-off-by: Nikola Forr=C3=B3 <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man5/nsswitch.conf.5 | 46 ++++++++++++++++++++++++++++++++++++++++++=
++++
>  1 file changed, 46 insertions(+)
>=20
> diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
> index 33b1c64..c990733 100644
> --- a/man5/nsswitch.conf.5
> +++ b/man5/nsswitch.conf.5
> @@ -330,6 +330,52 @@ implements "nis" source.
>  implements "nisplus" source.
>  .PD
>  .RE
> +.LP
> +The following files are read when "files" source is specified
> +for respective databases:
> +.RS 4
> +.TP 12
> +.PD 0
> +.B aliases
> +.I /etc/aliases
> +.TP
> +.B ethers
> +.I /etc/ethers
> +.TP
> +.B group
> +.I /etc/group
> +.TP
> +.B hosts
> +.I /etc/hosts
> +.TP
> +.B initgroups
> +.I /etc/group
> +.TP
> +.B netgroup
> +.I /etc/netgroup
> +.TP
> +.B networks
> +.I /etc/networks
> +.TP
> +.B passwd
> +.I /etc/passwd
> +.TP
> +.B protocols
> +.I /etc/protocols
> +.TP
> +.B publickey
> +.I /etc/publickey
> +.TP
> +.B rpc
> +.I /etc/rpc
> +.TP
> +.B services
> +.I /etc/services
> +.TP
> +.B shadow
> +.I /etc/shadow
> +.PD
> +.RE
>  .SH NOTES
>  Within each process that uses
>  .BR nsswitch.conf ,
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
