From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] wcstoimax.3: ATTRIBUTES: Note functions that are thread safe with exceptions
Date: Mon, 18 Nov 2013 13:51:16 +0800
Message-ID: <1384753876-26499-1-git-send-email-penght@cn.fujitsu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions wcstoimax() and wcstoumax() are thread safe with
exceptions.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/wcstoimax.3 | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/man3/wcstoimax.3 b/man3/wcstoimax.3
index c79ccda..626aa3c 100644
--- a/man3/wcstoimax.3
+++ b/man3/wcstoimax.3
@@ -21,7 +21,7 @@
 .\" <http://www.gnu.org/licenses/>.
 .\" %%%LICENSE_END
 .\"
-.TH WCSTOIMAX 3 2003-11-01 "" "Linux Programmer's Manual"
+.TH WCSTOIMAX 3 2013-11-18 "" "Linux Programmer's Manual"
 .SH NAME
 wcstoimax, wcstoumax \- convert wide-character string to integer
 .SH SYNOPSIS
@@ -46,6 +46,17 @@ except that they return a value of type
 and
 .IR uintmax_t ,
 respectively.
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR wcstoimax ()
+and
+.BR wcstoumax ()
+functions are thread-safe with exceptions.
+These functions can be safely used in multithreaded applications,
+as long as
+.BR setlocale (3)
+is not called to change the locale.
 .SH CONFORMING TO
 C99.
 .SH SEE ALSO
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
