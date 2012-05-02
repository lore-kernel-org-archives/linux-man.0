From: Pedro Alves <palves-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace.2: PTRACE_KILL needs a stopped process too
Date: Wed, 02 May 2012 13:06:28 +0100
Message-ID: <4FA12344.4090608@redhat.com>
References: <20091216004533.22261.qmail@kosh.dhis.org> <CAKgNAkhtu8d0NKcTwWyCA8qWgz8Lag+GcpEE1=YMVe_Nh8XJ9Q@mail.gmail.com> <20120422200459.GA7519@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120422200459.GA7519-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/22/2012 09:04 PM, Oleg Nesterov wrote:

> On 04/23, Michael Kerrisk (man-pages) wrote:
>>
>> [widening CC]
> 
> add more CC's
> 
>> The man page says "For requests other than PTRACE_KILL,
> 
> Argh, PTRACE_KILL again.
> 
> You know, I simply do not know what it was supposed to do. I can only
> see what the code actually does.
> 
>> the child process
>> must be stopped."
> 
> Yes and no.
> 
> Yes, ptrace(PTRACE_KILL) "succeeds" even if the tracee is not stopped.
> 
> No, it has no effect if the tracee is not stopped.
> 
> All I can say is: PTRACE_KILL should never exist. If you want to kill
> the tracee, you can do kill(SIGKILL).
> 
> Roughly, ptrace(PTRACE_KILL) is equal to ptrace(PTRACE_CONT, SIGKILL)
> except it always returns 0.
> 
>> If the man page is describing actual intended kernel behavior, then it's a
>> fairly long-standing kernel bug.
> 
> Perhaps. May be it should simply do kill(SIGKILL), but then it is not
> clear why do we have PTRACE_KILL. And once again, I was never able to
> understand the supposed behaviour.
> 
> Personally, I think we should fix the documentation. And imho the only
> possible fix is to add this note: do not ever use PTRACE_KILL.


Yeah.  Here's what gdb's gdbserver does nowadays (gdb does the exact same,
though only gdbserver's version has this comment):

static void
linux_kill_one_lwp (struct lwp_info *lwp)
{
  int pid = lwpid_of (lwp);

  /* PTRACE_KILL is unreliable.  After stepping into a signal handler,
     there is no signal context, and ptrace(PTRACE_KILL) (or
     ptrace(PTRACE_CONT, SIGKILL), pretty much the same) acts like
     ptrace(CONT, pid, 0,0) and just resumes the tracee.  A better
     alternative is to kill with SIGKILL.  We only need one SIGKILL
     per process, not one for each thread.  But since we still support
     linuxthreads, and we also support debugging programs using raw
     clone without CLONE_THREAD, we send one for each thread.  For
     years, we used PTRACE_KILL only, so we're being a bit paranoid
     about some old kernels where PTRACE_KILL might work better
     (dubious if there are any such, but that's why it's paranoia), so
     we try SIGKILL first, PTRACE_KILL second, and so we're fine
     everywhere.  */

  errno = 0;
  kill (pid, SIGKILL);
  if (debug_threads)
    fprintf (stderr,
	     "LKL:  kill (SIGKILL) %s, 0, 0 (%s)\n",
	     target_pid_to_str (ptid_of (lwp)),
	     errno ? strerror (errno) : "OK");

  errno = 0;
  ptrace (PTRACE_KILL, pid, 0, 0);
  if (debug_threads)
    fprintf (stderr,
	     "LKL:  PTRACE_KILL %s, 0, 0 (%s)\n",
	     target_pid_to_str (ptid_of (lwp)),
	     errno ? strerror (errno) : "OK");
}

-- 
Pedro Alves
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
