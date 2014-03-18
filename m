From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Documenting the kernel-user-space ABI
Date: Tue, 18 Mar 2014 16:00:21 +0100
Message-ID: <53285F85.3000807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

You raised a question at the bottom of a bug report
(https://bugzilla.kernel.org/show_bug.cgi?id=70801#c4)
that I though might better go to the list, since I 
think it merits some wider discussion:

    i'd like to have a master location to document all 
    this stuff at the kernel ABI level.  can we do that 
    with the man-pages project somehow without violating 
    the C library API tenet?

First though, I'd like to check: what do you mean by "all this stuff"? 
Am I correct to understand your question as something like:

    Can man-pages become a place where the kernel-user-space ABI 
    (as distinct from the glibc wrappers on top) is consistently 
    and thoroughly documented?

?

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
