From: Slavomir Kaslev <kaslevs@vmware.com>
Subject: [PATCH 1/2] splice.2: Note EAGAIN can occur when called on nonblocking file descriptors
Date: Fri, 12 Apr 2019 17:02:46 +0300
Message-ID: <20190412140247.9897-2-kaslevs@vmware.com>
References: <20190412140247.9897-1-kaslevs@vmware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412140247.9897-1-kaslevs@vmware.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, slavomir.kaslev@gmail.com
List-Id: linux-man@vger.kernel.org

Signed-off-by: Slavomir Kaslev <kaslevs@vmware.com>
---
 man2/splice.2 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man2/splice.2 b/man2/splice.2
index 57988d9d6..af3fa4e74 100644
--- a/man2/splice.2
+++ b/man2/splice.2
@@ -155,7 +155,9 @@ is set to indicate the error.
 .B EAGAIN
 .B SPLICE_F_NONBLOCK
 was specified in
-.IR flags ,
+.IR flags
+or one of the file descriptors had been marked as nonblocking
+.RB ( O_NONBLOCK ) ,
 and the operation would block.
 .TP
 .B EBADF
-- 
2.19.1
