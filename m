From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 0/4] perf_event_open.2 Linux 3.12 updates
Date: Wed, 6 Nov 2013 13:26:48 -0500 (EST)
Message-ID: <alpine.DEB.2.10.1311061324070.26649@vincent-weaver-1.um.maine.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

here is a patch series bringing perf_event_open.2 documentation
in line with the recent Linux 3.12 release.

This replaces a patch I sent previously that made similar changes.
[The only realy change from that patch was "mmap2" sample support
 was dropped at the last minute.  The defines are still in the
 perf_event.h header file but it will always return EINVAL
 until the kernel developers finalize the interface].

Vince
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
