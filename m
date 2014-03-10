From: Thomas Klausner <tk-JlXkzPh5ucKzZXS1Dc/lvw@public.gmane.org>
Subject: Re: bug in dlopen(3) man page
Date: Mon, 10 Mar 2014 12:53:04 +0100
Message-ID: <20140310115304.GS25275@danbala.tuwien.ac.at>
References: <20140308213059.GA25275@danbala.tuwien.ac.at>
 <sfid-H20140310-003534-+019.77-1@spamfilter.osbf.lua>
 <15509951.scfVQB3357@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <15509951.scfVQB3357@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Mar 09, 2014 at 07:25:20PM -0400, Mike Frysinger wrote:
> On Sat 08 Mar 2014 22:30:59 Thomas Klausner wrote:
> > There is a bug in dlopen(3). The NOTES section claims:
> > 
> > "The symbols RTLD_DEFAULT and RTLD_NEXT are defined by <dlfcn.h> only
> > when _GNU_SOURCE was defined before including it."
> > 
> > However, this is not correct.
> > 
> > From dlfcn.h on a "Gentoo Base System release 2.1":
> > #ifdef __USE_GNU
> > ...
> > # define RTLD_NEXT      ((void *) -1l)
> > ...
> > # define RTLD_DEFAULT   ((void *) 0)
> > ...
> > 
> > You can verify this by compiling the attached program. For me it gives:
> > test.c: In function `main':
> > test.c:8: error: `RTLD_NEXT' undeclared (first use in this function)
> > test.c:8: error: (Each undeclared identifier is reported only once
> > test.c:8: error: for each function it appears in.)
> > 
> > It works if I set "__USE_GNU_" instead.
> > 
> > Please also check the "Glibc extensions: dladdr() and dlvsym()"
> > section, it also mentions _GNU_SOURCE.
> 
> the man page is correct.  you must define _GNU_SOURCE before including any 
> headers.  you must never use the __USE_XXX defines directly.
>
> see feature_test_macros(7) for details as the dlopen() man page references.

Thanks for your reply.

Michael Kerrisk already pointed me to that in a private email.

However, this makes writing portable code a bit harder. When I know I need
the define for this particular header, I can wrap the header in
#define __FOO
#include foo.h
#undef __FOO

but here it seems I have to live with whatever side effects __FOO
might have on any other headers.

Well, you can't fix that, so thanks for the pointer.
 Thomas
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
