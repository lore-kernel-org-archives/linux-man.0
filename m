From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: lseek(2) BSD buglet
Date: Sat, 11 Sep 2010 06:18:58 +0200
Message-ID: <AANLkTin69YtLQCTpUfxMKNZ9-QC9bZxr+Yt1_q1hV8Eg@mail.gmail.com>
References: <201008111813.OAA03192@Sparkle.Rodents-Montreal.ORG>
 <20100814094840.GA6217@infradead.org> <201008141409.KAA00313@Sparkle.Rodents-Montreal.ORG>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201008141409.KAA00313-23rEAq0nvmRBjDB12xDq2QQ+uF9fDdDi0Z6qq+Mcf0E@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: der Mouse <mouse-NcIlfYlhY41Ekk/fuQG8RGD2FQJk+8+b@public.gmane.org>, mouse-S783fYmB3Ccdnm+yROfE0A@public.gmane.org, mouse-N7zJMUF80UksA/PxXw9srA@public.gmane.org
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Sat, Aug 14, 2010 at 4:09 PM, der Mouse <mouse-NcIlfYlhY41Ekk/fuQG8RGD2FQJk+8+b@public.gmane.org>=
 wrote:
>>> lseek(2) (noticed on 3.23, 3.25 has similar wording) says, in part,
>
>>> =A0 =A0 =A0 =A0SVr1-3 returns long instead of off_t, BSD returns in=
t.
>
>> I think removing it is fine. =A0Historical SysV and BSD behaviour mi=
ght
>> have been interesting in the early 90s, but these days it's somethin=
g
>> for a history book and not a manual page.

I agree. I removed this entire line.

> Sounds like a reasonable point of view to me.
>
> However, since the manpages are also one of the places people go when
> trying to figure out old code, I'd probably not delete it entirely bu=
t
> instead replace it with something alojng the lines of
>
> =A0 =A0 =A0 =A0Hisorical practice has varied, but modern systems unif=
ormly use
> =A0 =A0 =A0 =A0off_t.
>
> But, really, even that may be more than is worth bothering with; it's
> been a long time since lseek returning non-off_t mattered to anyone b=
ut
> hardcore retrocomputing geeks.

Yes.

Thanks for the note. The change will be in Linux man-pages-3.27.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
