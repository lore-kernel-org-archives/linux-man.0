From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] gethostbyname.3: NSS plugins searched first.
Date: Thu, 30 Apr 2015 10:49:50 +0200
Message-ID: <5541ECAE.6080108@gmail.com>
References: <554113E3.4040105@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <554113E3.4040105-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC +=3D St=C3=A9phane, since he's been working on related pages recent=
ly]

Hi Carlos,

On 04/29/2015 07:24 PM, Carlos O'Donell wrote:
> The gethostbyname man page should first and foremost list that
> the source of the data comes from the NSS plugins. I accept
> that the man page is intentionally trying to be vague because
> these things are not guaranteed anywhere, the truth is far
> more mundane and "default" here IMO applies to a normal glibc
> installation on Linux, and the fallback is always a localhost
> nameserver.
>=20
> I suggest the following changes, but feel free to reword as
> you see fit.

Thanks. Applied, with a few formatting teaks.

One question below.

> Patch against master.
>=20
> Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> diff --git a/man3/gethostbyname.3 b/man3/gethostbyname.3
> index 7875f88..59c7bb1 100644
> --- a/man3/gethostbyname.3
> +++ b/man3/gethostbyname.3
> @@ -224,18 +224,20 @@ The domain name queries carried out by
>  .BR gethostbyname ()
>  and
>  .BR gethostbyaddr ()
> -use a combination of any or all of the name server
> +use a combination of any or all of Name Service Switch
> +.BR nsswitch.conf(5)
> +configured sources, name servers in \fI/etc/resolv.conf\fP
> +.BR resolv.conf(5),
> +a local name server
>  .BR named (8),
>  a broken out line from \fI/etc/hosts\fP, and the Network
>  Information Service (NIS or YP), depending upon the contents of the
>  \fIorder\fP line in
>  .IR /etc/host.conf .

Your patch didn't change the last few lines, but you may be able to
help... Is the reference to "order" and /etc/host.conf on this page not
obsolete by now. Looking at host.conf(5), one sees,=20

  Historical
       The  nsswitch.conf(5) file is the modern way of controlling the
       order of host lookups.

       In glibc 2.4 and earlier, the following keyword is recognized:

       order  This keyword specifies how host lookups are to  be  per=E2=
=80=90
              formed.   It  should  be  followed by one or more lookup
              methods, separated by commas.  Valid methods  are  bind,
              hosts, and nis.

So, it looks like some fix is required here also. Right?

Cheers,

Michael


> -.\" (See
> -.\" .BR resolv+ (8)).
> -The default action is to query
> -.BR named (8),
> -followed by
> -.IR /etc/hosts .
> +The default action is to query the Name Service Switch
> +.BR nsswitch.conf(5)
> +configured sources, followed by a local name server
> +.BR named (8).
>  .PP
>  The \fIhostent\fP structure is defined in \fI<netdb.h>\fP as follows=
:
>  .sp
> ---
>=20
> Cheers,
> Carlos.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
