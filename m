From: Li Zhijian <lizhijian-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] request_key.2: wfix: /etc/request-keys.conf -> /etc/request-key.conf
Date: Wed, 6 Sep 2017 11:29:28 +0800
Message-ID: <1504668568-17246-1-git-send-email-lizhijian@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Li Zhijian <lizhijian-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Li Zhijian <lizhijian-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man2/request_key.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/request_key.2 b/man2/request_key.2
index ce987e3..1f998ef 100644
--- a/man2/request_key.2
+++ b/man2/request_key.2
@@ -464,7 +464,7 @@ we first create a suitable entry in the file
 .EX
 $ sudo sh
 # \fBecho 'create user mtk:* *   /bin/keyctl instantiate %k %c %S' \\\fP
-          \fB> /etc/request-keys.conf\fP
+          \fB> /etc/request-key.conf\fP
 # \fBexit\fP
 .EE
 .in
-- 
2.7.4



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
