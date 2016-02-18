From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: strlen man-page misinformation
Date: Thu, 18 Feb 2016 14:12:30 +0100
Message-ID: <56C5C33E.7030407@gmail.com>
References: <56B237F9.8010206@cox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B237F9.8010206-j9pdmedNgrk@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Aversa <alan.aversa-j9pdmedNgrk@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Alan,

On 02/03/2016 06:25 PM, Alan Aversa wrote:
> Hello,
>=20
> The 2015-08-08 strlen man-page is incorrect. Here's a diff:
>=20
>     --- a/man3/strlen.3
>     +++ b/man3/strlen.3
>     @@ -45,7 +45,7 @@ excluding the terminating null byte (\(aq\\0\(a=
q).
>      .SH RETURN VALUE
>      The
>      .BR strlen ()
>     -function returns the number of bytes in the string
>     +function returns the number of *characters* in the string that
>     precede the terminating null character

I went for a simpler change: s/bytes/characters/

>      .IR s .
>      .SH ATTRIBUTES
>      For an explanation of the terms used in this section, see
>     @@ -60,7 +60,7 @@ T{
>      T}     Thread safety   MT-Safe
>      .TE
>      .SH CONFORMING TO
>     -POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.
>     +POSIX.1-2001, POSIX.1-2008, C89, C99, C11, SVr4, 4.3BSD.

=46ixed.

>      .SH SEE ALSO
>      .BR string (3),
>      .BR strnlen (3),
>=20
> Page 392 (PDF p. 390, =C2=A77.24.6.3) of the C11 standard
> <http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf> says:
>=20
>     The *strlen* function returns the number of characters that prece=
de
>     the terminating null character.

Thanks for the report. Interesting, POSIX.1 still uses the term "bytes"
the spec.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
