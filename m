From: =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/5] keyctl.2: reorder SEE ALSO, without .br
Date: Sun, 23 Sep 2012 16:34:59 -0400
Message-ID: <1348432502-26050-2-git-send-email-taffit@debian.org>
References: <CAKgNAkgKVXfzKqe8qy+ZWSy-ZvhPrM0_sooKM4HG+UTfhbX6BQ@mail.gmail.com>
 <1348432502-26050-1-git-send-email-taffit@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348432502-26050-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?David=20Pr=C3=A9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/keyctl.2 |   46 ++++++++++++----------------------------------
 1 file changed, 12 insertions(+), 34 deletions(-)

diff --git a/man2/keyctl.2 b/man2/keyctl.2
index fcb30ab..f0dd607 100644
--- a/man2/keyctl.2
+++ b/man2/keyctl.2
@@ -124,47 +124,25 @@ When linking,
 should be specified to the linker.
 .SH SEE ALSO
 .BR keyctl (1),
-.br
 .BR add_key (2),
-.br
 .BR request_key (2),
-.br
-.BR keyctl_get_keyring_ID (3),
-.br
-.BR keyctl_join_session_keyring (3),
-.br
-.BR keyctl_update (3),
-.br
-.BR keyctl_revoke (3),
-.br
+.BR keyctl_set_timeout (3),
 .BR keyctl_chown (3),
-.br
-.BR keyctl_setperm (3),
-.br
-.BR keyctl_describe (3),
-.br
 .BR keyctl_clear (3),
-.br
-.BR keyctl_link (3),
-.br
-.BR keyctl_unlink (3),
-.br
-.BR keyctl_search (3),
-.br
-.BR keyctl_read (3),
-.br
+.BR keyctl_describe (3),
+.BR keyctl_describe_alloc (3),
+.BR keyctl_get_keyring_ID (3),
 .BR keyctl_instantiate (3),
-.br
+.BR keyctl_join_session_keyring (3),
+.BR keyctl_link (3),
 .BR keyctl_negate (3),
-.br
+.BR keyctl_revoke (3),
+.BR keyctl_search (3),
+.BR keyctl_setperm (3),
 .BR keyctl_set_reqkey_keyring (3),
-.br
 .BR keyctl_set_timeout (3),
-.br
-.BR keyctl_assume_authority (3),
-.br
-.BR keyctl_describe_alloc (3),
-.br
+.BR keyctl_read (3),
 .BR keyctl_read_alloc (3),
-.br
+.BR keyctl_unlink (3),
+.BR keyctl_update (3),
 .BR request-key (8)
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
