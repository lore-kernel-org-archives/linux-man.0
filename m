From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Updates to information about man pages from other Debian packages
Date: Wed, 5 Oct 2011 08:23:39 +0200
Message-ID: <CAKgNAkjM_JaxmJvaYL-sV43COU==xkOAtjJmPP4+7iUp4c6K8A@mail.gmail.com>
References: <20111005054109.GA25122@gaara.hadrons.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111005054109.GA25122-v62vTE6/wQGgM1MOaoewpti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillem Jover <guillem-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Guillem,

On Wed, Oct 5, 2011 at 7:41 AM, Guillem Jover <guillem-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> Hi!
>
> The information about man pages from other packages on Debian-based
> systems on [0] could see some updates:
>
> =A0* Instead of using the available db (dpkg -p), recommend using the
> =A0 status db (the installed packages) with something like this inste=
ad:
>
> =A0 $ dpkg-query -f '${Maintainer}\n' -W mount
>
> =A0* The upstream maintainer is usually found in the copyright file:
>
> =A0 /usr/share/doc/<pkgname>/copyright
>
> =A0 although some times only the copyright holders are found there,
> =A0 otherwise the second best candidate might be the upstream
> =A0 changelog, found at:
>
> =A0 /usr/share/doc/<pkgname>/changelog.gz
>
> regards,
> guillem
>
> [0] <http://man7.org/linux/man-pages/man_pages_other.html>

So, looking on an Ubuntu system, I see

$ dpkg-query -f '${Maintainer}\n' -W mount
Ubuntu Core Developers <ubuntu-devel-discuss-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org>

Which is a little less informative than:

$ dpkg -p mount | grep Maintainer
Maintainer: Ubuntu Core Developers <ubuntu-devel-discuss-nLRlyDuq1AZJPExlwSBNcg@public.gmane.org=
om>
Original-Maintainer: LaMont Jones <lamont-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

I don't have a Debian system handy. Looking at
http://man7.org/linux/man-pages/man_pages_other.html, could you show
the complete commands plus output as you would expect to do it on your
system.

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
