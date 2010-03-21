From: Johannes Stezenbach <js-FF7aIK3TAVNeoWH0uzbU5w@public.gmane.org>
Subject: Re: execve for script don't return ENOEXEC, bug ?
Date: Sun, 21 Mar 2010 20:16:19 +0100
Message-ID: <20100321191619.GA5235@sig21.net>
References: <4BA50C76.9070603@davidnewall.com>
 <876436.86374.qm@web110307.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <876436.86374.qm-3jHsvP0p17FeqboJWQvT7/u2YVrzzGjVVpNB7YpNyf8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valery Reznic <valery_reznic-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: David Newall <davidn-KzQzY1MbaKjAHznzqCTclw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

(Cc: man page maintainer)

On Sun, Mar 21, 2010 at 01:33:28AM -0700, Valery Reznic wrote:
> --- On Sat, 3/20/10, David Newall <davidn-KzQzY1MbaKjAHznzqCTclw@public.gmane.org> wrote:
> > Valery Reznic wrote:
> > > execve's man page state that script's interprtert
> > > should not be interpreter itself:
=2E..
> > > To me it looks like=A0 execve and it's man page
> > > disagree. Do you know is it new intended behaviour of execve
> > > and just man page wasn't update or it's a bug in execve ?
> >=20
> > Code and man pages do sometimes disagree.=A0 I shan't
> > address what the correct behaviour is, because if you ask
> > three people you're sure to get four different answers,
> > rather let's discuss what is desirable.=A0 Without
> > looking at how it works, we observe that a.sh can be
> > executed without error.=A0 If a.out were written in C it
> > would qualify as an acceptable interpreter according to the
> > man page, so why should it not qualify if it is
> > interpreted?=A0 I think it's desirable that it does
> > qualify.=A0 There could be sound reasons why only one
> > level of interpreter can be invoked.=A0 Perhaps loading a
> > script interpreter is done as an exception in exec, and it's
> > too ugly to allow recursive exceptions.=A0 That would be
> > a fair reason.=A0 But if there's no reason, then don't
> > have the restriction*.=A0 Linux now apparently does
> > permit interpreted interpreters, and I say that is the
> > desirable result.
> For some reason I tough that ENOEXEC for 'interpreted interpreter' is=
 posix
> requirement. But after closer look it appear to be only arbitrary res=
triction
> now lifted in Linux.
>=20
> I had a look at the source http://tomoyo.sourceforge.jp/cgi-bin/lxr/s=
ource/fs/binfmt_misc.c
> and it's obvious that 'interpreted interpreter' is intentional (and r=
ecursion depth is 4).
> So, execve is behave as it should and only man page is lag behind.
> Thank you for you help/
>=20
>=20
> Just curios - who use this feature in the real world and what for ?

It seems to have been changed in commit bf2a9a39639b8b51377905397a5005f=
444e9a892.
Maybe you could ask the author for details.


Johannes
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
