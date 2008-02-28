From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: epoll design problems with common fork/exec patterns
Date: Thu, 28 Feb 2008 14:12:58 +0100
Message-ID: <cfd18e0f0802280512q43a457d0sc9a8dc83c51e8e1c@mail.gmail.com>
References: <MDEHLPKNGKAHNMBLJOLKAEHCHNAC.davids@webmaster.com>
	 <Pine.LNX.4.64.0710291147180.3387@alien.or.mcafeemobile.com>
	 <47C42CA7.4030607@gmail.com>
	 <Pine.LNX.4.64.0802261049040.27243@alien.or.mcafeemobile.com>
	 <1204075804.5238.7.camel@linux.heathens.co.nz>
	 <Pine.LNX.4.64.0802271131180.377@alien.or.mcafeemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.64.0802271131180.377-GPJ85BhbkB8RepQJljzAVbITYcZ0+W3JAL8bYrjMMd8@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Cc: =?ISO-2022-JP?B?Q2hyaXMgIhskQiUvGyhCIiBIZWF0aA==?= <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>, David Schwartz <davids-Rrbileazn+l54TAoqtyWWQ@public.gmane.org>, dada1-fPLkHRcR87vqlBn2x/YWAg@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Feb 27, 2008 at 8:35 PM, Davide Libenzi <davidel-AhlLAIvw+VFwn5V/fVEdqA@public.gmane.org=
g> wrote:
> On Tue, 26 Feb 2008, Chris "=E3~B=AF" Heath wrote:
>
>  > On Tue, 2008-02-26 at 10:51 -0800, Davide Libenzi wrote:
>  > >
>
> > > Yes, you can't add the same fd twice. Think about a DB where "fil=
e*,fd" is
>  > > the key.
>  >
>  > To clarify, the key appears to be file* plus the user-space intege=
r that
>  > represents the fd.
>
>  Yes, that's what I said.
>
>  > > > c) It is possible to add duplicated file descriptors referring=
 to the same
>  > > > underlying open file description ("file *").  As you note, thi=
s can be a
>  > > > useful filtering technique, if the two file descriptors specif=
y different
>  > > > masks.
>  > > >
>  > > > Assuming that is all correct, for man-pages-2.79, I've reworke=
d the text
>  > > > for Q1/A1 as follows:
>  > > >
>  > > >        Q1     What  happens  if you add the same file descript=
or
>  > > >               to an epoll set twice?
>  > > >
>  > > >        A1     You will probably get EEXIST.  However, it is po=
s-
>  > > >               sible   to   add  a  duplicate  (dup(2),  dup2(2=
),
>  > > >               fcntl(2) F_DUPFD, fork(2)) descriptor to the  sa=
me
>  > > >               epoll  set.   This  can  be a useful technique f=
or
>  > > >               filtering events, if the duplicate  file  descri=
p-
>  > > >               tors are registered with different events masks.
>  > > >
>  > > > Seem okay Davide?
>  > >
>  > > Looks sane to me.
>  >
>  > I think fork(2) should not be in the above list.  fork(2) duplicat=
es the
>  > kernel's fd, but the user-space integer that represents the fd rem=
ains
>  > the same, so you will get EEXIST if you try to add the fd that was
>  > duplicated by fork.
>
>  Good catch, fork(2) should not be there.

Okay -- removed.

But it is an ugly inconsistency.  On the one hand, a child process
cannot add the duplicate file descriptor to the epoll set.  (In every
other case that I can think of , descriptors duplicated by fork have
similar semantics to descriptors duplicated by dup() and friends.)  On
the other hand, the very fact that the child has a duplicate of the
descriptor means that even if the parent closes its descriptor, then
epoll_wait() in the parent will continue to receive notifications for
that descriptor because of the duplicated descriptor in the child.

The choice of [file *, fd] as the key for epoll sets really does seem
unfortunate.  Keying on [pid, fd] would have given saner semantics, it
seems to me.  Obviously it can't be changed now though.

Cheers,

Michael


--=20
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
