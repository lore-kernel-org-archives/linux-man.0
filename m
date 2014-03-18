From: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Subject: should "man feature_test_macros" mention _LARGEFILE_SOURCE?
Date: Tue, 18 Mar 2014 15:46:43 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1403181544010.5574@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


  just noticed under /usr/include on my fedora rawhide system the
following:

/usr/include/bits/environments.h:# define __ILP32_OFFBIG_CFLAGS	"-m32 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
/usr/include/python3.3m/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
/usr/include/features.h:   _LARGEFILE_SOURCE	Some more functions for correct standard I/O.
/usr/include/features.h:#  undef _LARGEFILE_SOURCE
/usr/include/features.h:#  define _LARGEFILE_SOURCE	1
/usr/include/features.h:#ifdef _LARGEFILE_SOURCE
/usr/include/python2.7/pyconfig-64.h:#define _LARGEFILE_SOURCE 1

but there's no mention of "_LARGEFILE_SOURCE" in "man
feature_test_macros". is that assumed to be implied by
_LARGEFILE64_SOURCE? it's not clear.

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
