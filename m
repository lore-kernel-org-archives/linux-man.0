From: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 5/5] seccomp.2: tfix
Date: Fri, 15 Sep 2017 18:41:38 +0200
Message-ID: <20170915164138.2621-5-jwilk@jwilk.net>
References: <20170915164138.2621-1-jwilk@jwilk.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915164138.2621-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
---
 man2/seccomp.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/seccomp.2 b/man2/seccomp.2
index 2219d60be..6b851c479 100644
--- a/man2/seccomp.2
+++ b/man2/seccomp.2
@@ -242,7 +242,7 @@ addressing mode) as a (read-only)
 .\" Quoting Kees Cook:
 .\"     If BPF even allows changing the data, it's not copied back to
 .\"     the syscall when it runs. Anything wanting to do things like
-.\"     that would need to use ptrace to catch the call an directly
+.\"     that would need to use ptrace to catch the call and directly
 .\"     modify the registers before continuing with the call.
 buffer of the following form:
 .PP
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
