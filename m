From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] nsswitch.conf.5: Update NSS compatibility mode
 description
Date: Sun, 17 Jan 2016 19:13:00 +0100
Message-ID: <569BD9AC.1080006@gmail.com>
References: <1452863553.3172.3.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452863553.3172.3.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 01/15/2016 02:12 PM, Nikola Forr=C3=B3 wrote:
>>From the current description of NSS compatibility mode it seems
> that /etc/passwd is the only file where special entries are permitted=
=2E
> But "compat" service can also be specified for group and shadow
> databases, so this needs to be changed.
>=20
> The list of special entries is for passwd database only, group
> and shadow databases are not mentioned.
> Because group database does not support netgroup special entries and
> it deals with groups, not users, it is better to make a separate list
> of entries for it.
>=20
> It is true that the default source for the compat pseudo-databases
> is "nis", but it can be overridden by any NSS service, not just
> "nisplus". Even "compat" itself can be specified as the source for
> the pseudo-databases, but doing that of course leads to infinite
> recursion, so it makes sense to disallow that.
>=20
> The information was obtained from glibc source code, namely from
> the following files:
> nis/nss_compat/compat-pwd.c
> nis/nss_compat/compat-grp.c
> nis/nss_compat/compat-spwd.c

Thanks, Nikola. Applied.

Cheers,

Michael


> Signed-off-by: Nikola Forr=C3=B3 <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man5/nsswitch.conf.5 | 40 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 34 insertions(+), 6 deletions(-)
>=20
> diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
> index 40ca9dc..f78bf85 100644
> --- a/man5/nsswitch.conf.5
> +++ b/man5/nsswitch.conf.5
> @@ -260,16 +260,22 @@ Call the next lookup function.
>  .RE
>  .SS Compatibility mode (compat)
>  The NSS "compat" service is similar to "files" except that it
> -additionally permits special entries in
> -.I /etc/passwd
> +additionally permits special entries in corresponding files
>  for granting users or members of netgroups access to the system.
>  The following entries are valid in this mode:
>  .RS 4
> +.LP
> +For
> +.B passwd
> +and
> +.B shadow
> +databases:
> +.RS 4
>  .TP 12
>  .BI + user
>  Include the specified
>  .I user
> -from the NIS passwd map.
> +from the NIS passwd/shadow map.
>  .TP
>  .BI +@ netgroup
>  Include all users in the given
> @@ -278,7 +284,7 @@ Include all users in the given
>  .BI \- user
>  Exclude the specified
>  .I user
> -from the NIS passwd map.
> +from the NIS passwd/shadow map.
>  .TP
>  .BI \-@ netgroup
>  Exclude all users in the given
> @@ -286,11 +292,33 @@ Exclude all users in the given
>  .TP
>  .B +
>  Include every user, except previously excluded ones, from the
> -NIS passwd map.
> +NIS passwd/shadow map.
> +.RE
> +.LP
> +For
> +.B group
> +database:
> +.RS 4
> +.TP 12
> +.BI + group
> +Include the specified
> +.I group
> +from the NIS group map.
> +.TP
> +.BI \- group
> +Exclude the specified
> +.I group
> +from the NIS group map.
> +.TP
> +.B +
> +Include every group, except previously excluded ones, from the
> +NIS group map.
> +.RE
>  .RE
>  .LP
>  By default, the source is "nis", but this may be
> -overridden by specifying "nisplus" as the source for the pseudo-data=
bases
> +overridden by specifying any NSS service except "compat" itself
> +as the source for the pseudo-databases
>  .BR passwd_compat ,
>  .BR group_compat ,
>  and
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
