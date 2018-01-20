From: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Subject: Re: [man-pages PATCH 2/5] s390_runtime_instr.2: document the removal
 of the second argument
Date: Sat, 20 Jan 2018 12:41:26 +0100
Message-ID: <20180120114126.GC6287@osiris>
References: <20180114185627.GA23602@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180114185627.GA23602-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jan Glauber <jang-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Jan 14, 2018 at 07:56:27PM +0100, Eugene Syromyatnikov wrote:
> Kernel's commit b38feccd663b55ab07116208b68e1ffc7c3c7e78 removed the
> second argument from the system call.
> 
> * man2/s390_runtime_instr.2 (.SH SYNOPSIS): Add the prototype for the
> version syscall available in Linux 4.4 onward.
> (.SH DESCRIPTION): Change the description of the signum parameter to
> the past tense, note that it is ignored since Linux 4.4.
> (.SH VERSIONS): Note that syscall has changed its prototype along with
> the reason of change.
> (.SH NOTES): Note that it's impossible to judge whether the signal
> delivery functionality has been successfully enabled by the
> successfulness of the return code.
> ---
>  man2/s390_runtime_instr.2 | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/s390_runtime_instr.2 b/man2/s390_runtime_instr.2
> index f979692..178237f 100644
> --- a/man2/s390_runtime_instr.2
> +++ b/man2/s390_runtime_instr.2
>  .BI "int s390_runtime_instr(int " command ", int " signum ");
> +.PP
> +/* Since Linux 4.4 */
> +.BI "int s390_runtime_instr(int " command ");"
...
> -argument specifies the number of a real-time signal.
> -The real-time signal is sent to the thread if the run-time instrumentation
> +argument was available up to Linux 4.3 and allowed specifying the number
> +of a real-time signal.
> +The real-time signal was sent to the thread if the run-time instrumentation
>  buffer is full or if the run-time-instrumentation-halted interrupt
>  occurred.
> +The argument is ignored from Linux 4.4 onwards and no signal is sent.
>  .SH RETURN VALUE
>  On success,
>  .BR s390_runtime_instr ()
> @@ -79,6 +86,10 @@ Allocating memory for the run-time instrumentation control block failed.
>  The run-time instrumentation facility is not available.
>  .SH VERSIONS
>  This system call is available since Linux 3.7.
> +.PP
> +Starting with Linux 4.4, the system call has its second argument removed,
> +since "[t]he external interrupts for runtime instrumentation buffer-full
> +and runtime instrumentation halted are unused and have no current user."
>  .SH CONFORMING TO
>  This Linux-specific system call is available only on the s390 architecture.
>  The run-time instrumentation facility is available beginning with System z EC12.
> @@ -92,6 +103,11 @@ Kernel's header
>  contains the necessary declarations for using run-time instrumentation.
>  Unfortunately, it hasn't been included as a part of Linux's UAPI
>  as of Linux 4.15.
> +.PP
> +Beware that since the second argument ignored since Linux 4.4, and no error
> +is returned in case it is specified on these newer kernels, application
> +can't rely on the availability of the signal delivery functionality
> +(or at least check it by setting erroneous value in the second argument).

All what you write is correct, however I don't think this should be
documented. It was actually a bad decision to remove the second system call
argument and don't check it's validity anymore.

If you now document the above people will start using the system call with
only one parameter which isn't backwards compatible.

I'd rather add the second parameter again to the system call so that code
stays backwards compatible.

Thanks for reporting this inconsistency as well!

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
