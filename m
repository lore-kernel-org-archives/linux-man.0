From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 4/4] Changes.old: tfix
Date: Thu, 22 Oct 2015 16:44:14 +0200
Message-ID: <1445525054-2880-4-git-send-email-jwilk@jwilk.net>
References: <1445525054-2880-1-git-send-email-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445525054-2880-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 Changes.old | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Changes.old b/Changes.old
index 28761a2..16429ab 100644
--- a/Changes.old
+++ b/Changes.old
@@ -24576,7 +24576,7 @@ epoll_wait.2
                 (LONG_MAX - 999ULL) / HZ)
 
             That is, the limit depends on the size of a long and the timer
-            frequency.  Assuming the a long is never smaller than 32 bits
+            frequency.  Assuming the long is never smaller than 32 bits
             and HZ never larger than 1000, the worst case is 35 minutes.
             I think this should be mentioned under "BUGS".
 
@@ -29396,7 +29396,7 @@ recv.2
         Rework and reorganize the text in various parts of the page.
         Isolate details specific to recv() vs recvfrom() vs recvmsg()
             Place details specific to each system call under a
-            a separate subheading.
+            separate subheading.
         Rework discussion of 'src_addr' and 'addrlen' for recvfrom()
         Add description of 'buf' and 'len' in recvfrom() section
         'addrlen' should be 0 (*not* NULL) when 'src_addr' is NULL
@@ -38173,7 +38173,7 @@ stat.2
             Recent changes to various pages employ this distinction.
     Michael Kerrisk
         Tighten wording: use 'mode bit' rather than 'permission bit'
-            According to POSIX, the the 9 UGO*RWX bits are permissions, and
+            According to POSIX, the 9 UGO*RWX bits are permissions, and
             'mode' is used to refer to collectively to those bits plus sticky,
             set-UID, and set_GID bits.
 
-- 
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
