From: Justin Pryzby <justinpryzby-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: manpages: explicit set SIGCHLD to SIG_IGN is distinct from SIG_DFL
Date: Mon, 7 Apr 2008 12:16:51 -0400
Message-ID: <20080407161651.GA22034@cetus>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Version: 2.79-2
File: /usr/share/man/man2/wait.2.gz

What do people think of something like the attached change?  While
working with Debian's cron package, I found that explicitly setting
the SIGCHLD action to SIG_IGN inhibits the creation of zombie
processes, even though kill(1) gives the "ignore" as the default
disposition.

Consider the attached example program.  Any of the following changes
will cause a zombie process to be visible in a ps -ef process listing:

 . remove the call to signal();
 . change SIG_IGN to SIG_DFL;
 . remove the sleep(1); (due to process scheduling, the zombie is only
   sometimes visible);
 . ???

--- /usr/share/man/man2/wait.2.gz
+++ /tmp/wait2.gz.22000	2008-04-07 12:02:31.000000000 -0400
@@ -46,7 +46,7 @@
 .\"	Much other text rewritten
 .\" 2005-05-10, mtk, __W* flags can't be used with waitid()
 .\"
-.TH WAIT 2  2007-07-26 "Linux" "Linux Programmer's Manual"
+.TH WAIT 2  2008-04-07 "Linux" "Linux Programmer's Manual"
 .SH NAME
 wait, waitpid, waitid \- wait for process to change state
 .SH SYNOPSIS
@@ -429,7 +429,7 @@
 
 POSIX.1-2001 specifies that if the disposition of
 .B SIGCHLD
-is set to
+is set explicitly to
 .B SIG_IGN
 or the
 .B SA_NOCLDWAIT


--KsGdsel6WgEHnImy
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="sig.c"

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

#include <sys/types.h>
#include <sys/wait.h>

int main()
{
	int status;
	void *ret;
	pid_t pid, p2;

	int pp[2];
	if (pipe(pp)) {
		perror("pipe");
		exit(EXIT_FAILURE);
	}

	switch (pid=fork()) {
	case -1:
		perror("fork");
		exit(EXIT_FAILURE);
	case 0:	// Child
		close(pp[0]);
		switch (pid=fork()) {
		case -1:
			perror("fork");
			exit(EXIT_FAILURE);
		case 0:	// Child
			sleep(10);
			break;
		default:
			exit(EXIT_SUCCESS);
		}
		exit(EXIT_SUCCESS);
	default: // Parent
		close(pp[1]);

		ret=signal(SIGCHLD, SIG_IGN);
		if (ret==SIG_ERR) {
			perror("signal");
		} else if (ret==SIG_IGN) {
			fputs("was: sig_ign\n", stderr);
		} else if (ret==SIG_DFL) {
			fputs("was: sig_dfl\n", stderr);
		} else {
			fputs("unknown initial signal handler\n", stderr);
		}

		break;
	}

	sleep(1);
	for ( ; 1; ) {
		char buf;
		switch (read(pp[0], &buf, sizeof buf)) {
			case 0:	// EOF
				exit(EXIT_SUCCESS);
			case -1:
				perror("read");
				exit(EXIT_FAILURE);
			case 1:
				continue;
		}
	}

	for ( ; 1; ) {
		p2=waitpid(pid, &status, WUNTRACED);
		if (p2==-1) {
			if (errno==ECHILD) break;
			perror("wait");
			exit(EXIT_FAILURE);
		}

		if (WIFEXITED(status)) {
			status=WEXITSTATUS(status);
			if (status==0) {
				puts("Exited successfully");
			} else {
				printf("Exited with status: %d\n", status);
			}
		} else if (WIFSIGNALED(status)) {
#ifndef	WCOREDUMP
#define	WCOREDUMP 0
#endif
			printf("Killed by signal: %d%s\n", WTERMSIG(status),
					WCOREDUMP(status)?"; dumped core":"");
		} else if (WIFSTOPPED(status)) {
			status=WSTOPSIG(status);
			printf("Stopped by signal: %d\n", status);
			// kill(getpid(), status);
		}
	}

	exit(EXIT_SUCCESS);
}

--KsGdsel6WgEHnImy--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
