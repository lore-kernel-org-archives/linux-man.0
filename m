From: Simon Cross <hodgestar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: IPv6 address format buglet
Date: Fri, 22 Jul 2011 11:20:35 +0200
Message-ID: <CAD5NRCE8Or2XmAwvxajShZMy2_-DL2TsXjmM7imqY0i0F1RvHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

A sentence in the "Address Format" section of
http://www.kernel.org/doc/man-pages/online/pages/man7/ipv6.7.html
reads:

"""
The address notation for IPv6 is a group of 16 2-digit hexadecimal numbers,
separated with a ':'.  "::" stands for a string of 0 bits.
"""

I believe this should read "8 4-digit hexadecimal numbers" instead.

Schiavo
Simon
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
