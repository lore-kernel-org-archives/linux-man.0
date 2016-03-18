From: Patrick Donnelly <batrick-dP08NitdTj1Wk0Htik3J/w@public.gmane.org>
Subject: ptrace(2): wrong kernel version for PTRACE_SEIZE and others
Date: Fri, 18 Mar 2016 17:21:28 -0400
Message-ID: <CACh33FrJRvC-ZQkBD2DZjW-YYnqNY5iCu_DtB8x+Jz_w80tMPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The ptrace(2) man page says that PTRACE_SEIZE, PTRACE_LISTEN, and
PTRACE_INTERRUPT was introduced in Linux 3.4. In fact, this was added
in 3.1:

$ git diff v3.0 v3.1 include/linux/ptrace.h | grep SEIZE
+#define PTRACE_SEIZE           0x4206
+/* flags in @data for PTRACE_SEIZE */
+#define PTRACE_SEIZE_DEVEL     0x80000000 /* temp flag for development */
+#define PT_SEIZED      0x00010000      /* SEIZE used, enable new behavior */
+               if (child->ptrace & PT_SEIZED)


-- 
Patrick Donnelly
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
