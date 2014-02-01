From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] small improvement for tcp.7
Date: Sat, 1 Feb 2014 18:25:20 +0400
Message-ID: <20140201182520.5c3ac952@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.
diff --git a/man7/tcp.7 b/man7/tcp.7
index 9cd7206..1f4346d 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -898,7 +898,7 @@ Unprivileged processes are restricted to choosing one of th$
 (described above).
 Privileged processes
 .RB ( CAP_NET_ADMIN )
-processes can choose from any of the available congestion-control algorithms
+can choose from any of the available congestion-control algorithms
 (see the description of
 .IR tcp_available_congestion_control
 above).

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
