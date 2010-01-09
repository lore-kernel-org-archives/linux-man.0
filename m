From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 9/9] "null terminated" -> "null-terminated"
Date: Sat,  9 Jan 2010 17:45:37 -0600
Message-ID: <1263080737-2868-10-git-send-email-mfwitten@gmail.com>
References: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1263080737-2868-1-git-send-email-mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The preferred spelling seems to be "null-terminated".

  fts.3           : "NULL-" -> "null-"
  getnetent.3     : "NULL-" -> "null-"
  getprotoent.3   : "NULL-" -> "null-"
  getrpcent.3     : "NULL-" -> "null-"
  getservent.3    : "NULL-" -> "null-"
  getsubopt.3     : "NULL-" -> "null-"
  putgrent.3      : "NULL " -> "null-"
  strcat.3        : "null " -> "null-"
  strcpy.3        : "null " -> "null-"
  console_ioctl.4 : "NULL " -> "null-"

Signed-off-by: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/fts.3           |    8 ++++----
 man3/getnetent.3     |    2 +-
 man3/getprotoent.3   |    2 +-
 man3/getrpcent.3     |    2 +-
 man3/getservent.3    |    2 +-
 man3/getsubopt.3     |    2 +-
 man3/putgrent.3      |    2 +-
 man3/strcat.3        |    4 ++--
 man3/strcpy.3        |    2 +-
 man4/console_ioctl.4 |    2 +-
 10 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/man3/fts.3 b/man3/fts.3
index 7927544..e7fc193 100644
--- a/man3/fts.3
+++ b/man3/fts.3
@@ -309,7 +309,7 @@ Upon return from the
 .BR fts_children ()
 function, the
 .I fts_link
-field points to the next structure in the NULL-terminated linked list of
+field points to the next structure in the null-terminated linked list of
 directory members.
 Otherwise, the contents of the
 .I fts_link
@@ -344,7 +344,7 @@ Therefore, the
 and
 .I fts_accpath
 fields are guaranteed to be
-NULL-terminated
+null-terminated
 .I only
 for the file most recently returned by
 .BR fts_read ().
@@ -362,7 +362,7 @@ are attempted.
 The
 .I fts_name
 field is always
-NULL-terminated.
+null-terminated.
 .SS fts_open()
 The
 .BR fts_open ()
@@ -572,7 +572,7 @@ The
 .BR fts_children ()
 function returns a pointer to an
 .I FTSENT
-structure describing the first entry in a NULL-terminated linked list of
+structure describing the first entry in a null-terminated linked list of
 the files in the directory represented by the
 .I FTSENT
 structure most recently returned by
diff --git a/man3/getnetent.3 b/man3/getnetent.3
index 72b3efa..a6dbfa6 100644
--- a/man3/getnetent.3
+++ b/man3/getnetent.3
@@ -100,7 +100,7 @@ The members of the \fInetent\fP structure are:
 The official name of the network.
 .TP
 .I n_aliases
-A NULL-terminated list of alternative names for the network.
+A null-terminated list of alternative names for the network.
 .TP
 .I n_addrtype
 The type of the network number; always
diff --git a/man3/getprotoent.3 b/man3/getprotoent.3
index 05c1d7c..2492983 100644
--- a/man3/getprotoent.3
+++ b/man3/getprotoent.3
@@ -98,7 +98,7 @@ The members of the \fIprotoent\fP structure are:
 The official name of the protocol.
 .TP
 .I p_aliases
-A NULL-terminated list of alternative names for the protocol.
+A null-terminated list of alternative names for the protocol.
 .TP
 .I p_proto
 The protocol number.
diff --git a/man3/getrpcent.3 b/man3/getrpcent.3
index 8135c16..ee56f04 100644
--- a/man3/getrpcent.3
+++ b/man3/getrpcent.3
@@ -46,7 +46,7 @@ The members of this structure are:
 The name of the server for this RPC program.
 .TP
 .I r_aliases
-A NULL-terminated list of alternate names for the RPC program.
+A null-terminated list of alternate names for the RPC program.
 .TP
 .I r_number
 The RPC program number for this service.
diff --git a/man3/getservent.3 b/man3/getservent.3
index 27df7af..b073ad7 100644
--- a/man3/getservent.3
+++ b/man3/getservent.3
@@ -106,7 +106,7 @@ The members of the \fIservent\fP structure are:
 The official name of the service.
 .TP
 .I s_aliases
-A NULL-terminated list of alternative names for the service.
+A null-terminated list of alternative names for the service.
 .TP
 .I s_port
 The port number for the service given in network byte order.
diff --git a/man3/getsubopt.3 b/man3/getsubopt.3
index e4ffd59..49dff25 100644
--- a/man3/getsubopt.3
+++ b/man3/getsubopt.3
@@ -51,7 +51,7 @@ that might be passed in
 
 The
 .I tokens
-argument is a pointer to a NULL-terminated list of the tokens that
+argument is a pointer to a null-terminated list of the tokens that
 .BR getsubopt ()
 will look for in
 .IR optionp .
diff --git a/man3/putgrent.3 b/man3/putgrent.3
index 522716b..a33e3df 100644
--- a/man3/putgrent.3
+++ b/man3/putgrent.3
@@ -18,7 +18,7 @@ function is the counterpart for
 The function writes the content of the provided \fIstruct group\fP into the
 file pointed to by
 .IR fp .
-The list of group members must be NULL terminated or NULL initialized.
+The list of group members must be null-terminated or null-initialized.
 .sp
 The \fIstruct group\fP is defined as follows:
 .sp
diff --git a/man3/strcat.3 b/man3/strcat.3
index eed90ea..26f8025 100644
--- a/man3/strcat.3
+++ b/man3/strcat.3
@@ -53,12 +53,12 @@ function is similar, except that
 .IP * 3
 it will use at most \fIn\fP characters from \fIsrc\fP; and
 .IP *
-\fIsrc\fP does not need to be null terminated if it contains
+\fIsrc\fP does not need to be null-terminated if it contains
 \fIn\fP or more characters.
 .PP
 As with
 .BR strcat (),
-the resulting string in \fIdest\fP is always null terminated.
+the resulting string in \fIdest\fP is always null-terminated.
 .PP
 If \fIsrc\fP contains \fIn\fP or more characters,
 .BR strncat ()
diff --git a/man3/strcpy.3 b/man3/strcpy.3
index 9d47e37..8adc2e9 100644
--- a/man3/strcpy.3
+++ b/man3/strcpy.3
@@ -57,7 +57,7 @@ function is similar, except that at most
 .BR Warning :
 If there is no null byte
 among the first \fIn\fP bytes of \fIsrc\fP,
-the string placed in \fIdest\fP will not be null terminated.
+the string placed in \fIdest\fP will not be null-terminated.
 .PP
 If the length of
 .I src
diff --git a/man4/console_ioctl.4 b/man4/console_ioctl.4
index 57c2c0b..7808af3 100644
--- a/man4/console_ioctl.4
+++ b/man4/console_ioctl.4
@@ -325,7 +325,7 @@ struct kbsentry {
 .fi
 .in
 
-\fIkb_string\fP is set to the (NULL terminated) string corresponding to
+\fIkb_string\fP is set to the (null-terminated) string corresponding to
 the \fIkb_func\fPth function key action code.
 .IP \fBKDSKBSENT\fP
 Sets one function key string entry.
-- 
1.6.6.102.gd6f8f

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
