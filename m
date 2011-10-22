From: Tom Gundersen <teg-B22kvLQNl6c@public.gmane.org>
Subject: Unit of /proc/sys/kernel/random/poolsize
Date: Sat, 22 Oct 2011 14:13:16 +0200
Message-ID: <CAG-2HqXo9GqNmiSt2npnBwx+F9_03eUTcxujgt_vNmdGhX8i6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

This might not be so much a bug report, as a request for clarification.

In random(4) it is explained that /proc/sys/kernel/random/poolsize
contains the value in bits or bytes in >=2.6 and 2.4 respectively.
However, the example in the preceding paragraph assumes a 2.4 kernel
is being used, and treats the value as if it were in bytes.

I ran across this as I maintain the initscripts for Arch Linux, where
we have been (mistakenly) following the example even though we use a
3.0 kernel. Maybe it would be worthwhile to change the example into
the 2.6 interface, or at least include a word of caution?

I realise that using a value which is too large, probably does no harm
at all, but not being cryptography expert, I'd rather not take the
chance.

Cheers,

Tom
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
