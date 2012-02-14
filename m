From: Matthew Gregan <kinetik-QufbIeIr5AY@public.gmane.org>
Subject: fcntl(2) error: pipe-size-max vs pipe-max-size
Date: Tue, 14 Feb 2012 13:04:41 +1300
Message-ID: <20120214000441.GF15858@flim.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

In the man page for fcntl(2), within the paragraph discussing F_SETPIPE_SZ,
it is claimed that the maximum size for a pipe is determined by the value of
/proc/sys/fs/pipe-size-max.  The proc path is incorrect--on my current
machine (2.6.35.14-106.fc14.x86_64) and in the latest kernel source
(http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=kernel/sysctl.c;h=f487f257e05e4f1dc8836ded96ca36556b048706;hb=HEAD#l1523),
the proc path is /proc/sys/fs/pipe-max-size.

Cheers,
-mjg
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
