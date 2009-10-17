From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Typo in setgid(2)
Date: Sat, 17 Oct 2009 06:41:08 +0200
Message-ID: <cfd18e0f0910162141r37a8e312q73230d9159e24352@mail.gmail.com>
References: <98644b8a0910152157k7f92a430u4d0eb41f1363ae2b@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <98644b8a0910152157k7f92a430u4d0eb41f1363ae2b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Noakes <jjnoakes-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Jasion,

On Fri, Oct 16, 2009 at 6:57 AM, Jason Noakes <jjnoakes-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> This is what I see on my system (I have manpages-dev-3.15-1 installed=
 on
> Ubuntu):
>
> =A0=A0=A0=A0=A0=A0 EPERM=A0 The calling process is not privileged (do=
es not have the
> CAP_SETGID capability), and gid=A0 does=A0 not=A0 match=A0 the=A0 eff=
ective
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 group ID or saved set-group-I=
D of the calling process.
>
> I believe "does not match the effective group ID" should read "does n=
ot
> match the real group ID", according to POSIX.

You just found a bug that's been present in the man page for 15 years
(since man-pages-1.4), and a bug that has security implications even.
Nice!

=46ixed for man-pages-3.24.

Thanks!

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
