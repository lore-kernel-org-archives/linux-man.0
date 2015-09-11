From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: add PTRACE_O_SUSPEND_SECCOMP flag
Date: Fri, 11 Sep 2015 14:02:51 +0200
Message-ID: <CAKgNAkimMneguqaKXuHP3rm1CG+QvudQFzS1D9XNetyjmz1K=A@mail.gmail.com>
References: <1434562933-2995-1-git-send-email-tycho@tycho.ws>
 <CAGXu5j+OucgCTOOwd80sHHqjqcAAF6+NR+dVovN8OtpwNmicDg@mail.gmail.com> <20150618213122.GC11501@hopstrocity>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150618213122.GC11501@hopstrocity>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tycho Andersen <tycho.andersen-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Tycho,

On 18 June 2015 at 23:31, Tycho Andersen <tycho.andersen-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> On Thu, Jun 18, 2015 at 12:27:48PM -0700, Kees Cook wrote:
>>
>> This should probably also mention the CAP_SYS_ADMIN requirement.
>> Otherwise, it looks good!
>
> Good point, attached is an updated patch.

Thanks for the patch. I applied, and updated the kernel version to be 4.3.

Cheers,

Michael

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index c2c92cd..47c96b1 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -592,6 +592,18 @@ The seccomp event message data (from the
 .BR SECCOMP_RET_DATA
 portion of the seccomp filter rule) can be retrieved with
 .BR PTRACE_GETEVENTMSG .
+.TP
+.BR PTRACE_O_SUSPEND_SECCOMP " (since Linux 4.2)"
+Suspend the tracee's seccomp protections. This applies regardless of mode, and
+can be used when the tracee has not yet installed seccomp filters. That is, a
+valid usecase is to suspend a tracee's seccomp protections before they are
+installed by the tracee, let the tracee install the filters, and then clear
+this flag when the filters should be resumed. Setting this option requires that
+the tracer have
+.BR CAP_SYS_ADMIN ,
+not have any seccomp protections installed, and not have
+.BR PTRACE_O_SUSPEND_SECCOMP
+set on itself.
 .RE
 .TP
 .BR PTRACE_GETEVENTMSG " (since Linux 2.5.46)"


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
