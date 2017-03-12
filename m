From: Georg Sauthoff <mail-vzQcyvifq/Y@public.gmane.org>
Subject: renameat2 doesn't have a no-glibc-wrapper note
Date: Mon, 13 Mar 2017 00:09:09 +0100
Message-ID: <20170312230909.GA13985@dell12.lru.li>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

the renameat2(2) man page [1] currently doesn't mention that you have to use
sycall() to access it. Tested it with glibc-2.24-4.fc25.x86_64.

Can you add notes similar to what e.g. kcmp(2) [2] has?

I mean:

> Note: There is no glibc wrapper for this system call; see NOTES.
> [..]
> NOTES
> 
>        Glibc does not provide a wrapper for this system call; call it using
>        syscall(2).


Best regards
Georg

[1]: http://man7.org/linux/man-pages/man2/renameat2.2.html
[2]: http://man7.org/linux/man-pages/man2/kcmp.2.html
-- 
'The universe has no center and no edges' (Limits of Control,
2009)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
