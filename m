From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] keyctl.2: mention
 keyctl_dh_compute/keyctl_dh_compute_alloc
Date: Mon, 11 Sep 2017 05:11:09 +0200
Message-ID: <20170911031109.GA5260@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Those have been added in keyutils 1.5.10 (see commits v1.5.10~11 and
v1.5.10~10).

* man2/keyctl.2 (.SH DESCRIPTION) <.TP .BR KEYCTL_DH_COMPUTE>: Mention
the keyctl_dh_compute/keyctl_dh_compute_alloc are provided in keyutils
library for the operation.
(.SH SEE ALSO): Add references to keyctl_dh_compute(3) and
keyctl_dh_compute_alloc(3).

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/keyctl.2 | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/man2/keyctl.2 b/man2/keyctl.2
index ed132e5..1975602 100644
--- a/man2/keyctl.2
+++ b/man2/keyctl.2
@@ -1542,6 +1542,15 @@ and should contain zeroes since Linux 4.13.
 .IP
 The KDF implementation complies with SP800-56A as well
 as with SP800-108 (the counter KDF).
+.IP
+.\" keyutils commit 742c9d7b94051d3b21f9f61a73ed6b5f3544cb82
+.\" keyutils commit d68a981e5db41d059ac782071c35d1e8f3aaf61c
+This operation is exposed by
+.I libkeyutils
+(from version 1.5.10 onwards) via the functions
+.BR keyctl_dh_compute (3)
+and
+.BR keyctl_dh_compute_alloc (3).
 .TP
 .BR KEYCTL_RESTRICT_KEYRING " (since Linux 4.12)"
 .\" commit 6563c91fd645556c7801748f15bc727c77fcd311
@@ -2228,6 +2237,8 @@ main(int argc, char *argv[])
 .BR keyctl_clear (3),
 .BR keyctl_describe (3),
 .BR keyctl_describe_alloc (3),
+.BR keyctl_dh_compute (3),
+.BR keyctl_dh_compute_alloc (3),
 .BR keyctl_get_keyring_ID (3),
 .BR keyctl_get_persistent (3),
 .BR keyctl_get_security (3),
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
