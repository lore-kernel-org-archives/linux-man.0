From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] posix_fadvise.2, tee.2: adjust code indentation
Date: Thu, 01 Sep 2011 00:10:24 +0900
Message-ID: <4E5E4EE0.7070504@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository


diff --git a/man2/posix_fadvise.2 b/man2/posix_fadvise.2
--- a/man2/posix_fadvise.2
+++ b/man2/posix_fadvise.2
@@ -165,7 +165,7 @@ system call that orders the arguments suitably:
.in +4n
.nf
.BI "long arm_fadvise64_64(int " fd ", int " advice ,
-.BI " loff_t " offset ", loff_t " len );
+.BI " loff_t " offset ", loff_t " len );
.fi
.in
.PP
diff --git a/man2/tee.2 b/man2/tee.2
--- a/man2/tee.2
+++ b/man2/tee.2
@@ -149,8 +149,8 @@ main(int argc, char *argv[])
int len, slen;

if (argc != 2) {
- fprintf(stderr, "Usage: %s <file>\\n", argv[0]);
- exit(EXIT_FAILURE);
+ fprintf(stderr, "Usage: %s <file>\\n", argv[0]);
+ exit(EXIT_FAILURE);
}

fd = open(argv[1], O_WRONLY | O_CREAT | O_TRUNC, 0644);

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
