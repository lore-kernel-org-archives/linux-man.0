From: DJ Delorie <dj-Ht4Cp5ncgjRBDgjK7y7TUQ@public.gmane.org>
Subject: [patch] nsswitch.conf(5): clarify group merge rules
Date: Wed, 3 May 2017 17:06:54 -0400
Message-ID: <201705032106.v43L6s3k000768@envy.delorie.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


This minor patch clarifies when merging is not done, and how duplicate
entries are merged.

Found while extending glibc's NSS test suite, discussed with glibc
team and Stephen Gallagher.

diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
index 0405d4f..007c582 100644
--- a/man5/nsswitch.conf.5
+++ b/man5/nsswitch.conf.5
@@ -277,6 +277,10 @@ If the group is also found in the next entry (and the group name and GID
 are an exact match), the member list of the second entry will be added
 to the group object to be returned.
 Available since glibc 2.24.
+Note that merging will not be done for
+.BR getgrent (3)
+nor will duplicate members be pruned when they occur in both entries
+being merged.
 .RE
 .SS Compatibility mode (compat)
 The NSS "compat" service is similar to "files" except that it
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
