From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: bug report: rtnetlink(7)
Date: Wed, 22 Sep 2010 16:04:44 +0200
Message-ID: <AANLkTin=V28M+3eFM0wFn+G84WkV0BCvOYnjqciehFL1@mail.gmail.com>
References: <63526fa40911240353wbdaa72cmff84b59b58df524c@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <63526fa40911240353wbdaa72cmff84b59b58df524c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?6JSh6L+w5a6q?= <caishuxian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Nov 24, 2009 at 1:53 PM, =B2=CC=CA=F6=CF=DC <caishuxian@gmail.c=
om> wrote:
> version: online pages
>
> number of errors: 2
>
> classification: typos

Hello =B2=CC=CA=F6=CF=DC,

Thanks for the report! Fixed for man-pages-3.27.

Cheers,

Michael


> bug description:
>
> RTNETLINK(7)                  Linux Programmer's Manual
> RTNETLINK(7)
> ...
> DESCRIPTION
> ...
>
>   Messages
>   ...
>     RTM_NEWADDR, RTM_DELADDR, RTM_GETADDR
>               Add, remove or receive information about an IP address
> associated with
>               an interface.  In Linux 2.2 an interface can carry mult=
iple IP
>
>               addresses, this replaces the alias device concept in 2.=
0.  In
> Linux 2.2
>               these messages support IPv4 and IPv6 addresses.  They c=
ontain
> an
>               ifaddrmsg structure, optionally followed by rtaddr rout=
ing
> attributes.
>
>
> ~~~~~typo for "rtattr"
>     ...
>     RTM_NEWNEIGH, RTM_DELNEIGH, RTM_GETNEIGH
>               ...
>               The rtaddr struct has the following meanings for the rt=
a_type
> field:
>
>                       ~~~~~typo for "rtattr"
>               ...
>
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
