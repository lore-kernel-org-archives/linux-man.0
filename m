From: "G.raud" <graud-KK0ffGbhmjU@public.gmane.org>
Subject: Re: select.2: s/minimum/maximum/
Date: Thu, 22 Aug 2013 17:38:49 +0200
Message-ID: <20130822153850.29990@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> Date: Thu, 22 Aug 2013 09:22:32 +0200
> From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Subject: Re: select.2: s/minimum/maximum/
>=20
> On 08/20/13 01:00, G.raud wrote:
> > In this part of the manpage:
> >=20
> > " The timeout argument specifies the minimum interval that select()
> > =C2=A0 should block waiting for a file descriptor to become ready. =
=C2=A0 =C2=A0 =C2=A0 =C2=A0"
>=20
> This isn't correct (though maybe there is room for a better wording).
>=20
> The 'timeout' places a ceiling on how long the call will block,
> but that ceiling has the *minimum* value provided by the argument.
> See what I mean?

The text that you cite and that is not correct is extracted from the
present manpage. =C2=A0The corrected text should be:

 " The timeout argument specifies the maximum interval that select()
 =C2=A0 should block waiting for a file descriptor to become ready. =C2=
=A0"

which is close to the POSIX description and is correct in that "specify=
"
does not mean "is equal to" but can be understood as "is close to",
which is all most of the programmers need to know.

I suggest prepending the following before the complete description bewt=
ween
parentheses if a better (i.e. more explicit) wording is desired:

 =C2=A0" timeout is a lower bound on the actual maximum waiting time."

--=20
G.raud Meyer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
