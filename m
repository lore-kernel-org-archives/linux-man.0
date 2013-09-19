From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: POSIX.1-2013 man pages for review
Date: Thu, 19 Sep 2013 09:59:42 +0200
Message-ID: <523AAEEE.5090602@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrew Josey <ajosey-7882/jkIBncuagvECLh61g@public.gmane.org>, Felix Janda <felix.janda-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, John Spencer <maillist-musl-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Matthew Dempsky <matthew-bfSpyvURsAhAfugRpC6u6w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

Recently, the Linux man-pages project received kind permission 
from the IEEE and The Open Group to distribute the interface 
specifications from POSIX.1-2013 (also known as POSIX.1-2008 + 
Technical Corrigendum 1) as a set of manual pages. This
allows us to repeat the exercise that was performed in 2004, 
whereby the POSIX.1-2003 man pages were distributed as man pages
for Linux in sections 0p, 1p, and 3p.

Thanks to some work by Felix Janda, we now have a set of
scripts that convert the source format that we received from
IEEE/TOG to the man pages using the "man" macros. Felix has
done some excellent work, and I've spent quite some time 
reviewing the results. However, before definitively releasing
these pages, I would like to have further review of the pages,
and I am soliciting that review with this mail

The main purposes of this review are to:
* detect any problems injected by the conversion process
  (e.g., spurious text added or deleted)
* find any formatting issues with the resulting pages.

If you are interested to help with reviewing these pages, the
amount of time required is up to you: it's simply a question of
how many (randomly selected) pages you care to check over.
Even checking just a half dozen pages is helpful, so long
as you let me know how many pages you checked and whether
you found problems or whether everything looked okay.

A tarball of the converted pages can be found here:

http://man7.org/linux/posix-man-pages/posix-man-pages-130917-draft.tar.gz

Once you have unpacked the tarball, individual pages can be read
using the command

    man -l <pagename>

If desired you can compare the pages against the HTML versions of the 
standard online here:
http://pubs.opengroup.org/onlinepubs/9699919799/

If you would prefer to compare the converted pages against the PFDF 
version of the standard, I believe it is possible to register (without 
cost) at The Open Group website:

https://www2.opengroup.org/ogsys/catalog/t101

to obtain a PDF version of the standard.

Thank you,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
