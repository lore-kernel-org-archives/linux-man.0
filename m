From: Elvira Khabirova <lineprinter-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] ptrace.2: ffix
Date: Tue,  6 Feb 2018 03:53:56 +0300
Message-ID: <20180206005357.2407-1-lineprinter@altlinux.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elvira Khabirova <lineprinter-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Elvira Khabirova <lineprinter-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
---
 man2/ptrace.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index e1c3eec46..bf59c09f8 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -1136,7 +1136,7 @@ be further subdivided into
 .IR signal-delivery-stop ,
 .IR group-stop ,
 .IR syscall-stop ,
-.IR PTRACE_EVENT stops,
+.IR "PTRACE_EVENT stops" ,
 and so on.
 These stopped states are described in detail below.
 .PP
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
