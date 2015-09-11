From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] signal.7: add missing async-signal-safe functions
Date: Fri, 11 Sep 2015 12:59:31 +0200
Message-ID: <55F2B413.5090003@gmail.com>
References: <1441638469-22062-1-git-send-email-mhocko@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441638469-22062-1-git-send-email-mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

On 09/07/2015 05:07 PM, mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org wrote:
> From: Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>
> 
> It seems that few async-signal-safe functions listed by POSIX.1-2008
> http://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html#tag_15_04_03
> are not mentioned in the man page. I am not exactly sure in which
> version of the standard they have declared as signal safe. So they
> were added to the section according to which standard they conform to:
> 
> POSIX.1-2001
> - fchdir
> - pthread_self
> - pthread_sigmask
> 
> POSIX.1-2008
> - pthread_kill

Thanks for spotting this. I had missed it myself.
I see now that those 4 functions were added in POSIX.1-2008
Technical Corrigendum 1 (2013). So, I've applied a different
patch (below). Thanks for catching this, and the effort on the
patch.

Cheers,

Michael


--- a/man7/signal.7
+++ b/man7/signal.7
@@ -630,6 +630,18 @@ utimensat()
 utimes()
 .fi
 .in
+.PP
+POSIX.1-2008 Technical Corrigendum 1 (2013)
+adds the following functions:
+.PP
+.in +4n
+.nf
+fchdir()
+pthread_kill()
+pthread_self()
+pthread_sigmask()
+.fi
+.in
 .SS Interruption of system calls and library functions by signal handlers
 If a signal handler is invoked while a system call or library
 function call is blocked, then either:



> Signed-off-by: Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>
> ---
>  man7/signal.7 | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/man7/signal.7 b/man7/signal.7
> index 4710945a2ab8..18871420cb16 100644
> --- a/man7/signal.7
> +++ b/man7/signal.7
> @@ -510,6 +510,7 @@ execve()
>  fchmod()
>  fchown()
>  fcntl()
> +fchdir()
>  fdatasync()
>  fork()
>  fpathconf()
> @@ -541,6 +542,8 @@ pipe()
>  poll()
>  posix_trace_event()
>  pselect()
> +pthread_self()
> +pthread_sigmask()
>  raise()
>  read()
>  readlink()
> @@ -622,6 +625,7 @@ mkfifoat()
>  mknod()
>  mknodat()
>  openat()
> +pthread_kill()
>  readlinkat()
>  renameat()
>  symlinkat()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
