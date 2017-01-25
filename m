From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 2/3] vfork.2: tfix
Date: Wed, 25 Jan 2017 16:37:32 +0100
Message-ID: <20170125153733.3588-2-jwilk@jwilk.net>
References: <20170125153733.3588-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170125153733.3588-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/vfork.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/vfork.2 b/man2/vfork.2
index bfc689b6e..b4ac02c48 100644
--- a/man2/vfork.2
+++ b/man2/vfork.2
@@ -219,7 +219,7 @@ avoids the need to temporarily commit memory (see the description of
 in
 .BR proc (5))
 in order to execute a new program.
-(This can be especifially beneficial where a large parent process wishes
+(This can be especially beneficial where a large parent process wishes
 to execute a small helper program in a child process.)
 By contrast, using
 .BR fork (2)
@@ -253,7 +253,7 @@ or similar),
 since there are now two processes with different privilege levels
 running in the same address space.
 As an example of the dangers,
-suppose that a multithreaded pgroam running as root creates a child using
+suppose that a multithreaded program running as root creates a child using
 .BR vfork ().
 After the
 .BR vfork (),
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
