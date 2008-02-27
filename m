From: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Subject: Re: epoll design problems with common fork/exec patterns
Date: Wed, 27 Feb 2008 11:35:11 -0800 (PST)
Message-ID: <Pine.LNX.4.64.0802271131180.377@alien.or.mcafeemobile.com>
References: <MDEHLPKNGKAHNMBLJOLKAEHCHNAC.davids@webmaster.com>
 <Pine.LNX.4.64.0710291147180.3387@alien.or.mcafeemobile.com>
 <47C42CA7.4030607@gmail.com>  <Pine.LNX.4.64.0802261049040.27243@alien.or.mcafeemobile.com>
 <1204075804.5238.7.camel@linux.heathens.co.nz>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="1795850513-65606325-1204140911=:377"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1204075804.5238.7.camel-DBi1IKlRe8YXiSwHZUBl+UgmxNRb6L7S@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris =?UTF-8?Q?=22=E3=82=AF=22?= Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, David Schwartz <davids-Rrbileazn+l54TAoqtyWWQ@public.gmane.org>, dada1-fPLkHRcR87vqlBn2x/YWAg@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1795850513-65606325-1204140911=:377
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 26 Feb 2008, Chris "=E3~B=AF" Heath wrote:

> On Tue, 2008-02-26 at 10:51 -0800, Davide Libenzi wrote:
> >=20
> > Yes, you can't add the same fd twice. Think about a DB where "file*,fd"=
 is=20
> > the key.
>=20
> To clarify, the key appears to be file* plus the user-space integer that
> represents the fd.

Yes, that's what I said.



> > > c) It is possible to add duplicated file descriptors referring to the=
 same
> > > underlying open file description ("file *").  As you note, this can b=
e a
> > > useful filtering technique, if the two file descriptors specify diffe=
rent
> > > masks.
> > >=20
> > > Assuming that is all correct, for man-pages-2.79, I've reworked the t=
ext
> > > for Q1/A1 as follows:
> > >=20
> > >        Q1     What  happens  if you add the same file descriptor
> > >               to an epoll set twice?
> > >=20
> > >        A1     You will probably get EEXIST.  However, it is pos-
> > >               sible   to   add  a  duplicate  (dup(2),  dup2(2),
> > >               fcntl(2) F_DUPFD, fork(2)) descriptor to the  same
> > >               epoll  set.   This  can  be a useful technique for
> > >               filtering events, if the duplicate  file  descrip-
> > >               tors are registered with different events masks.
> > >=20
> > > Seem okay Davide?
> >=20
> > Looks sane to me.
>=20
> I think fork(2) should not be in the above list.  fork(2) duplicates the
> kernel's fd, but the user-space integer that represents the fd remains
> the same, so you will get EEXIST if you try to add the fd that was
> duplicated by fork.

Good catch, fork(2) should not be there.



- Davide


--1795850513-65606325-1204140911=:377--
