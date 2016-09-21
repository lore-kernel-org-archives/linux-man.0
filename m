From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] quotactl.2: Additions regarding project quotas
Date: Wed, 21 Sep 2016 06:28:26 +0300
Message-ID: <20160921032826.GA5094@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

* man2/quotactl.2: Added information regarding presence of project
  quotas.
---
 man2/quotactl.2 |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/man2/quotactl.2 b/man2/quotactl.2
index e88d96e..82406d4 100644
--- a/man2/quotactl.2
+++ b/man2/quotactl.2
@@ -37,8 +37,8 @@ quotactl \- manipulate disk quotas
 .fi
 .SH DESCRIPTION
 .LP
-The quota system can be used to set per-user and per-group limits on the
-amount of disk space used on a filesystem.
+The quota system can be used to set per-user, per-group and per-project limits
+on the amount of disk space used on a filesystem.
 For each user and/or group,
 a soft limit and a hard limit can be set for each filesystem.
 The hard limit can't be exceeded.
@@ -65,9 +65,11 @@ The
 value is either
 .BR USRQUOTA ,
 for user quotas,
-or
 .BR GRPQUOTA ,
-for group quotas.
+for group quotas, or (since Linux 4.1)
+.\" 847aac644e92e5624f2c153bab409bf713d5ff9a
+.BR PRJQUOTA ,
+for project quotas.
 The
 .I subcmd
 value is described below.
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
