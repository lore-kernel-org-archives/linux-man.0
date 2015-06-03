From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] malloc_get_state.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 3 Jun 2015 18:16:31 +0800
Message-ID: <1433326594-25001-7-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1433326594-25001-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433326594-25001-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

After research, We think malloc_get_state() and malloc_set_state() are
thread-safe. But, there are not markings of them in glibc document.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/malloc_get_state.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/malloc_get_state.3 b/man3/malloc_get_state.3
index 6f3f87d..20dde14 100644
--- a/man3/malloc_get_state.3
+++ b/man3/malloc_get_state.3
@@ -83,6 +83,20 @@ is a more recent version than this implementation knows about,
 .\" if((ms->version & ~0xffl) > (MALLOC_STATE_VERSION & ~0xffl)) return -2;
 .BR malloc_set_state ()
 returns \-2.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw19 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR malloc_get_state (),
+.BR malloc_set_state ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 These functions are GNU extensions.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
