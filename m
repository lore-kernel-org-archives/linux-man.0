From: Oliver Ebert <oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
Subject: [PATCH 0/4] proc.5: Update pagemap and related documentation
Date: Sun, 24 Sep 2017 23:41:34 +0200
Message-ID: <20170924214138.4852-1-oe@outputenable.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oliver Ebert <oe-h0GdYU6q0jndfRFfCFeH3g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello,

while debugging some memory mapping issues I noticed that the
/proc/[pid]/pagemap and related documentation in proc.5 is not
up-to-date with the kernel's Documentation/vm/pagemap.txt file.
This series of patches adds the missing pieces.

Oliver Ebert (4):
  proc.5: tfix
  proc.5: Add KPF_BALLOON, KPF_ZERO_PAGE and KPF_IDLE for
    /proc/kpageflags
  proc.5: Add mmap-exclusive bit for /proc/[pid]/pagemap
  proc.5: Document /proc/kpagecgroup

 man5/proc.5 | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
