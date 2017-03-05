From: Victor Khimenko <khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: syscall(2)
Date: Sun, 5 Mar 2017 09:08:45 +0100
Message-ID: <CABLBYvTBKvQXSmiGx3LOUoFHZDGAMmNCofcuHTiKW51kS2bh4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

syscall(2) example includes the following snippet which explains how to
call readahead on ARM:

       syscall(SYS_readahead, fd, 0,
                   (unsigned int) (offset >> 32),
                   (unsigned int) (offset & 0xFFFFFFFF),
                   count);

But ARM EABI specifies that "A double-word sized type is passed in two
consecutive registers (e.g., r0 and r1, or r2 and r3). The content of
the registers is as if the value had been loaded from memory representation
with a single LDM instruction."

This would imply that arguments are swapped around in the man page, no?

I've tried to experiement and with ftruncate, at least, it works like
this...
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
