From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: execve man page
Date: Thu, 21 Apr 2016 10:16:58 +0200
Message-ID: <CAKgNAkjYvP3jcgP891UUf+ZsdJAmOqiJ2VF3p9q3E4J8bhV+fg@mail.gmail.com>
References: <485015.29084.qm@web110302.mail.gq1.yahoo.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <485015.29084.qm-3jHsvP0p17GZZBmlwP4mLPu2YVrzzGjVVpNB7YpNyf8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valery Reznic <valery_reznic-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Valery,

On 21 March 2010 at 09:41, Valery Reznic <valery_reznic-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:
> Hi, somewhere between Fedora 8 and Fedora 12 (2.6.31.5-127.fc12)
> execve system call was changed to accept script interpreter that interpreter itself.
> But man execve still said:
> -----------------------------------------------------
>   Interpreter scripts
>        An  interpreter  script  is  a  text  file  that has execute permission
>        enabled and whose first line is of the form:
>
>            #! interpreter [optional-arg]
>
>        The interpreter must be a valid pathname for an executable which is NOT
>        ITSELF  A  SCRIPT.
> -----------------------------------------------------
> It's a bit out of date now.

So, some much delayed checking confirmed what you say. I applied the
patch below.

Cheers,

Michael

--- a/man2/execve.2
+++ b/man2/execve.2
@@ -273,8 +273,7 @@ permission enabled and whose first line is of the form:

 The
 .I interpreter
-must be a valid pathname for an
-executable which is not itself a script.
+must be a valid pathname for an executable file.
 If the
 .I filename
 argument of
@@ -302,6 +301,13 @@ For portable use,
 .I optional-arg
 should either be absent, or be specified as a single word (i.e., it
 should not contain white space); see NOTES below.
+
+Since Linux 2.6.28,
+.\" commit bf2a9a39639b8b51377905397a5005f444e9a892
+the kernel permits the interpreter of a script to itself be a script.
+This permission is recursive, up to a limit of four recursions,
+so that the interpreter may be a script which is interpreted by script,
+and so on.
 .SS Limits on size of arguments and environment
 Most UNIX implementations impose some limit on the total size
 of the command-line argument
@@ -426,6 +432,14 @@ Too many symbolic links were encountered in resolving
 .I filename
 or the name of a script or ELF interpreter.
 .TP
+.B ELOOP
+The maximum recursion limit was reached during recursive script
+interpretation (see "Interpreter scripts", above).
+Before Linux 3.8,
+.\" commit d740269867021faf4ce38a449353d2b986c34a67
+the error produced for this case was
+.BR ENOEXEC .
+.TP
 .B EMFILE
 The per-process limit on the number of open file descriptors has been reached.
 .TP

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
