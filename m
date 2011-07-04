From: Sebastian Geiger <sbastig-hi6Y0CQ0nG0@public.gmane.org>
Subject: man execve / Suggestion
Date: Mon, 04 Jul 2011 17:11:14 +0200
Message-ID: <4E11D812.2080600@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I would like to suggest an improvement on the execve man-page (Page
Version 3.27). In the description of the execve system call I would
suggest to add a reminder that the argv arrays need to have put the
programm name as its first argument.

For the unexperienced it is easy to write something as such:

char* program = "/usr/bin/ls";
char* file = "-lah";
char* argv[] = {file, NULL}; //should be {program, file, NULL}
char* envp[] = {NULL};
execve(eog, argv, envp);

For the experienced programmers this is probably obvious, yet for those
more unexperienced it would be a useful hint if the man-page said
something like:

"Remember the first argument in the argv array should be the path to the
programm that is about to be executed and your custom arguments should
start from the second position."

Regards
Sebastian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
