From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] getrlimit.2: fix example program
Date: Wed, 31 Aug 2011 23:38:30 +0900
Message-ID: <4E5E4766.5040500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: Fix compile error of the example program.
Use struct rlimit instead of rlimit64, which is used in prlimit64().
Make error handling code similar with other examples.


diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
--- a/man2/getrlimit.2
+++ b/man2/getrlimit.2
@@ -529,11 +529,14 @@ The program below demonstrates the use of
#include <unistd.h>
#include <sys/resource.h>

+#define handle_error(msg) \\
+ do { perror(msg); exit(EXIT_FAILURE); } while (0)
+
int
main(int argc, char *argv[])
{
- struct rlimit64 old, new;
- struct rlimit64 *newp;
+ struct rlimit old, new;
+ struct rlimit *newp;
pid_t pid;

if (!(argc == 2 || argc == 4)) {
@@ -555,14 +558,16 @@ main(int argc, char *argv[])
previous limit */

if (prlimit(pid, RLIMIT_CPU, newp, &old) == \-1)
- errExit("prlimit\-1");
+ handle_error("prlimit\-1");
+
printf("Previous limits: soft=%lld; hard=%lld\\n",
(long long) old.rlim_cur, (long long) old.rlim_max);

/* Retrieve and display new CPU time limit */

if (prlimit(pid, RLIMIT_CPU, NULL, &old) == \-1)
- errExit("prlimit\-2");
+ handle_error("prlimit\-2");
+
printf("New limits: soft=%lld; hard=%lld\\n",
(long long) old.rlim_cur, (long long) old.rlim_max);


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
