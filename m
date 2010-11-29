From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Typos in man2/getrlimit.2
Date: Mon, 29 Nov 2010 21:20:13 +0100
Message-ID: <AANLkTi=XkLN+t5iFT+uretO7V=p1mZnazH++DfFm42WK@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Here are the last bits against ea03a3a.

Denis


diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
index e34a152..fede0b2 100644
--- a/man2/getrlimit.2
+++ b/man2/getrlimit.2
@@ -542,7 +542,7 @@ main(int argc, char *argv[])
         exit(EXIT_FAILURE);
     }

-    pid = atoi(argv[1]);        /* PID of traget process */
+    pid = atoi(argv[1]);        /* PID of target process */

     newp = NULL;
     if (argc == 4) {
@@ -551,7 +551,7 @@ main(int argc, char *argv[])
         newp = &new;
     }

-    /* Set CPU time limit of target prcess; retrieve and display
+    /* Set CPU time limit of target process; retrieve and display
        previous limit */

     if (prlimit(pid, RLIMIT_CPU, newp, &old) == \-1)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
