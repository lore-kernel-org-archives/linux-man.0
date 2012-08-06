From: Tolga Dalman <tolga.dalman-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: proc(5): minor text updates
Date: Mon, 06 Aug 2012 21:56:03 +0200
Message-ID: <50202153.6030808@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

while reading the /proc/[pid]/stat part in proc(5),
I noticed two minor issues that should be fixed:

1. The text reads:
     "flags %u (%lu before Linux 2.6.22) kernel flags word of the process.
      For bit meanings, see  the  PF_*  defines  in  <linux/sched.h>."

   PF_* is obvisously wrong. It should be CLONE_*.

2. There is a wrong reference further below:
    "rsslim %lu  Current  soft  limit  in  bytes  on  the  rss of the
     process; see the description of RLIMIT_RSS in getpriority(2)."

   The correct page is getrlimit(2).

Thanks!

Best regards
Tolga Dalman

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
