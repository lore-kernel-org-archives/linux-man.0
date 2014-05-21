From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: [PATCH 23/24] key_setsecret.3: Fix prototypes
Date: Wed, 21 May 2014 16:57:54 +0200
Message-ID: <1400684275-20972-24-git-send-email-rv@rasmusvillemoes.dk>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Remove const qualifiers from arguments to key_decryptsession,
key_encryptsession, and key_setsecret.

Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
---
 man3/key_setsecret.3 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man3/key_setsecret.3 b/man3/key_setsecret.3
index f75896e..b78cd8b 100644
--- a/man3/key_setsecret.3
+++ b/man3/key_setsecret.3
@@ -13,15 +13,15 @@ key_secretkey_is_set \- interfaces to rpc keyserver daemon
 .SH SYNOPSIS
 .B "#include <rpc/rpc.h>"
 .sp
-.BI "int key_decryptsession(const char *" remotename ,
+.BI "int key_decryptsession(char *" remotename ,
 .BI "des_block *" deskey );
 .sp
-.BI "int key_encryptsession(const char *" remotename ,
+.BI "int key_encryptsession(char *" remotename ,
 .BI "des_block *" deskey );
 .sp
 .BI "int key_gendes(des_block *" deskey );
 .sp
-.BI "int key_setsecret(const char *" key );
+.BI "int key_setsecret(char *" key );
 .sp
 .B "int key_secretkey_is_set(void);"
 .SH DESCRIPTION
-- 
1.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
