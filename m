From: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Subject: Re: For review: nptl(7) man page
Date: Thu, 6 Aug 2015 09:54:33 -0400
Message-ID: <20150806135433.GD14639@brightrain.aerifal.cx>
References: <1438616740.20974.81.camel@localhost.localdomain>
 <20150803200825.GJ16376@brightrain.aerifal.cx>
 <20150804150648.9E9F42C3B01@topped-with-meat.com>
 <3848244D-C3FE-4FD1-B137-AF7AD6252659@gmail.com>
 <1438767393.20974.211.camel@localhost.localdomain>
 <BCB9D422-563C-4317-B0CB-B14001FE0EA3@gmail.com>
 <20150805182327.GA14639@brightrain.aerifal.cx>
 <55C25D2B.4040905@gmail.com>
 <20150805194613.GB14639@brightrain.aerifal.cx>
 <55C3319A.7020408@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55C3319A.7020408-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nicholas Miell <nmiell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Aug 06, 2015 at 12:06:18PM +0200, Michael Kerrisk (man-pages) wrote:
> On 08/05/2015 09:46 PM, Rich Felker wrote:
> > On Wed, Aug 05, 2015 at 08:59:55PM +0200, Michael Kerrisk (man-pages) wrote:
> >>>>> The semaphore example shows that there can be a disadvantage to
> >>>>> guaranteeing 32/64b interoperability (specifically, the 64b code is more
> >>>>> efficient).  For mutex, I *currently* don't see a reason why we couldn't
> >>>>> get away with just doing 32b stuff for the pshared case, but there's no
> >>>>> guarantee that I can foresee all future needs either.
> >>>>>
> >>>>> Thus, if we would decide to guarantee 32/64b interoperability, we'd need
> >>>>> to have at least strong use cases for that and a decent amount of
> >>>>> confidence that making such a guarantee is unlikely to constrain the
> >>>>> implementation in the future.
> >>>>
> >>>> Well, POSIX semaphores are supposed to be a replacement for System V
> >>>> semaphores (and this extends to the rest of the POSIX IPC
> >>>> primitives); right now they aren't.
> >>>
> >>> Only for some usage cases. As far as I can tell, POSIX semaphores are
> >>> not intended to be required to be implemented as a kernel resource.
> >>
> >> That last is also true of SysV semaphores, surely?
> > 
> > The grammar of my sentence was rather complicated and perhaps
> > confusing. The intent was to say that SysV semaphores absolutely have
> > to be a kernel resource, but POSIX semaphores don't (and aren't).
> 
> I'm still puzzled. POSIX certainly doesn't make any requirements here.
> So who does or doesn't "require" this? Also, I am not sure of the
> distinction you're trying to make here. In the Linux implementation of
> POSIX semaphores, kernel involvement is required in the contended case.

The back-out feature of SysV semaphores does not admit a userspace
implementation as far as I can tell. Certainly the killed process
itself can't change the state of the semaphore at exit time, so the
next thread to try to access it would have to see that a process with
SEM_UNDO records died and process them. But that would take
arbitrarily large storage in the semaphore object, and would have
other issues.

> >>> They don't have permissions enforcement/safety against malicious
> >>> processes, 
> >>
> >> (I'm a little lost here. POSIX semaphores do have a permissions mask.)
> > 
> > Yes, named semaphores have fs-like permissions, and of course you can
> > do that with unnamed ones in named shared memory objects or files.
> > However, as implemented in the real world, that provides no protection
> > from a malicious process that _does_ have access permissions. With SysV
> > semaphores, the worst a malicious process with access can do is
> > wait/post the semaphore. With current implementations of POSIX
> > semaphores, and other process-shared pthread sync objects, a malicious
> > process that has access can utterly corrupt the state of the object. I
> > am not sure of the extent of damage that can be achieved here, but
> > there is not explicit effort to harden against it.
> 
> Again, I'm clear on the distinction here. By "corrupted", I assume
> you're talking about (say) directly opening the SHM object used
> to implement the semaphore and tweaking bits arbitrarily.
> But, if someone can wait/post maliciously, you're pretty much
> hosed anyway.

sem_open followed by poking at the pointed-to bits should suffice; no
"more direct" open is needed. The scope of the damage will depend on
the implementation and the memory model, but a claim that it's not
more dangerous that malicious wait/post is nontrivial and would
require some work to prove.

With other pshared objects the impact is definitely much worse. For
example a robust mutex participates in a linked list local to the
process/thread that owns it. By overwriting the prev/next pointers
while a victim thread holds the lock, you could cause arbitrary memory
clobbering in the victim process when it goes to unlock.

> >>>  backout on async process termination, etc.
> >>
> >> Actually, System V semaphores don't reliably have this either (see BUGS
> >> in semop(2)).
> > 
> > That's something of a design bug, but irrelevant to the reasonable
> > usage which would be to post, not wait.
> 
> Why is that the only reasonable usage? 
> 
> It totally depends on the design of the sync protocol that you're
> layering on top of SysV semaphores. SEM_UNDO is a fundamentally
> broken concept, AFAICS.

My claim is that it's "fundamentally broken" only for certain usage
cases that are not the ones I would expect to arise in practice.

Rich
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
