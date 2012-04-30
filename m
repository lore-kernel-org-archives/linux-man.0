From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [PATCH] prctl.2
Date: Mon, 30 Apr 2012 14:14:25 +0400
Message-ID: <20120430141425.08ed0175@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- man-pages-git/man2/prctl.2  2012-04-29 11:15:54.881831526 +0400
+++ /tmp/prctl.2        2012-04-30 14:12:59.192008396 +0400
@@ -224,7 +224,7 @@
 This value is cleared for the child of a
 .BR fork (2)
 and (since Linux 2.5.36 / 2.6.23)
-when execing a set-user_ID or set-group-ID binary.
+when executing a set-user_ID or set-group-ID binary.
 .TP
 .BR PR_GET_PDEATHSIG " (since Linux 2.3.15)"
 Return the current value of the parent process death signal,

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
