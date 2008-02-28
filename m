From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: epoll design problems with common fork/exec patterns
Date: Thu, 28 Feb 2008 14:23:34 +0100
Message-ID: <cfd18e0f0802280523p1bdacfc5s274387f8280238c8@mail.gmail.com>
References: <MDEHLPKNGKAHNMBLJOLKAEHCHNAC.davids@webmaster.com>
	 <Pine.LNX.4.64.0710291147180.3387@alien.or.mcafeemobile.com>
	 <47C42CA7.4030607@gmail.com>
	 <Pine.LNX.4.64.0802261049040.27243@alien.or.mcafeemobile.com>
	 <1204075804.5238.7.camel@linux.heathens.co.nz>
	 <Pine.LNX.4.64.0802271131180.377@alien.or.mcafeemobile.com>
	 <cfd18e0f0802280512q43a457d0sc9a8dc83c51e8e1c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0802280512q43a457d0sc9a8dc83c51e8e1c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Cc: =?ISO-2022-JP?B?Q2hyaXMgIhskQiUvGyhCIiBIZWF0aA==?= <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>, David Schwartz <davids-Rrbileazn+l54TAoqtyWWQ@public.gmane.org>, dada1-fPLkHRcR87vqlBn2x/YWAg@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Feb 28, 2008 at 2:12 PM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>
> On Wed, Feb 27, 2008 at 8:35 PM, Davide Libenzi <davidel@xmailserver.=
org> wrote:
>  > On Tue, 26 Feb 2008, Chris "=E3~B=AF" Heath wrote:
>  >
>  >  > On Tue, 2008-02-26 at 10:51 -0800, Davide Libenzi wrote:
>  >  > >
>  >
>  > > > Yes, you can't add the same fd twice. Think about a DB where "=
file*,fd" is
>  >  > > the key.
>  >  >
>  >  > To clarify, the key appears to be file* plus the user-space int=
eger that
>  >  > represents the fd.
>  >
>  >  Yes, that's what I said.
>  >
>  >  > > > c) It is possible to add duplicated file descriptors referr=
ing to the same
>  >  > > > underlying open file description ("file *").  As you note, =
this can be a
>  >  > > > useful filtering technique, if the two file descriptors spe=
cify different
>  >  > > > masks.
>  >  > > >
>  >  > > > Assuming that is all correct, for man-pages-2.79, I've rewo=
rked the text
>  >  > > > for Q1/A1 as follows:
>  >  > > >
>  >  > > >        Q1     What  happens  if you add the same file descr=
iptor
>  >  > > >               to an epoll set twice?
>  >  > > >
>  >  > > >        A1     You will probably get EEXIST.  However, it is=
 pos-
>  >  > > >               sible   to   add  a  duplicate  (dup(2),  dup=
2(2),
>  >  > > >               fcntl(2) F_DUPFD, fork(2)) descriptor to the =
 same
>  >  > > >               epoll  set.   This  can  be a useful techniqu=
e for
>  >  > > >               filtering events, if the duplicate  file  des=
crip-
>  >  > > >               tors are registered with different events mas=
ks.
>  >  > > >
>  >  > > > Seem okay Davide?
>  >  > >
>  >  > > Looks sane to me.
>  >  >
>  >  > I think fork(2) should not be in the above list.  fork(2) dupli=
cates the
>  >  > kernel's fd, but the user-space integer that represents the fd =
remains
>  >  > the same, so you will get EEXIST if you try to add the fd that =
was
>  >  > duplicated by fork.
>  >
>  >  Good catch, fork(2) should not be there.
>
>  Okay -- removed.
>
>  But it is an ugly inconsistency.  On the one hand, a child process
>  cannot add the duplicate file descriptor to the epoll set.  (In ever=
y
>  other case that I can think of , descriptors duplicated by fork have
>  similar semantics to descriptors duplicated by dup() and friends.)  =
On
>  the other hand, the very fact that the child has a duplicate of the
>  descriptor means that even if the parent closes its descriptor, then
>  epoll_wait() in the parent will continue to receive notifications fo=
r
>  that descriptor because of the duplicated descriptor in the child.
>
>  The choice of [file *, fd] as the key for epoll sets really does see=
m
>  unfortunate.  Keying on [pid, fd] would have given saner semantics, =
it
>  seems to me.  Obviously it can't be changed now though.


Davide,

with the earlier discussion in this thread in mind, I added a Q0/A0 to
epoll.7, just make the point about keys clear:


       Q0  What is the key used to distinguish the file descrip-
           tors in an epoll set?

       A0  The key is the combination  of  the  file  descriptor
           number  and  the open file description (also known as
           "open file handle", the kernel's internal representa-
           tion of an open file).

Does that seem okay?

Cheers,

Michael

--=20
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
