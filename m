From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz-kPcTzGkeZgAdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] pthread_timedjoin_np.3: Document case where it return EINVAL
Date: Tue, 28 Aug 2012 14:37:00 +0200
Message-ID: <1346157420-22571-1-git-send-email-jezz@sysmic.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Pouiller <jezz-kPcTzGkeZgAdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46rom: Jerome Pouiller <jezz-kPcTzGkeZgAdnm+yROfE0A@public.gmane.org>


Signed-off-by: J=C3=A9r=C3=B4me Pouiller <jezz-kPcTzGkeZgAdnm+yROfE0A@public.gmane.org>
---
 man3/pthread_tryjoin_np.3 |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man3/pthread_tryjoin_np.3 b/man3/pthread_tryjoin_np.3
index ba1cd41..03de5dd 100644
--- a/man3/pthread_tryjoin_np.3
+++ b/man3/pthread_tryjoin_np.3
@@ -101,6 +101,10 @@ can in addition fail with the following error:
 The call timed out before
 .I thread
 terminated.
+.TP
+.BR EINVAL
+.I abstime
+value is invalid.
 .PP
 .BR pthread_timedjoin_np ()
 never returns the error
--=20
J=C3=A9r=C3=B4me Pouiller <jezz-kPcTzGkeZgAdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
