From: Colin Watson <cjwatson-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: gethostid/sethostid in wrong manual section
Date: Mon, 22 Dec 2008 23:39:53 +0000
Message-ID: <20081222233953.GG16155@riva.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugs.launchpad.net/ubuntu/+source/manpages/+bug/17551 reports
(and I've confirmed) that gethostid/sethostid are in section 2 despite
being implemented by glibc, not the kernel; they aren't just syscall
stubs either. Should they be moved to section 3?

Thanks,

-- 
Colin Watson                                       [cjwatson-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org]
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
