From: =?iso-8859-1?Q?J=F6rn?= Engel <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org>
Subject: Re: mlockall(MCL_FUTURE) implies MAP_POPULATE
Date: Thu, 17 Dec 2015 09:54:28 -0800
Message-ID: <20151217175428.GF5070@Sligo.logfs.org>
References: <20151028010510.GF21688@Sligo.logfs.org>
 <CAFs=pgb+LatY8WKV+sZsvgUGMtzVsSxwX0FTKx3u5Nuj1AiOYg@mail.gmail.com>
 <20151216185006.GA31243@Sligo.logfs.org>
 <56725EED.80502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56725EED.80502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Dec 17, 2015 at 08:06:21AM +0100, Michael Kerrisk (man-pages) w=
rote:
>=20
> So, I just realized that a recent change to the API, plus its
> associated documentation in the mlock(2) pages actually probably
> lessens the chance of this mistake. The next release of man-pages
> will include documentation of MCL_ONFAULT:
>=20
>        MCL_CURRENT Lock  all pages which are currently mapped into th=
e
>                    address space of the process.
>=20
>        MCL_FUTURE  Lock all pages which will become  mapped  into  th=
e
>                    address  space of the process in the future.  Thes=
e
>                    could be, for instance, new  pages  required  by  =
a
>                    growing heap and stack as well as new memory-mappe=
d
>                    files or shared memory regions.
>=20
>        MCL_ONFAULT (since Linux 4.4)
>                    Used  together  with  MCL_CURRENT,  MCL_FUTURE,  o=
r
>                    both.   Mark  all  current  (with  MCL_CURRENT)  o=
r
>                    future (with MCL_FUTURE)  mappings  to  lock  page=
s
>                    when  they are faulted in.  When used with MCL_CUR=
=E2=80=90
>                    RENT, all present pages are locked, but  mlockall(=
)
>                    will  not  fault  in  non-present pages.  When use=
d
>                    with MCL_FUTURE, all future mappings will be marke=
d
>                    to  lock  pages  when they are faulted in, but the=
y
>                    will not be populated by the lock when the  mappin=
g
>                    is  created.   MCL_ONFAULT must be used with eithe=
r
>                    MCL_CURRENT or MCL_FUTURE or both.
>=20
> Do you think that text helps?

Yes.  It seems foolproof for the one fool that is me.

Thank you!

J=C3=B6rn

--
It does not matter how slowly you go, so long as you do not stop.
-- Confucius
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
