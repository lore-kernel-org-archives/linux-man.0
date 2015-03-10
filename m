From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug#773443: [PATCH] host.conf.5: keywords and env. var. nospoof,
 spoofalert, spoof and RESOLV_SPOOF_CHECK were added to glibc 2.0.7 but never
 implemented
Date: Tue, 10 Mar 2015 07:20:51 +0100
Message-ID: <54FE8D43.4070306@gmail.com>
References: <20150309232628.GA17006@free.fr> <1425943648-17928-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425943648-17928-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>, 773443-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/10/2015 12:27 AM, St=C3=A9phane Aulery wrote:
> Move descriptions to historical section and reorder it for clarity

Thanks, St=C3=A9phane.

Applied. But please make patch titles shorter (<72 chars) --move text=20
to the body of the commit message as needed.

Thanks,

Michael


> Debian Bug #773443 reported by ygrex-dSU6fMGyTqw@public.gmane.org
>=20
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D773443
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man5/host.conf.5 | 125 ++++++++++++++++++++++++++++-----------------=
----------
>  1 file changed, 63 insertions(+), 62 deletions(-)
>=20
> diff --git a/man5/host.conf.5 b/man5/host.conf.5
> index 9ff2ed3..08da435 100644
> --- a/man5/host.conf.5
> +++ b/man5/host.conf.5
> @@ -66,52 +66,6 @@ This is
>  by default, as it may cause a substantial performance loss at sites
>  with large hosts files.
>  .TP
> -.I nospoof
> -Valid values are
> -.IR on " and " off .
> -If set to
> -.IR on ,
> -the resolv+ library will attempt to prevent hostname spoofing to
> -enhance the security of
> -.BR rlogin " and " rsh .
> -It works as follows: after performing a host address lookup, resolv+
> -will perform a hostname lookup for that address.
> -If the two hostnames
> -do not match, the query will fail.
> -The default value is
> -.IR off .
> -.TP
> -.I spoofalert
> -Valid values are
> -.IR on " and " off .
> -If this option is set to
> -.I on
> -and the
> -.I nospoof
> -option is also set, resolv+ will log a warning of the error via the
> -syslog facility.
> -The default value is
> -.IR off .
> -.TP
> -.I spoof
> -Valid values are
> -.IR off ", " nowarn " and " warn .
> -If this option is set to
> -.IR off ,
> -spoofed addresses are permitted and no warnings will be emitted
> -via the syslog facility.
> -If this option is set to
> -.IR warn ,
> -resolv+ will attempt to prevent hostname spoofing to
> -enhance the security and log a warning of the error via the syslog
> -facility.
> -If this option is set to
> -.IR nowarn ,
> -the resolv+ library will attempt to prevent hostname spoofing to
> -enhance the security but not emit warnings via the syslog facility.
> -Setting this option to anything else is equal to setting it to
> -.IR nowarn .
> -.TP
>  .I reorder
>  Valid values are
>  .IR on " and " off .
> @@ -133,15 +87,6 @@ override the behavior which is configured in
>  If set, this variable points to a file that should be read instead o=
f
>  .IR /etc/host.conf .
>  .TP
> -.B RESOLV_SPOOF_CHECK
> -Overrides the
> -.IR nospoof ", " spoofalert " and " spoof
> -commands in the same way as the
> -.I spoof
> -command is parsed.
> -Valid values are
> -.IR off ", " nowarn " and " warn .
> -.TP
>  .B RESOLV_MULTI
>  Overrides the
>  .I multi
> @@ -184,6 +129,10 @@ can take arguments like
>  .IR off ", " nowarn " and " warn .
>  Line comments can appear anywhere and not only at the beginning of a=
 line.
>  .SS Historical
> +The
> +.BR nsswitch.conf (5)
> +file is the modern way of controlling the order of host lookups.
> +.PP
>  In glibc 2.4 and earlier, the following keyword is recognized:
>  .TP
>  .I order
> @@ -191,15 +140,67 @@ This keyword specifies how host lookups are to =
be performed.
>  It should be followed by one or more lookup methods, separated by co=
mmas.
>  Valid methods are
>  .IR bind ", " hosts ", and " nis .
> -The
> +.TP
>  .B RESOLV_SERV_ORDER
> -environment variable could be used to override the
> -.I order
> -command.
> +Overrides the order command.
>  .PP
> -The
> -.BR nsswitch.conf (5)
> -file is the modern way of controlling the order of host lookups.
> +Since glibc 2.0.7, the following keywords and environment variable h=
ave
> +been recognized but never implemented:
> +.TP
> +.I nospoof
> +Valid values are
> +.IR on " and " off .
> +If set to
> +.IR on ,
> +the resolv+ library will attempt to prevent hostname spoofing to
> +enhance the security of
> +.BR rlogin " and " rsh .
> +It works as follows: after performing a host address lookup, resolv+
> +will perform a hostname lookup for that address.
> +If the two hostnames
> +do not match, the query will fail.
> +The default value is
> +.IR off .
> +.TP
> +.I spoofalert
> +Valid values are
> +.IR on " and " off .
> +If this option is set to
> +.I on
> +and the
> +.I nospoof
> +option is also set, resolv+ will log a warning of the error via the
> +syslog facility.
> +The default value is
> +.IR off .
> +.TP
> +.I spoof
> +Valid values are
> +.IR off ", " nowarn " and " warn .
> +If this option is set to
> +.IR off ,
> +spoofed addresses are permitted and no warnings will be emitted
> +via the syslog facility.
> +If this option is set to
> +.IR warn ,
> +resolv+ will attempt to prevent hostname spoofing to
> +enhance the security and log a warning of the error via the syslog
> +facility.
> +If this option is set to
> +.IR nowarn ,
> +the resolv+ library will attempt to prevent hostname spoofing to
> +enhance the security but not emit warnings via the syslog facility.
> +Setting this option to anything else is equal to setting it to
> +.IR nowarn .
> +.TP
> +.B RESOLV_SPOOF_CHECK
> +Overrides the
> +.IR nospoof ", " spoofalert " and " spoof
> +commands in the same way as the
> +.I spoof
> +command is parsed.
> +Valid values are
> +.IR off ", " nowarn " and " warn .
>  .SH SEE ALSO
>  .BR gethostbyname (3),
>  .BR hosts (5),
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
