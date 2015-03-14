From: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
Subject: [PATCH] tzset.3: Add 'std' quoting information
Date: Sat, 14 Mar 2015 16:06:59 -0400
Message-ID: <550494E3.9080508@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


Signed-off-by: J William Piggott <elseifthen-KK0ffGbhmjU@public.gmane.org>
---

The following changes since commit f6d086878485f63e390d10f59b6beae7b96c4120:

  host.conf.5: grfix (2015-03-10 08:19:07 +0100)

are available in the git repository at:

  git-9UaJU3cA/F/QT0dZR+AlfA@public.gmane.org:jwpi/man-pages.git tzset4

for you to fetch changes up to 5667215d996032e6cc8616039082a48adda0d01b:

  tzset.3: Add 'std' quoting information (2015-03-14 15:42:28 -0400)

 man3/tzset.3 | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/man3/tzset.3 b/man3/tzset.3
index 2eec8a3..f09ba9f 100644
--- a/man3/tzset.3
+++ b/man3/tzset.3
@@ -99,8 +99,11 @@ timezone to be used:
 .RE
 .sp
 There are no spaces in the specification.
-The \fIstd\fP string specifies the name of the timezone and must be
+The \fIstd\fP string specifies an abbreviation for the timezone and must be
 three or more alphabetic characters.
+When enclosed between the less-than (<) and greater-than (>) signs, the
+characters set is expanded to include the plus (+) sign, the minus (-)
+sign, and digits.
 The \fIoffset\fP string immediately
 follows \fIstd\fP and specifies the time value to be added to the local
 time to get Coordinated Universal Time (UTC).
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
