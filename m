From: "zhangyi (F)" <yi.zhang@huawei.com>
Subject: [PATCH] io_getevents.2: Add EINVAL for case of timeout parameter out of range
Date: Wed, 31 Jul 2019 11:03:13 +0800
Message-ID: <1564542193-89171-1-git-send-email-yi.zhang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <owner-linux-aio@kvack.org>
Sender: owner-linux-aio@kvack.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, bcrl@kvack.org, viro@zeniv.linux.org.uk, jmoyer@redhat.com, arnd@arndb.de, deepa.kernel@gmail.com, yi.zhang@huawei.com, wangkefeng.wang@huawei.com
List-Id: linux-man@vger.kernel.org

io_[p]getevents syscall should return -EINVAL if timeout is out of
range, update description of this error return value.

Link: https://lore.kernel.org/lkml/1564451504-27906-1-git-send-email-yi.zhang@huawei.com/
Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>
Cc: Jeff Moyer <jmoyer@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Deepa Dinamani <deepa.kernel@gmail.com>
---
 man2/io_getevents.2 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/man2/io_getevents.2 b/man2/io_getevents.2
index 0eb4b385e..5560bb8ee 100644
--- a/man2/io_getevents.2
+++ b/man2/io_getevents.2
@@ -73,8 +73,9 @@ Interrupted by a signal handler; see
 .TP
 .B EINVAL
 \fIctx_id\fP is invalid.
-\fImin_nr\fP is out of range or \fInr\fP is
-out of range.
+\fImin_nr\fP is out of range or \fInr\fP is out of range, or
+\fItimeout\fP is out of range (\fItv_sec\fP was less than zero, or
+\fItv_nsec\fP was not less than 1,000,000,000).
 .TP
 .B ENOSYS
 .BR io_getevents ()
-- 
2.20.1

--
To unsubscribe, send a message with 'unsubscribe linux-aio' in
the body to majordomo@kvack.org.  For more info on Linux AIO,
see: http://www.kvack.org/aio/
Don't email: <a href=mailto:"aart@kvack.org">aart@kvack.org</a>
