From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getrlimit.2: fix example program
Date: Sat, 17 Sep 2011 07:15:32 +0200
Message-ID: <CAKgNAkiRaA_zDBy+E9YK+0RPiCyYJGbhouU11=7s5JdF+yOB=A@mail.gmail.com>
References: <4E5E4766.5040500@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E4766.5040500-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Seonghun,

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: Fix compile error of the example program.
> Use struct rlimit instead of rlimit64, which is used in prlimit64().
> Make error handling code similar with other examples.
>
>
> diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
> --- a/man2/getrlimit.2
> +++ b/man2/getrlimit.2
> @@ -529,11 +529,14 @@ The program below demonstrates the use of
> #include <unistd.h>
> #include <sys/resource.h>
>
> +#define handle_error(msg) \\
> + do { perror(msg); exit(EXIT_FAILURE); } while (0)
> +
> int
> main(int argc, char *argv[])
> {
> - struct rlimit64 old, new;
> - struct rlimit64 *newp;
> + struct rlimit old, new;
> + struct rlimit *newp;
> pid_t pid;
>
> if (!(argc == 2 || argc == 4)) {
> @@ -555,14 +558,16 @@ main(int argc, char *argv[])
> previous limit */
>
> if (prlimit(pid, RLIMIT_CPU, newp, &old) == \-1)
> - errExit("prlimit\-1");
> + handle_error("prlimit\-1");
> +
> printf("Previous limits: soft=%lld; hard=%lld\\n",
> (long long) old.rlim_cur, (long long) old.rlim_max);
>
> /* Retrieve and display new CPU time limit */
>
> if (prlimit(pid, RLIMIT_CPU, NULL, &old) == \-1)
> - errExit("prlimit\-2");
> + handle_error("prlimit\-2");
> +
> printf("New limits: soft=%lld; hard=%lld\\n",
> (long long) old.rlim_cur, (long long) old.rlim_max);

Thanks for this report. I applied the patch below.

Cheers

Michael

--- a/man2/getrlimit.2
+++ b/man2/getrlimit.2
@@ -61,7 +61,7 @@
 .\" 2008-05-07, mtk / Peter Zijlstra, Added description of RLIMIT_RTTIME
 .\" 2010-11-06, mtk: Added documentation of prlimit()
 .\"
-.TH GETRLIMIT 2 2010-12-03 "Linux" "Linux Programmer's Manual"
+.TH GETRLIMIT 2 2011-09-10 "Linux" "Linux Programmer's Manual"
 .SH NAME
 getrlimit, setrlimit, prlimit \- get/set resource limits
 .SH SYNOPSIS
@@ -84,7 +84,7 @@ Feature Test Macro Requirements for glibc (see
 .in
 .sp
 .BR prlimit ():
-_GNU_SOURCE
+_GNU_SOURCE && _FILE_OFFSET_BITS == 64
 .SH DESCRIPTION
 The
 .BR getrlimit ()
@@ -523,17 +523,21 @@ The program below demonstrates the use of
 .PP
 .nf
 #define _GNU_SOURCE
+#define _FILE_OFFSET_BITS 64
 #include <stdio.h>
 #include <time.h>
 #include <stdlib.h>
 #include <unistd.h>
 #include <sys/resource.h>

+#define errExit(msg)   do { perror(msg); exit(EXIT_FAILURE); \\
+                        } while (0)
+
 int
 main(int argc, char *argv[])
 {
-    struct rlimit64 old, new;
-    struct rlimit64 *newp;
+    struct rlimit old, new;
+    struct rlimit *newp;
     pid_t pid;

     if (!(argc == 2 || argc == 4)) {

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
