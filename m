From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] timegm.3: copy the string returned by getenv()
Date: Thu, 27 Jun 2013 00:30:43 +0200
Message-ID: <51CB6B93.2060400@gmail.com>
References: <1372259329-26397-1-git-send-email-jeremie.galarneau@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372259329-26397-1-git-send-email-jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?SsOpcsOpbWllIEdhbGFybmVhdQ==?= <jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/26/13 17:08, J=C3=A9r=C3=A9mie Galarneau wrote:
> The example of a portable version of timegm() uses the string returne=
d by
> getenv() after calling setenv() on the same environment variale. The =
tz
> string may be invalid as per getenv.3:
>=20
> "The string pointed to by the return value of getenv() may be statica=
lly
> allocated, and can be modified by a subsequent call to getenv(), pute=
nv(3),
> setenv(3), or unsetenv(3)."
>=20
> Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficio=
s.com>

Thanks, J=C3=A9r=C3=A9mie. I've applied your patch.

Cheers,

Michael


> ---
>  man3/timegm.3 | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/man3/timegm.3 b/man3/timegm.3
> index 3ab194b..0e71be5 100644
> --- a/man3/timegm.3
> +++ b/man3/timegm.3
> @@ -84,12 +84,15 @@ my_timegm(struct tm *tm)
>      char *tz;
> =20
>      tz =3D getenv("TZ");
> +    if (tz)
> +        tz =3D strdup(tz);
>      setenv("TZ", "", 1);
>      tzset();
>      ret =3D mktime(tm);
> -    if (tz)
> +    if (tz) {
>          setenv("TZ", tz, 1);
> -    else
> +        free(tz);
> +    } else
>          unsetenv("TZ");
>      tzset();
>      return ret;


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
