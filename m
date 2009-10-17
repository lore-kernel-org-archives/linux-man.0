From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Typo in Man Page
Date: Sat, 17 Oct 2009 06:50:16 +0200
Message-ID: <cfd18e0f0910162150p59674577wa9ad831d0353d646@mail.gmail.com>
References: <D2644930-9895-4652-B915-77ADBEF40123@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D2644930-9895-4652-B915-77ADBEF40123-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Goldfine-Middleton <jasonwoodfine-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jason,

On Sun, Oct 11, 2009 at 9:56 AM, Jason Goldfine-Middleton
<jasonwoodfine-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> In the Description=A0section of the GROUP(5) manual page, there is an
> inconsistency:
> group_name:passwd:GID:user_list
> password
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0the (encrypted) group password. =A0If =A0=
this =A0field =A0is =A0empty,
> =A0no
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0password is needed.

Thanks. I fixed this for man-pages-3.24, s/passwd/password/.

Cheers,

Michael


> --------------------------------------------------------------
> Jason Goldfine-Middleton
> jasonwoodfine-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>
> Knowing=A0others is wisdom;
> Knowing=A0the self is enlightenment.
> Mastering=A0others requires force;
> Mastering=A0the self needs strength.
> - Tao Te Ching 33
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
