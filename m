From: ppluzhnikov-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org (Paul Pluzhnikov)
Subject: [patch] prctl.2: PR_SET_DUMPABLE makes process non-ptrace-attachable
Date: Fri,  6 May 2011 08:49:51 -0700 (PDT)
Message-ID: <20110506154952.1282C1909ED@elbrus2.mtv.corp.google.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ppluzhnikov-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael,

We've recently discovered that GDB will fail to attach to any process that
sets itself non-dumpable. Tested on kernel 2.6.32, with:


#include <stdio.h>
#include <stdlib.h>
#include <sys/prctl.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
  if (prctl(PR_SET_DUMPABLE, 0, 0, 0) != 0) {
    perror("prctl");
  }
  printf("Run gdb %s %d\n", argv[0], getpid());
  sleep(20);
  abort();
}


./a.out
Run gdb ./a.out 30476


gdb -q  ./a.out 30476
Reading symbols from /tmp/a.out...done.
Attaching to program: /tmp/a.out, process 30476
ptrace: Operation not permitted.
/tmp/30476: No such file or directory.



Attached patch (against current git trunk) documents this behavior.

Thanks,

--
Paul Pluzhnikov

diff --git a/man2/prctl.2 b/man2/prctl.2
index bb455fa..b469071 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -60,7 +60,7 @@ is called with a first argument describing what to do
 arguments with a significance depending on the first one.
 The first argument can be:
 .TP
-.BR PR_CAPBSET_READ " (since Linux 2.6.25)
+.BR PR_CAPBSET_READ " (since Linux 2.6.25)"
 Return (as the function result) 1 if the capability specified in
 .I arg2
 is in the calling thread's capability bounding set,
@@ -120,6 +120,9 @@ for security reasons, this feature has been removed.
 .I /proc/sys/fs/suid_dumpable
 in
 .BR proc (5).)
+Processes that are not dumpable can not be attached via
+.BR ptrace(2)
+.BR PTRACE_ATTACH "."
 .TP
 .BR PR_GET_DUMPABLE " (since Linux 2.3.20)"
 Return (as the function result) the current state of the calling
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
