From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Report bugs for variations in error handling in math functions?
Date: Fri, 25 Jul 2008 12:14:05 +0200
Message-ID: <cfd18e0f0807250314h5c063754gd672c04b2eeef2f6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
Cc: Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Currently, I'm revising all of the math pages in man-pages, and in the
process testing the error handling (glibc 2.8) for each function.

I find the following:

a) on error, many (probably a majority of) functions set errno AND
raise an exception (fetestexcept()).
b) on error, a very few functions DO set errno but DON"T raise an
exception (fetestexcept()).
c) on error, a few functions DON'T set errno but DO raise an exception
(fetestexcept()).
d) on error, a very few functions pursue a mixture of all of the
above, depending on the error.

A math_error(7) page that I recently wrote (see
http://www.kernel.org/doc/man-pages/online/pages/man7/math_error.7.html
) currently implies that all functions should do a).  Clearly I'll
need to amend that.

But the main question is, should I raise glibc bugs for the functions
in cases b), c), and d)?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
