From: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] prctl.2: PR_SET_PDEATHSIG by orphan process
Date: Wed,  6 Jan 2016 19:23:26 +0100
Message-ID: <1452104606-25569-1-git-send-email-jann@thejh.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Proof:
In kernel/sys.c:

	case PR_SET_PDEATHSIG:
		if (!valid_signal(arg2)) {
			error = -EINVAL;
			break;
		}
		me->pdeath_signal = arg2;
		break;

Testcase:

#include <sys/prctl.h>
#include <err.h>
#include <unistd.h>
#include <signal.h>
#include <stdio.h>

void ponk(int s) {
  puts("ponk!");
}

int main(void) {
  if (fork() == 0) {
    if (fork() == 0) {
      sleep(1);
      signal(SIGUSR1, ponk);
      prctl(PR_SET_PDEATHSIG, SIGUSR1, 0, 0, 0);
      sleep(1);
      return 0;
    }
    return 0;
  }

  sleep(3);
  return 0;
}
---
 man2/prctl.2 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 5cea3bb..3dce8e9 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -670,6 +670,9 @@ In other words, the signal will be sent when that thread terminates
 (via, for example,
 .BR pthread_exit (3)),
 rather than after all of the threads in the parent process terminate.
+
+If the parent has already died by the time the parent death signal
+is set, the new parent death signal will not be sent.
 .TP
 .BR PR_GET_PDEATHSIG " (since Linux 2.3.15)"
 Return the current value of the parent process death signal,
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
