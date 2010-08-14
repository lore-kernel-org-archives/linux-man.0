From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for epoll_ctl.2
Date: Sat, 14 Aug 2010 09:53:15 +0400
Message-ID: <20100814095315.0b88bf18@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/b1g3lnAi=f2D8k0xBXfv4Re"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/b1g3lnAi=f2D8k0xBXfv4Re
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.
--- man-pages-git/man2/epoll_ctl.2      2010-03-26 17:46:41.000000000 +0300
+++ /tmp/epoll_ctl.2    2010-08-14 09:51:09.000000000 +0400
@@ -81,12 +81,12 @@
 typedef union epoll_data {
     void        *ptr;
     int          fd;
-    __uint32_t   u32;
-    __uint64_t   u64;
+    uint32_t   u32;
+    uint64_t   u64;
 } epoll_data_t;
 
 struct epoll_event {
-    __uint32_t   events;      /* Epoll events */
+    uint32_t   events;      /* Epoll events */
     epoll_data_t data;        /* User data variable */
 };
 .fi


-- 
Best Regards,
Yuri Kozlov


--MP_/b1g3lnAi=f2D8k0xBXfv4Re
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=epoll_ctl.2.patch

--- man-pages-git/man2/epoll_ctl.2	2010-03-26 17:46:41.000000000 +0300
+++ /tmp/epoll_ctl.2	2010-08-14 09:51:09.000000000 +0400
@@ -81,12 +81,12 @@
 typedef union epoll_data {
     void        *ptr;
     int          fd;
-    __uint32_t   u32;
-    __uint64_t   u64;
+    uint32_t   u32;
+    uint64_t   u64;
 } epoll_data_t;
 
 struct epoll_event {
-    __uint32_t   events;      /* Epoll events */
+    uint32_t   events;      /* Epoll events */
     epoll_data_t data;        /* User data variable */
 };
 .fi

--MP_/b1g3lnAi=f2D8k0xBXfv4Re--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
