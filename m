From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man execve / Suggestion
Date: Sat, 17 Sep 2011 07:13:26 +0200
Message-ID: <CAKgNAkjSCkAY4CMw+xqzw4gtRJWMOP=z+TWG+R=jBg_x5F9g8Q@mail.gmail.com>
References: <4E11D812.2080600@gmx.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E11D812.2080600-hi6Y0CQ0nG0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Geiger <sbastig-hi6Y0CQ0nG0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Sebastian,

On Mon, Jul 4, 2011 at 5:11 PM, Sebastian Geiger <sbastig-hi6Y0CQ0nG0@public.gmane.org> wrote:
> I would like to suggest an improvement on the execve man-page (Page
> Version 3.27). In the description of the execve system call I would
> suggest to add a reminder that the argv arrays need to have put the
> programm name as its first argument.
>
> For the unexperienced it is easy to write something as such:
>
> char* program = "/usr/bin/ls";
> char* file = "-lah";
> char* argv[] = {file, NULL}; //should be {program, file, NULL}
> char* envp[] = {NULL};
> execve(eog, argv, envp);
>
> For the experienced programmers this is probably obvious, yet for those
> more unexperienced it would be a useful hint if the man-page said
> something like:
>
> "Remember the first argument in the argv array should be the path to the
> programm that is about to be executed and your custom arguments should
> start from the second position."

Thanks for the report. The exec(3) page already contains text along
the lines you suggest, and of course execve(2) should also. For
man-pages-3.33, I applied the patch below.

Cheers,

Michael

--- a/man2/execve.2
+++ b/man2/execve.2
@@ -58,6 +58,8 @@ starting with a line of the form:
 For details of the latter case, see "Interpreter scripts" below.

 \fIargv\fP is an array of argument strings passed to the new program.
+By convention, the first of these strings should contain the filename
+associated with the file being executed.
 \fIenvp\fP is an array of strings, conventionally of the form
 \fBkey=value\fP, which are passed as environment to the new program.
 Both \fIargv\fP and \fIenvp\fP must be terminated by a null pointer.




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
