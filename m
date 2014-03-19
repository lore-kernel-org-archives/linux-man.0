From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: Re: should "man feature_test_macros" mention _LARGEFILE_SOURCE?
Date: Wed, 19 Mar 2014 07:51:56 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1403190746440.4463@localhost>
References: <alpine.LFD.2.11.1403181544010.5574@localhost> <4257256.dYt9XWSnPY@vapier>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4257256.dYt9XWSnPY@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, 18 Mar 2014, Mike Frysinger wrote:

> On Tue 18 Mar 2014 15:46:43 Robert P. J. Day wrote:
> >   just noticed under /usr/include on my fedora rawhide system the
> > following:
> >
> > /usr/include/bits/environments.h:# define __ILP32_OFFBIG_CFLAGS	"-m32
> > -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
> > /usr/include/python3.3m/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
> > /usr/include/features.h:   _LARGEFILE_SOURCE	Some more functions for
> correct
> > standard I/O. /usr/include/features.h:#  undef _LARGEFILE_SOURCE
> > /usr/include/features.h:#  define _LARGEFILE_SOURCE	1
> > /usr/include/features.h:#ifdef _LARGEFILE_SOURCE
> > /usr/include/python2.7/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
> >
> > but there's no mention of "_LARGEFILE_SOURCE" in "man
> > feature_test_macros". is that assumed to be implied by
> > _LARGEFILE64_SOURCE? it's not clear.
>
> nope, none of the three LFS flags imply each other, nor should they.
> they're related, but orthogonal by design.

... snip ...

  i mentioned this only because the current features.h header file
mentions this macro near the top in the documentatiin:

   ...
   _LARGEFILE_SOURCE    Some more functions for correct standard I/O.
   _LARGEFILE64_SOURCE  Additional functionality from LFS for large files.
   _FILE_OFFSET_BITS=N  Select default filesystem interface.
   ...

but the man page for "feature_test_macros" says nothing about it. just
an observation.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
