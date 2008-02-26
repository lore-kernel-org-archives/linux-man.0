From: Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Subject: Re: epoll design problems with common fork/exec patterns
Date: Tue, 26 Feb 2008 10:51:55 -0800 (PST)
Message-ID: <Pine.LNX.4.64.0802261049040.27243@alien.or.mcafeemobile.com>
References: <MDEHLPKNGKAHNMBLJOLKAEHCHNAC.davids@webmaster.com>
 <Pine.LNX.4.64.0710291147180.3387@alien.or.mcafeemobile.com>
 <47C42CA7.4030607@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <47C42CA7.4030607-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: David Schwartz <davids-Rrbileazn+l54TAoqtyWWQ@public.gmane.org>, dada1-fPLkHRcR87vqlBn2x/YWAg@public.gmane.org, "Chris \"?\" Heath" <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, 26 Feb 2008, Michael Kerrisk wrote:

> Davide Libenzi wrote:
> > On Sun, 28 Oct 2007, David Schwartz wrote:
> > 
> >> Eric Dumazet wrote:
> >>
> >>> Events are not necessarly reported "by descriptors". epoll uses an opaque
> >>> field provided by the user.
> >>>
> >>> It's up to the user to properly chose a tag that will makes sense
> >>> if the user
> >>> app is playing dup()/close() games for example.
> >> Great. So the only issue then is that the documentation is confusing. It
> >> frequently uses the term "fd" where it means file. For example, it says:
> >>
> >>               Q1     What  happens  if  you  add  the  same fd to an
> >> epoll_set
> >>                      twice?
> >>
> >>               A1     You will probably get EEXIST.  However,  it  is
> >> possible
> >>                      that  two  threads  may  add the same fd twice. This is
> >> a
> >>                      harmless condition.
> >>
> >> This gives no reason to think there's anything wrong with adding the same
> >> file twice so long as you do so through different descriptors. (One can
> >> imagine an application that does this to segregate read and write operations
> >> to avoid a race where the descriptor is closed from under a writer due to
> >> handling a fatal read error.) Obviously, that won't work.
> > 
> > I agree, that is confusing. However, you can safely add two different file 
> > descriptors pointing to the same file*, with different event masks, and 
> > that will work as expected.
> 
> So can I summarize what I understand:
> 
> a) Adding the same file descriptor twice to an epoll set will cause an
> error (EEXIST).

Yes.



> b) In a separate message to linux-man, Chris Heath says that two threads
> *can't* add the same fd twice to an epoll set, despite what the existing
> man page text says.  I haven't tested that, but it sounds to me as though
> it is likely to be true.  Can you comment please Davide?

Yes, you can't add the same fd twice. Think about a DB where "file*,fd" is 
the key.



> c) It is possible to add duplicated file descriptors referring to the same
> underlying open file description ("file *").  As you note, this can be a
> useful filtering technique, if the two file descriptors specify different
> masks.
> 
> Assuming that is all correct, for man-pages-2.79, I've reworked the text
> for Q1/A1 as follows:
> 
>        Q1     What  happens  if you add the same file descriptor
>               to an epoll set twice?
> 
>        A1     You will probably get EEXIST.  However, it is pos-
>               sible   to   add  a  duplicate  (dup(2),  dup2(2),
>               fcntl(2) F_DUPFD, fork(2)) descriptor to the  same
>               epoll  set.   This  can  be a useful technique for
>               filtering events, if the duplicate  file  descrip-
>               tors are registered with different events masks.
> 
> Seem okay Davide?

Looks sane to me.



- Davide
