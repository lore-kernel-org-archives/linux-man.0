From: Andrew Vagin <avagin-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH 1/3] ptrace.2: place GETSIGINFO and SETSIGINFO near each
 other
Date: Thu, 8 Aug 2013 18:43:56 +0400
Message-ID: <20130808144356.GA25148@paralelels.com>
References: <1373962773-2041-1-git-send-email-avagin@openvz.org>
 <1373962773-2041-2-git-send-email-avagin@openvz.org>
 <51E74143.4040709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="koi8-r"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51E74143.4040709-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, criu-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

On Thu, Jul 18, 2013 at 03:13:39AM +0200, Michael Kerrisk wrote:
> Thanks Andrey. Applied.

You committed one of three patches. What do you think about other
patches?

ptrace.2: add description for PTRACE_PEEKSIGINFO
ptrace.2: add description for PTRACE_{GET,SET}SIGMASK


Thanks,
Andrey

> 
> M
> 
> 
> On 07/16/13 10:19, Andrey Vagin wrote:
> > Signed-off-by: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> > ---
> >  man2/ptrace.2 | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/man2/ptrace.2 b/man2/ptrace.2
> > index 0d77e3f..5fcac2b 100644
> > --- a/man2/ptrace.2
> > +++ b/man2/ptrace.2
> > @@ -255,18 +255,6 @@ On return, the kernel modifies
> >  .B iov.len
> >  to indicate the actual number of bytes returned.
> >  .TP
> > -.BR PTRACE_GETSIGINFO " (since Linux 2.3.99-pre6)"
> > -Retrieve information about the signal that caused the stop.
> > -Copy a
> > -.I siginfo_t
> > -structure (see
> > -.BR sigaction (2))
> > -from the tracee to the address
> > -.I data
> > -in the tracer.
> > -.RI ( addr
> > -is ignored.)
> > -.TP
> >  .BR PTRACE_SETREGS ", " PTRACE_SETFPREGS
> >  Modify the tracee's general-purpose or floating-point registers,
> >  respectively, from the address
> > @@ -301,6 +289,18 @@ and
> >  is analogous to
> >  .BR PTRACE_GETREGSET .
> >  .TP
> > +.BR PTRACE_GETSIGINFO " (since Linux 2.3.99-pre6)"
> > +Retrieve information about the signal that caused the stop.
> > +Copy a
> > +.I siginfo_t
> > +structure (see
> > +.BR sigaction (2))
> > +from the tracee to the address
> > +.I data
> > +in the tracer.
> > +.RI ( addr
> > +is ignored.)
> > +.TP
> >  .BR PTRACE_SETSIGINFO " (since Linux 2.3.99-pre6)"
> >  Set signal information:
> >  copy a
> > 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
