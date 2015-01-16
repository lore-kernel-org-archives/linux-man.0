From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch 0/7] Use "FILE * stream" everywhere.
Date: Thu, 15 Jan 2015 22:18:12 -0500
Message-ID: <54B882F4.1090203@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Harmonize all the manual pages to use "stream" for FILE*
instead of randomly using "fp" or "stream." Choosing something
and being consistent helps users scan the man pages quickly
and understand what they are looking at.

The next 7 patches convert all instances of "FILE *fp" to
"FILE *stream". The vast majority of man pages already use
the "FILE *stream" version which I also prefer.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
