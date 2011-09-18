From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: lseek(2): in defense of "whence"
Date: Sun, 18 Sep 2011 19:49:35 +0200
Message-ID: <CAKgNAkhoym+z73Evyzp5neUuQXKyJLRUGvkH=yKPuDxWFqXQ4A@mail.gmail.com>
References: <20110213043557.18773.qmail@kosh.dhis.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110213043557.18773.qmail-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Alan,

On Sun, Feb 13, 2011 at 5:35 AM,  <pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org> wrote:
> According to man2/lseek.2,
>
> =A0This document's use of whence is incorrect English, but maintained=
 for
> =A0historical reasons.
>
> What is the grammatical objection?

It's a mystery to me too.

> From WordNet (r) 3.0 (2006) [wn]:
> =A0whence
> =A0 =A0 =A0adv 1: from what place, source, or cause
>
> Wiktionary:
> =A0[edit] Adverb
> =A0whence (not comparable)
> =A0 1. From where; from which place or source.
>
> lseek's second parameter is a distance to be traveled, and the third
> parameter chooses the starting point from which that distance is meas=
ured.
> How is that not a "whence"?

Quite.

> Looking at some man page archives, I found that the accusation of inc=
orrect
> English goes back to before 4.4BSD. It survives not just in the
> linux-man-pages but also in recent versions of {Net,Open,Free}BSD. Th=
e name
> "whence" for this parameter goes back at least to V7.
>
> Of all the people who have read this page over the years, am I the on=
ly one
> wondering... what's this about? Who decided that "whence" was incorre=
ct and
> put that note in the man page? Was there ever anything wrong, or do w=
e have
> someone's 20-year-old unresearched pet peeve lingering in the man pag=
es?

It beats me. But I agree with you and I've removed that sentence from
man-pages-3.34.

Thanks also to Reuben, who made a similar recent report.

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
