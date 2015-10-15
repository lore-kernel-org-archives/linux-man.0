From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
Subject: [PATCH] fnmatch.3: Describe the FNM_EXTMATCH flag and pattern syntax
Date: Thu, 15 Oct 2015 09:58:28 +0100
Message-ID: <1444899508-24394-1-git-send-email-P@draigBrady.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <libc-alpha-return-64088-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
To: mtk.manpages@gmail.com
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org, =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Pádraig Brady <P@draigBrady.com>
---
 man3/fnmatch.3 | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/man3/fnmatch.3 b/man3/fnmatch.3
index a7c55ff..3502e06 100644
--- a/man3/fnmatch.3
+++ b/man3/fnmatch.3
@@ -86,6 +86,32 @@ use of glibc and is implemented only in certain cases.
 .B FNM_CASEFOLD
 If this flag (a GNU extension) is set, the pattern is matched
 case-insensitively.
+.TP
+.B FNM_EXTMATCH
+If this flag (a GNU extension) is set, extended patterns are
+supported, as introduced by \&'ksh' and now supported by other shells.
+The extended format is as follows, with \fIpattern\-list\fR
+being a \&'|' separated list of patterns.
+.TP
+\&'?(\fIpattern\-list\fR)'
+The pattern matches if zero or one occurrences of any of the
+patterns in the \fIpattern\-list\fR match the input \fIstring\fR.
+.TP
+\&'*(\fIpattern\-list\fR)'
+The pattern matches if zero or more occurrences of any of the
+patterns in the \fIpattern\-list\fR match the input \fIstring\fR.
+.TP
+\&'+(\fIpattern\-list\fR)'
+The pattern matches if one or more occurrences of any of the
+patterns in the \fIpattern\-list\fR match the input \fIstring\fR.
+.TP
+\&'@(\fIpattern\-list\fR)'
+The pattern matches if exactly one occurrence of any of the
+patterns in the \fIpattern\-list\fR match the input \fIstring\fR.
+.TP
+\&'!(\fIpattern\-list\fR)'
+The pattern matches if the input \fIstring\fR cannot be matched with
+any of the patterns in the \fIpattern\-list\fR.
 .SH RETURN VALUE
 Zero if
 .I string
-- 
2.5.0
