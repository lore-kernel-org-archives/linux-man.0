From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man page mlock/munlock
Date: Tue, 21 Jul 2015 20:50:18 +0200
Message-ID: <CAKgNAkjMuMdu952zj_3kL7cmC-xeRzTzDo_2emxwjEoG+2YVFQ@mail.gmail.com>
References: <87k2wm84eo.fsf@student.vu.nl>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87k2wm84eo.fsf-oe7qfRrRQfcprfpi5Sxi9A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mehdi Aqadjani Memar <m.aqadjanimemar-oe7qfRrRQfcprfpi5Sxi9A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Mehdi

On 6 May 2015 at 10:49, Mehdi Aqadjani Memar
<m.aqadjanimemar-oe7qfRrRQfcprfpi5Sxi9A@public.gmane.org> wrote:
> Dear Michael Kerrisk,
> in my application I am using munlock() as described in the man page. =
munlock()
> fails and returns ENOMEM. The man page for this error has not helped =
me to find
> out what the problem was. I traced my code and discovered that this e=
rror
> appears when "the process's maximum number of mappings would have bee=
n
> exceeded", as it is mentioned at the man page of mmap(). This happens=
 because
> munlock() splits the vma's.
> I believe that this information should be a part of the man page of m=
unlock().
> --
> Met vriendelijke groet/Kind regards
> Mehdi Aqadjani Memar

Thanks for the report, and sorry for the delayed response. I've
confirmed your point. How would the following text be:

       ENOMEM Locking  or  unlocking  a region would result in the tota=
l
              number of mappings with distinct attributes (e.g.,  locke=
d
              versus  unlocked)  exceeding  the  allowed  maximum.  (Fo=
r
              example, unlocking a range in the middle  of  a  currentl=
y
              locked  mapping would result in three mappings: two locke=
d
              mappings at each end and an unlocked mapping in  the  mid=
=E2=80=90
              dle.)
?

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
