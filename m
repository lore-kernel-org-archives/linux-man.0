From: Ori Avtalion <ori-prZfzsrDuP2LwutG50LtGA@public.gmane.org>
Subject: Missing "restrict" keyword in function signatures
Date: Fri, 16 Sep 2016 12:06:06 +0300
Message-ID: <CALgdb5+XAEqE4k+-BeuVxYFh_8TBP4Q-Xt5LMc=BmLD6jS1dHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

None of the function signatures in man pages list the "restrict"
keywords, even if the actual function signatures in the headers have
them.

Some example functions that use "restrict":
* memcpy (src and dest must not overlap)
* strtod

Is this an intentional omission?

For comparison, FreeBSD usually mentions "restrict":
https://www.freebsd.org/cgi/man.cgi?query=strtod(3)

-Ori
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
