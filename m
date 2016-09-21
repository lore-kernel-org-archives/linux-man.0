From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] quotactl.2: Updated information regarding disk quota
 flags
Date: Wed, 21 Sep 2016 06:28:38 +0300
Message-ID: <20160921032838.GA5327@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

* man2/quotactl.2: Added information regarding DQF_SYS_FILE flag,
  updated definition of V1_DQF_RSQUASH which has been defined privately
  and defined publicly as DQF_ROOT_SQUASH.
---
 man2/quotactl.2 |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/man2/quotactl.2 b/man2/quotactl.2
index 82406d4..3910379 100644
--- a/man2/quotactl.2
+++ b/man2/quotactl.2
@@ -285,9 +285,12 @@ struct dqinfo {         /* Defined since kernel 2.4.22 */
 
 /* Quota format QFMT_VFS_OLD */
 
-#define V1_DQF_RSQUASH	1   /* Root squash enabled */
+/* Before v4.0-rc1~141^2~14 it had been defined privately as V1_DQF_RSQUASH */
+#define DQF_ROOT_SQUASH (1 << 0)   /* Root squash enabled */
 
-/* Other quota formats have no dqi_flags bits defined */
+/* Quota format QFMT_VFS_V0 / QFMT_VFS_V1 */
+
+#define DQF_SYS_FILE    (1 << 16)  /* Quota stored in a system file */
 
 /* Flags in dqi_valid that indicate which fields in
    dqinfo structure are valid. */
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
