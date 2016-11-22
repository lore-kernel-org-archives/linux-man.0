From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] system.3: Document additional return values
Date: Tue, 22 Nov 2016 23:43:01 +0100
Message-ID: <99bada06-69d8-75f5-09ec-7ca2680db7ab@gmail.com>
References: <1479749656-6643-1-git-send-email-quentin@armitage.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479749656-6643-1-git-send-email-quentin-/BKvNsQo1N6tmTQ+vhA3Yw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Quentin Armitage <quentin-/BKvNsQo1N6tmTQ+vhA3Yw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Quentin

Thanks for your effort in preparing this patch, but I tend to 
agree with Mike that much of this is shell-specific, and may
not be suitable for inclusion in this man page.
Some comments below.

On 11/21/2016 06:34 PM, Quentin Armitage wrote:
> Reason for finding problem:
> 
> While developing an application using system(), I discovered returned
> values that weren't documented in the system.3 man page.
> 
> man-pages version:
> 
> Version 4.08, git commit 176b1a76656f5871c3d8ada29769e48b46215d66
> 
> Demonstration of problem:
> 
> The following code demonstrates the problem
> ===========================================
> #include <stdio.h>
> #include <stdlib.h>
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <unistd.h>
> #include <string.h>
> #include <sys/wait.h>
> 
> char file_name[] = "/tmp/test_system.sh";
> 
> void write_script(void)
> {
> 	FILE *fp = fopen(file_name, "w");
> 	char *script =
> "#!/bin/bash\n"
> "\n"
> "[[ $1 != NO ]] && kill -${1:-TERM} $$ 2>/dev/null\n"
> "\n"
> "exit ${2:-12}\n"
> ;
> 
> 	fwrite(script, strlen(script), 1, fp);
> 	fclose(fp);
> }
> 
> static void
> run_command(const char *cmd, const char *feature)
> {
> 	int ret;
> 	char command_buf[sizeof(file_name) + 30];	// Give ourselves lots of space
> 
> 	sprintf(command_buf, "%s %s 2>/dev/null", file_name, cmd);
> 	ret = system(command_buf);
> 	printf("system() on %s returned exited with ", feature);
> 	if (WIFSIGNALED(ret))
> 		printf("signal %d", WTERMSIG(ret));
> 	else if (WIFEXITED(ret))
> 		printf("exit code %d", WEXITSTATUS(ret));
> 	else
> 		printf("return value 0x%x\n", ret);
> 	printf("\n");
> }
> 
> int main(int argc, char **argv)
> {
> 	struct stat buf;
> 
> 	if (stat(file_name, &buf) == 0) {
> 		fprintf(stderr, "%s exists, not overwriting\n", file_name);
> 		exit(1);
> 	}
> 
> 	run_command("11", "on non existant script");
> 
> 	write_script();
> 	chmod(file_name, S_IWUSR);
> 
> 	run_command("12", "non readable script");
> 
> 	chmod(file_name, S_IRUSR | S_IWUSR);
> 
> 	run_command("13", "non executable script");
> 
> 	chmod(file_name, S_IRUSR | S_IWUSR | S_IXUSR);
> 
> 	run_command("TERM", "script terminating with SIGTERM");
> 
> 	run_command("NO 10", "script exiting with exit status 10");
> 
> 	run_command("65 15", "script exiting after invalid signal and exit status 15");
> 
> 	unlink(file_name);
> }
> ===========================================
> 
> The patch
> ===========================================
> system.3: Document additional return values
> 
> The man page did not include return values 126 (for no permission to
> execute command), or values 128+n when command is terminated by
> signal n.
> 
> Signed-off-by: Quentin Armitage <quentin-/BKvNsQo1N6tmTQ+vhA3Yw@public.gmane.org>
> ---
>  man3/system.3 |   25 +++++++++++++++++++++----
>  1 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/man3/system.3 b/man3/system.3
> index a41e61a..04bed24 100644
> --- a/man3/system.3
> +++ b/man3/system.3
> @@ -84,17 +84,25 @@ If a child process could not be created,
>  or its status could not be retrieved,
>  the return value is \-1.
>  .IP *
> -If a shell could not be executed in the child process,
> +If a shell could not be found by the child process,

Why this change? I think "could not be executed" is more exact,
but maybe I have missed something?

>  then the return value is as though the child shell terminated by calling
>  .BR _exit (2)
>  with the status 127.
>  .IP *
> +If the shell cannot find the command, then the return value will be 127.
> +If the shell finds the command but cannot execute it, the return value
> +may be 126 or 127, depending on the shell.
> +See the man page for
> +.BR sh (1)
> +for details for the specific shell in use.

The 126 exit status is a bash-ism. I'm not sure that other shells 
do this. Overall, I think these shell details probably don't belong
in this man page.

> +.IP *
>  If all system calls succeed,
>  then the return value is the termination status of the child shell
>  used to execute
>  .IR command .
>  (The termination status of a shell is the termination status of
> -the last command it executes.)
> +the last command it executes, or if terminated by signal \fIn\fP,
> +128+\fIn\fP).

The detail about signals isn't specified in POSIX, and while many 
shells do this, not all do. For example, on ksh the status in this
case is 256+n. And, this (128+n) is the value that turns up in 
$? inside the shell, but it's not the value returned by system(),
as far as I can see.

>  .PP
>  In the last two cases,
>  the return value is a "wait status" that can be examined using
> @@ -105,6 +113,9 @@ the macros described in
>  .BR WEXITSTATUS (),
>  and so on).
>  .PP
> +Specifically, if the shell can be executed,
> +the return status will be the termination status of the shell.

This appears to repeat a point already made just above in the 
text:

       *  If  all system calls succeed, then the return value is the ter‐
          mination status of the child shell  used  to  execute  command.
          (The termination status of a shell is the termination status of
          the last command it executes.)

> +.PP
>  .BR system ()
>  does not affect the wait status of any other children.
>  .SH ATTRIBUTES
> @@ -206,11 +217,17 @@ the calling program has previously called
>  .BR chroot (2)
>  (which is not specified by POSIX.1-2001).
>  .PP
> -It is possible for the shell command to terminate with a status of 127,
> +It is possible for the shell command to terminate with a status greater
> +than 125,
>  which yields a
>  .BR system ()
>  return value that is indistinguishable from the case
> -where a shell could not be executed in the child process.
> +where a shell could not be executed in the child process,
> +the shell could not execute the command,

Regarding the previous line, see my comments above.

> +or where the child process was terminated by a signal

I think that last line is in any case incorrect.

> +(although a return value greater than 128 +
> +.BR SIGRTMAX
> +should be the exit status of the command).
>  .SH SEE ALSO
>  .BR sh (1),
>  .BR execve (2),

Summary: I think many of the pieces you've found are correct,
but they relate to shell specific details that probably 
shouldn't be documented here. In any case, thanks for the
effort you put in.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
