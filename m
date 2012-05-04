From: Casper.Dik-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Subject: realpath(3) bugs
Date: Fri, 04 May 2012 13:22:13 +0200
Message-ID: <201205041122.q44BMDEO002270@ucsinet22.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



For some reason, many of the realpath() manual pages  (BSD, Linux) have
words to the following effect:

	Solaris may return a relative pathname when the path argument is relative.

I have looked through the Solaris source files and have found no
such bug reported or fixed; the implementation from at least 1997 and
beyond certainly doesn't have this problem and even the older versions
prepend getcwd() or chdir() to dirname and run getcwd() in that
directory.

Solaris does have a system call which may return relative pathnames:
resolvepath().  I believe that that function may have confused earlier 
writers of realpath() manual pages and this was later copied without 
verifying that fact.

realpath() existed in Solaris 2.0 as it came from SVr4.0 and even at that 
time i t returned the full, non-relative path.


Casper Dik (Solaris Engineering)

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
