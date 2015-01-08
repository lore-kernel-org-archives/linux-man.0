From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH 2/2] adjtimex.2: Change 'PPM' (parts per million) to 'ppm'
Date: Thu, 08 Jan 2015 17:29:14 +0100
Message-ID: <54AEB05A.8060603@supelec.fr>
References: <54A2DEAD.2050708@supelec.fr> <54A72360.3070807@supelec.fr> <54A724BE.8050409@supelec.fr> <54ABFD54.9000705@gmail.com> <54AC0250.5080005@supelec.fr> <54ACCB28.50100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54ACCB28.50100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Le 07/01/2015 06:59, Michael Kerrisk (man-pages) a =C3=A9crit :
> Hi Laurent,

Hi

> Looking more closely, it seems like your workflow may still be mangli=
ng the patches. Here's a portion of what landed when I save your messag=
e to a text file:
>=20
> [[
> -    long stabil;      /* PPS stability (scaled PPM, read-only) */
> +    long stabil;      /* PPS stability (2^-16 PPM (see NOTES), read-=
only=3D
> ) */
>      long jitcnt;      /* PPS jitter limit exceeded (read-only) */
>      long calcnt;      /* PPS calibration intervals (read-only) */
>      long errcnt;      /* PPS calibration errors (read-only) */
> @@ -343,6 +342,18 @@ and the caller does not have sufficient privileg=
e.
>  Under Linux, the
>  .B CAP_SYS_TIME
>  capability is required.
> +.SH NOTES
> +In struct
> +.IR timex ,
> +.IR freq ,
> +.IR ppsfreq ,
> +and=3D20
> +.I stabil
> +are PPM (parts per million) with a 16-bits fractional part, which me=
ans =3D
> that a
> +value of 1 in one of those fields actually means 2^-16 PPM, and 2^16=
=3D3D6=3D
> 5535 is=3D20
> +1 PPM. This is the case for both input values (in the case of
> +.IR freq )
> +and output values.
>  .SH CONFORMING TO
>  .BR adjtimex ()
>  is Linux-specific and should not be used in programs
> --=3D20
> ]]
>=20
> Note, for example, the line with 'long stabil', and the lines=20
> from 'are PPM (parts per million)' onward. Surprisingly, this all=20
> seemed to apply okay, just with some noise.
>=20
Indeed, that's very bad. I didn't notice that because I tested my patch=
 before sending it.
I copied and pasted the patch in a new file and it applied correctly, w=
ithout strange characters.
Maybe the mangling comes from the mailer when it adds the PGP signature=
=2E  I'll try without.

Again, I'm sorry about all this. I hope it'll work better now and that =
I'll stop wasting your time
instead of helping...

Laurent
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
