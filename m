From: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [patch -man] madvise.2: Specify new ENOMEM return value
Date: Tue, 24 Jan 2017 14:32:17 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1701241431530.42507@chino.kir.corp.google.com>
References: <alpine.DEB.2.10.1701241431120.42507@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.10.1701241431120.42507-X6Q0R45D7oAcqpCFd4KODRPsWskHk0ljAL8bYrjMMd8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Johannes Weiner <hannes-druUgvl0LCNAfugRpC6u6w@public.gmane.org>, Jerome Marchand <jmarchan-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Kirill A. Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
List-Id: linux-man@vger.kernel.org

madvise(2) may return ENOMEM if the advice acts on a vma that must be
split and creating the new vma will result in the process exceeding
/proc/sys/vm/max_map_count.

Specify this additional possibility.

Signed-off-by: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 man2/madvise.2 | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/man2/madvise.2 b/man2/madvise.2
--- a/man2/madvise.2
+++ b/man2/madvise.2
@@ -467,7 +467,12 @@ Not enough memory: paging in failed.
 .TP
 .B ENOMEM
 Addresses in the specified range are not currently
-mapped, or are outside the address space of the process.
+mapped, are outside the address space of the process, or will result in the
+number of areas mapped by this process to exceed
+.I /proc/sys/vm/max_map_count
+(see the Linux kernel source file
+.I Documentation/sysctl/vm.txt
+for more details).
 .TP
 .B EPERM
 .I advice
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
