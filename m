From: =?UTF-8?B?RGF2aWQgUHLDqXZvdA==?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mbsrtowcs, mbsnrtowcs: wfix
Date: Sun, 16 Oct 2011 09:15:46 -0400
Message-ID: <j7ele2$mvr$1@dough.gmane.org>
References: <1318641386-24095-1-git-send-email-taffit@debian.org> <CAKgNAkhee9nOi0p5B+XHRrd6hW6W4CxogO-dYLh3KhNA-7hDGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhee9nOi0p5B+XHRrd6hW6W4CxogO-dYLh3KhNA-7hDGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Michael,

Le 16/10/2011 02:09, Michael Kerrisk a =C3=A9crit :

> and you meant in both cases to change "null wide" to
> "null", right?

Sure, sorry about that.

> But, more generally, I think you are saying that there were some
> pieces of my older e9c23bc636426366d659809bc99cd84661e86464 that
> incorrectly changed "[terminating] null character" to "[terminating]
> null wide character", right?

I didn't checked them all (yet), but your example bellow seems to concu=
r
with that assumption.

> I suspect that the first of my changes to mbstowcs.3 below was
> also incorrect. Can you confirm?

>  The multibyte string has been completely converted, including the
> -terminating \(aq\\0\(aq.
> +terminating null wide character (\(aq\\0\(aq).

The change is indeed wrong, since \(aq\\0\(aq (i.e. '\0') is the
terminating null byte (or character, but I think you tried to
consistently use =E2=80=9Cbyte=E2=80=9D in your last changes), which is=
 different from
L\(aq\\0\(aq (i.e. L'\0'), the terminating null wide character.

> PS See also 3c81e148a228550b4ce3d20a9c68ce0eb91cef07, which I just
> pushed (to github). Do you agree with that change?

Given the context (wide =E2=86=92 multibyte), I agree that the =E2=80=9C=
terminating
null=E2=80=9D in the destination string should be the terminating null =
byte
('\0'), but I didn't check the source code, or didn't test it either
(just came across the previous inconsistencies while updating the Frenc=
h
translations of these pages).

Regards

David

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOmtj+AAoJELgqIXr9/gny9P4QAKWp9R22ZaSzHEPycEgcsqSw
/H+BwFGpCgEX+Z0AWm2NSX4gc+5XPiX/gJQpOkFzMlRJ17no6KfLEaxSxV8cHKzJ
8NnYa6eK5KMbCg4QBicNi6BKiiLj35QY1h3h70HX/pmcbr0gmbEexuqj/dwnwBPB
1WPwpZ3fcNzCYRDZzEkzXOfXhoFlGC+XfOOC5Uwn56TEXx03gGFeJsCTRW9V7lzX
0VL9n8E3FLGJSW8Am/EQ8hGzwGbiuzXaJntkwNj3b5kaof/wc7iwo82xwgX3Nc+K
l6+d+NuK1hbY8Cvu81B0jOtv6MTdPR14x5lo0YtM/onLHKs5a4Rt149/sH0zlGQO
uAEh+FEv59D0qvJkkeZsXpWjehqs1YJDv82bRcfz5H4ZIVUzJTnKhBQnI4MjX2m9
gTNg1eiC7+Jt0qge5L7PRwVGuxiCI1MG5tGeogiGdv/GCEIqJ6OFwQjeFjk3Iz1m
pTvm0AcLyNz/w70rGQ8vfIsPscuIy1tY0t00vioIDaHv6kAdCuYVytU33OHK5jWQ
xdXMwWGdwWH1nYjhYU5gwoFsQUQpgmHugwTgXsEIgvgvopGp9OhHLd+kcDUw7Uyn
3HVBdDG522B4TwstBTdpyMMhlOgRAGvBHsfYVrvtIecHm/JgxLwoPr2KLyC1n9MD
/iuRZR2+K6YdTAfen3vi
=3DB/Qv
-----END PGP SIGNATURE-----

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
