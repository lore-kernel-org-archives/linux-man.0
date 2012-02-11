From: Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Subject: syncfs returns int (or long?)
Date: Sat, 11 Feb 2012 16:49:07 +0100
Message-ID: <4F368DF3.10605@truelite.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

In man 2 syncfs (version 2011-09-07, also in the website) it is declared as:

void syncfs(int fd);

but then is said:

RETURN VALUE
       syncfs() returns 0 on success; on error, it returns -1 and
       sets  errno to indicate the error.

so it cannot be void. I get

piccardi@monk:/usr/src/linux-source-3.1$ grep -r syncfs include/*
include/asm-generic/unistd.h:#define __NR_syncfs 267
include/asm-generic/unistd.h:__SYSCALL(__NR_syncfs, sys_syncfs)
include/linux/syscalls.h:asmlinkage long sys_syncfs(int fd);

So it seems to be at least long.

Simone
-- 
Simone Piccardi - KeyID:2A972F9D - JabberID:piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org
http://piccardi.gnulinux.it - http://www.fountainpen.it
Prima ti ignorano, poi ti deridono, poi ti combattono.  Poi vinci.
                                                 M. K. Ghandi
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
