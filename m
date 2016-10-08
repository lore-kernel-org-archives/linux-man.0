From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] cgroups.7: tfix
Date: Sat,  8 Oct 2016 15:58:36 +0200
Message-ID: <20161008135836.3977-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man7/cgroups.7 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man7/cgroups.7 b/man7/cgroups.7
index 9dc0e15..556dea6 100644
--- a/man7/cgroups.7
+++ b/man7/cgroups.7
@@ -28,7 +28,7 @@
 cgroups \- Linux control groups
 .SH DESCRIPTION
 Control cgroups, usually referred to as cgroups,
-are a Linux kernel feature which which allow processes to
+are a Linux kernel feature which allow processes to
 be organized into hierarchical groups whose usage of
 various types of resources can then be limited and monitored.
 The kernel's cgroup interface is provided through
@@ -453,7 +453,7 @@ under both the v1 and the v2 hierarchies.
 The new behaviors in cgroups v2 are summarized here,
 and in some cases elaborated in the following subsections.
 .IP 1. 3
-Cgroups v2 provides a unified hiearchy against
+Cgroups v2 provides a unified hierarchy against
 which all controllers are mounted.
 .IP 2.
 "Internal" processes are not permitted.
@@ -593,7 +593,7 @@ since a single process can monitor multiple
 files.
 By contrast, the cgroups v1 mechanism requires the creation
 of a process for each notification.
-Second, notfication can be delegated to a process that lives inside
+Second, notification can be delegated to a process that lives inside
 a container associated with the newly empty cgroup.
 .\"
 .SS /proc files
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
