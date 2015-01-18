From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: utimensat(2) may/must confusion
Date: Sun, 18 Jan 2015 11:49:59 +0100
Message-ID: <54BB8FD7.1060501@gmail.com>
References: <CAJgzZooHgi2_kqTDLA42KhHOjH6byPQLap2-11KfpfV3TDb03A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJgzZooHgi2_kqTDLA42KhHOjH6byPQLap2-11KfpfV3TDb03A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: enh <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Elliot,


On 01/18/2015 02:54 AM, enh wrote:
> http://man7.org/linux/man-pages/man2/utimensat.2.html
>=20
>        If both tv_nsec fields are specified as UTIME_OMIT, then no fi=
le
>        ownership or permission checks are performed, and the file tim=
estamps
>        are not modified, but other error conditions may still be dete=
cted.
>=20
> fs/utimes.c
>=20
>                 /* Nothing to do, we must not even check the path.  *=
/
>                 if (tstimes[0].tv_nsec =3D=3D UTIME_OMIT &&
>                     tstimes[1].tv_nsec =3D=3D UTIME_OMIT)
>                         return 0;
>=20
> if you're intending to match POSIX, the current text is correct. they
> say "If both tv_nsec fields are set to UTIME_OMIT, no ownership or
> permissions check shall be performed for the file, but other error
> conditions may still be detected (including [EACCES] errors related t=
o
> the path prefix)."
> (http://pubs.opengroup.org/onlinepubs/9699919799/functions/futimens.h=
tml)
>=20
> but as the snippet above shows, the kernel doesn't, and so will
> silently return success even for a non-existent file if both times ar=
e
> UTIME_OMIT.

That's an interesting detail. I'm not sure if it was intended, but I=20
agree with what you seem to be saying: it doesn't violate the standard.
>
> i'm not sure why the kernel says "must", but even if they fix that, i=
t

Here's my hypothesis. The implementer of the system call was a German=20
speaker. The German verb "m=C3=BCssen" can be translated as "must" or=20
"to need to". But, while the verb seems like English "must", it's
also a "false friend", as language teachers sometimes say.=20
"Wir m=C3=BCessen nicht" might seem like it it means "We must not"
but rather, it means "We need not", which clearly is different.
I suspect that the author of the code and comments made an English
language misstep in the comment.=20

(It's not every day that I get to apply my mediocre German to=20
man-pages work!)

> would be useful for the man page to mention this subtlety. something
> like "(Note that at present the kernel performs no checks in this
> case, not even that the file exists, and will always return
> success.)". (strictly that's not true because the EFAULT check for th=
e
> struct timespec* will have happened, but it seems less clear to try t=
o
> include that fact.)

I'm reluctant to note that point too prominently, since it's=20
obviously not the kind of thing we want to encourage user-space=20
programmers to do, but at the bottom of NOTES, I added:

       If  both  tv_nsec  fields  are  specified as UTIME_OMIT, then th=
e
       Linux implementation of utimensat() succeeds  even  if  the  fil=
e
       referred to by dirfd and pathname does not exist.

Okay?

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
