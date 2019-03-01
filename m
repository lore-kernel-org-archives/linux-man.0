From: Wang Shilong <wangshilong1991@gmail.com>
Subject: [PATCH 1/2] fchownat.2: add project support updates
Date: Fri,  1 Mar 2019 23:06:22 +0900
Message-ID: <1551449184-7942-1-git-send-email-wshilong1991@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>,
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>,
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
To: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Cc: adilger@dilger.ca, linux-man@vger.kernel.org, lixi@ddn.com, Wang Shilong <wshilong@ddn.com>
List-Id: linux-man@vger.kernel.org

From: Wang Shilong <wshilong@ddn.com>

From: Wang Shilong <wshilong@ddn.com>

Cc: linux-man@vger.kernel.org
Signed-off-by: Wang Shilong <wshilong@ddn.com>
---
 man2/chown.2 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man2/chown.2 b/man2/chown.2
index 50db789ac..fad74df20 100644
--- a/man2/chown.2
+++ b/man2/chown.2
@@ -217,6 +217,11 @@ instead operate on the link itself, like
 .BR fchownat ()
 dereferences symbolic links, like
 .BR chown ().)
+.TP
+.B AT_FCHOWN_PROJID
+Use
+.I group
+to change file's project ID instead of its group ID.
 .PP
 See
 .BR openat (2)
-- 
2.19.1
