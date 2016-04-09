From: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 2/2] elf.5: wfix
Date: Sat, 9 Apr 2016 03:17:45 +0200
Message-ID: <20160409031745.11d94c02.alex.miller@gmx.de>
References: <20160409031417.398e3a85.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <70698a8068fe712246341de93bf5e17b881d6c28.1460164143.git.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
---
 man5/elf.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man5/elf.5 b/man5/elf.5
index 3a02757..6cc4898 100644
--- a/man5/elf.5
+++ b/man5/elf.5
@@ -1450,7 +1450,7 @@ which holds character representations of the symbol names.
 If the value
 is nonzero, it represents a string table index that gives the symbol
 name.
-Otherwise, the symbol table has no name.
+Otherwise, the symbol has no name.
 .TP
 .IR st_value
 This member gives the value of the associated symbol.
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
