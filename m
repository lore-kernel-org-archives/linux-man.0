From: Santosh Sivaraj <santosh-b8Fn+pY0OfAdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] vdso.7: __kernel_clock_gettime *_COARSE clock support in
 PPC64
Date: Sat, 23 Dec 2017 08:43:12 +0530
Message-ID: <20171223031312.k5x4hbytlm7wwfzn@santosiv.in.ibm.com>
References: <20171222002659.1930-1-santosh@fossix.org>
 <31d5abc7-d314-d4da-175f-b402e14678f0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <31d5abc7-d314-d4da-175f-b402e14678f0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

* Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote (on 2017-12-22 10:36:53 +0100):

Hi Michael,

> Hi Santosh
> 
> On 12/22/2017 01:26 AM, Santosh Sivaraj wrote:
> > *_COARSE clocks are now supported in the __kernel_clock_gettime interface in
> > PPC64. No longer falls back to the real system call.
> 
> Can you tell me the kernel version where this change was 
> made? It would be useful to include that in the text, I think.
> In fact, if you knew the kernel commit that made the change,
> that would also be of interest.

The commit is currently in the PPC next tree. It should go to the mainline in
the 3.16 merge timeframe.

git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git

The commit ID in next tree is: 5c929885f1bb4b77f85b1769c49405a0e0f154a1

https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=5c929885f1bb4b77f85b1769c49405a0e0f154a1

If needed I can mention the commit once its merged into the mainline and
resend the patch.

> 
> Also, your patch changes just the entry for ppc/64. Does
> the same statement hold true for ppc/32?

No, changes are made only for vdso64.

Thanks,
Santosh
> 
> Thanks,
> 
> Michael
> 
> 
> > CC: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > CC: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
> > Signed-off-by: Santosh Sivaraj <santosh-b8Fn+pY0OfAdnm+yROfE0A@public.gmane.org>
> > ---
> >  man7/vdso.7 | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/man7/vdso.7 b/man7/vdso.7
> > index 9af02a8aa..c7399939c 100644
> > --- a/man7/vdso.7
> > +++ b/man7/vdso.7
> > @@ -438,9 +438,7 @@ clocks are
> >  .I not
> >  supported by the
> >  .I __kernel_clock_getres
> > -and
> > -.I __kernel_clock_gettime
> > -interfaces;
> > +interface;
> >  the kernel falls back to the real system call.
> >  .SS s390 functions
> >  .\" See linux/arch/s390/kernel/vdso32/vdso32.lds.S
> > 

-- 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
