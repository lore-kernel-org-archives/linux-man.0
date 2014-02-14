From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Converting man-pages to UTF-8
Date: Fri, 14 Feb 2014 11:43:30 +0100
Message-ID: <CAKgNAkh5tHmJc2DrcoAJsDWWFao6bPckd2sN1dw-CZDSFNi5kQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Colin Watson <cjwatson-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Bruno Haible <bruno-nWNVUoHt2MvYtjvyW6yDsg@public.gmane.org>, Werner Lemberg <wl-mXXj517/zsQ@public.gmane.org>, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello all,

At https://bugzilla.kernel.org/show_bug.cgi?id=60807 is a proposal to
convert the pages of the the "man-pages" project to UTF 8. I thought
it worthwhile bringing that topic to the list, and CCing a few people
who may have some ideas about this step, since I'm not too sure of the
implications.

Peter Schiffer has kindly written some some scripts to do the
conversion, which would touch about 40 files. However, as far I can
tell, many of the pages that have non-ASCII characters have inside
groff comments (author's names, etc.). The only pages that have
non-ASCII characters in the rendered source are various man7 pages on
character sets. These were the pages to which I added a groff encoding
marker in response to Colin Watson's input on this Debian bug:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=519209

Moving to UTF-8 for the pages seems like a good idea, at least at some
point. However, I'm wondering whether there are any backward
compatibility issues that I should need to worry about. As far as I
know, groff added UTF-8 support back in Jan 2009, so, just over 5
years ago. Perhaps that's long enough ago now, that any backward
compatibility issues with old versions of groff would be minimal.
(I.e., the number of people installing new man-pages on systems with
old groff is likely to be very small, and anyway, only a dozen or so
pages in Section 7 are affected. Furthermore, I'm assuming that Linux
distros have been shipping groff v1.20+ for quite a long time now.)

Bottom line question: anyone see a reason not to do this conversion now?

Thanks,

Michael







-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
