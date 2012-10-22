From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl: document PR_SET_NO_NEW_PRIVS, PR_GET_NO_NEW_PRIVS
Date: Mon, 22 Oct 2012 09:43:39 +0200
Message-ID: <CAKgNAki2vhbgismBWddaEFXVawea_T+eTNQSnDNMGVysbWAm5w@mail.gmail.com>
References: <20120920235407.GA3769@www.outflux.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120920235407.GA3769-0X9Bc/hWBUTk6RaD4rd5nQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wad-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Sep 21, 2012 at 1:54 AM, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> This adds a short description of the no_new_privs bit, as described in
> Documentation/prctl/no_new_privs.txt.

Thanks Kees. Applied.

Cheers,

Michael


> Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  man2/prctl.2 |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
>
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index a44aa32..220c031 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -42,6 +42,7 @@
>  .\" 2012-04-25 Michael Kerrisk, Document PR_TASK_PERF_EVENTS_DISABLE and
>  .\"                            PR_TASK_PERF_EVENTS_ENABLE
>  .\" 2012-09-20 Kees Cook, update PR_SET_SECCOMP for mode 2
> +.\" 2012-09-20 Kees Cook, document PR_SET_NO_NEW_PRIVS, PR_GET_NO_NEW_PRIVS
>  .\"
>  .\" FIXME: Document PR_SET_TIMERSLACK and PR_GET_TIMERSLACK (new in 2.6.28)
>  .\"            commit 6976675d94042fbd446231d1bd8b7de71a980ada
> @@ -216,6 +217,19 @@ in the buffer pointed to by
>  The buffer should allow space for up to 16 bytes;
>  the returned string will be null-terminated if it is shorter than that.
>  .TP
> +.BR PR_SET_NO_NEW_PRIVS " (since Linux 3.5)"
> +Set the current process's \fIno_new_privs\fP bit to the value in
> +\fIarg2\fP.  With \fIno_new_privs\fP set to 1, execve promises not
> +to grant the privilege to do anything that could not have been done
> +without the execve call (for example, rendering setuid, setgid, and file
> +capabilities non-functional).  When enabled, this value is inherited
> +across fork, clone, and execve and cannot be unset.
> +.TP
> +.BR PR_GET_NO_NEW_PRIVS " (since Linux 3.5)"
> +Return the value of the \fIno_new_privs\fP bit for the current process. A
> +value of 0 indicates the regular execve behavior. A value of 1 indicates
> +execve will operate in the privilege restricting mode described above.
> +.TP
>  .BR PR_SET_PDEATHSIG " (since Linux 2.1.57)"
>  Set the parent process death signal
>  of the calling process to \fIarg2\fP (either a signal value
> @@ -567,6 +581,7 @@ option.
>  On success,
>  .BR PR_GET_DUMPABLE ,
>  .BR PR_GET_KEEPCAPS ,
> +.BR PR_GET_NO_NEW_PRIVS ,
>  .BR PR_CAPBSET_READ ,
>  .BR PR_GET_TIMING ,
>  .BR PR_GET_SECUREBITS ,
> --
> 1.7.0.4
>
>
> --
> Kees Cook
> Chrome OS Security



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
