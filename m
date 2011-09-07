From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: spelling error in man page of strncpy
Date: Wed, 7 Sep 2011 21:26:59 +0200
Message-ID: <CAKgNAkjWR=Y04r8iJq4FpM3GFgDMg-CLF5aFHx3WKAs6bysX-Q@mail.gmail.com>
References: <AANLkTim29PVzCycqOmaETSRyS=KJhjFKwac_yz452Reb@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTim29PVzCycqOmaETSRyS=KJhjFKwac_yz452Reb-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Vervelakis <vervelak-49+yhFPIGMysTnJN9+BGXg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Nikos,

On Thu, Mar 10, 2011 at 3:42 PM, Nikos Vervelakis <vervelak-49+yhFPIGMysTnJN9+BGXg@public.gmane.org>=
 wrote:
> Hello
> in the man page of strncpy is a simple implementation that dosn't wor=
k
> an error was found in the secont for loop.
> =A0it must be "for ( ; i <=3D n ; i++) dest[i] =3D '\0';" insteed of =
"for ( ; i <
> n ; i++) dest[i] =3D '\0';"
> =A0=A0=A0=A0=A0=A0 A simple implementation of strncpy() might be:

At a quick glance, I don't think this report is correct. Could you
please add more detail on a specific case where you think the
implementation is broken?

Thanks,

Michael
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 char*
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 strncpy(char *dest, const char *src, s=
ize_t n){
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 size_t i;
>
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 for (i =3D 0 ; i < n && sr=
c[i] !=3D '\0' ; i++)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dest[i] =3D sr=
c[i];
> --->=A0=A0=A0=A0=A0=A0=A0=A0=A0 for ( ; i < n ; i++)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dest[i] =3D '\=
0';
>
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dest;
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>
> Thanks
> vervelak.
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
