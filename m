From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 01/10] Fix return type of readlinkat()
Date: Wed, 30 Apr 2014 21:42:33 +0200
Message-ID: <1398886962-10633-2-git-send-email-rv@rasmusvillemoes.dk>
References: <1398886962-10633-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398886962-10633-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man2/readlink.2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/readlink.2 b/man2/readlink.2
index 586ab9e..9dc2a31 100644
--- a/man2/readlink.2
+++ b/man2/readlink.2
@@ -54,8 +54,8 @@ readlink, readlinkat \- read value of a symbolic link
 .BR "#include <fcntl.h>           " "/* Definition of AT_* constants */"
 .B #include <unistd.h>
 .sp
-.BI "int readlinkat(int " dirfd ", const char *" pathname ,
-.BI "               char *" buf ", size_t " bufsiz );
+.BI "ssize_t readlinkat(int " dirfd ", const char *" pathname ,
+.BI "                   char *" buf ", size_t " bufsiz );
 .sp
 .fi
 .in -4n
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
