From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages MT attributes status / update
Date: Fri, 16 Jan 2015 09:35:32 +0100
Message-ID: <54B8CD54.4090701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Ma Shimiao

Now that you have started sending patches that bring the 
man-pages and glibc MT-safety into agreement, I think 
we'll soon be ready to release a lot of pent up patches 
(~350!) into a mainline man-pages release. My thanks
to you and you colleagues at Fujitsu for all of this 
work!

I imagine that there are still some remaining differences 
between the man-pages and glibc MT-safety markings. Do you have
an idea of how many pages remain to be fixed?

By the way, as far as I can tell, we now have all man-pages 
attributes markings in the "new look" boxed format. Can you 
confirm?

With all of the preceding in mind, I've done a bit of Git
reorganization. I've removed the 'attributes_reformat_2' branch
at http://git.kernel.org/cgit/docs/man-pages/man-pages.git .
In its place, there is now a new branch 'mt_attributes'.
I made that change for a couple of reasons:

1. I rebased the changes in the attributes_reformat' branch
   against man-pages-3.77. In the process, I resolved a handful
   of conflicts, and as a result of the rebase the SHA-1 IDs
   changed.

2. Into 'mt_attributes', I have merged all of the other 
   MT-safety patches that were in a private branch that I was 
   running. These were the patches in the last few months that
   added ATTRIBUTES to pages that did not have them.

I hope that switching to the new branch does not present 
any inconvenience to you. Of course, with this change, now
the 'mt_attributes' branch shows all of the patches from you
and your colleagues that I have merged. With luck, the view 
in that branch should be completely consistent with your 
local copy.

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
