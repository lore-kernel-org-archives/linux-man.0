From: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Subject: [PATCH] timerfd_create: add timerfd(7) alias
Date: Fri, 20 Dec 2013 16:41:31 -0800
Message-ID: <1387586491-9579-1-git-send-email-shawn@churchofgit.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
---
 man2/timerfd.2 | 2 --
 man7/timerfd.7 | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)
 delete mode 100644 man2/timerfd.2
 create mode 100644 man7/timerfd.7

diff --git a/man2/timerfd.2 b/man2/timerfd.2
deleted file mode 100644
index de0bf03..0000000
--- a/man2/timerfd.2
+++ /dev/null
@@ -1,2 +0,0 @@
-.so man2/timerfd_create.2
