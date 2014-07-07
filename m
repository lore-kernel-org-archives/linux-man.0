From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Very confusing use of PID in man set_tid_address
Date: Mon, 07 Jul 2014 06:57:19 +0200
Message-ID: <53BA28AF.8080109@gmail.com>
References: <20140706034426.GM179@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140706034426.GM179-C3MtFaGISjmo6RMmaWD+6Sb1p8zYI1N1@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 07/06/2014 05:44 AM, Rich Felker wrote:
> I'm pretty sure all uses of "PID" in the man page for set_tid_address
> should instead read "TID". While the issue is present in many man
> pages and should probably be fixed globally, this one is particularly
> confusing because "TID" is also used in the function, argument, and
> task attribute names to mean the exact same thing. The word "process"
> is also used misleadingly, "For each process...".
> 
> The most important fix is to clarify that the return value is the TID
> of the caller, not the PID. But I think it should just all be fixed.

Yes, seems reasonable. I applied the patch below.

Thanks for the report.

Cheers,

Michael


--- a/man2/set_tid_address.2
+++ b/man2/set_tid_address.2
@@ -32,14 +32,14 @@ set_tid_address \- set pointer to thread ID
 .BI "long set_tid_address(int *" tidptr );
 .fi
 .SH DESCRIPTION
-For each process, the kernel maintains two attributes (addresses) called
+For each thread, the kernel maintains two attributes (addresses) called
 .I set_child_tid
 and
 .IR clear_child_tid .
 These two attributes contain the value NULL by default.
 .TP
 .I set_child_tid
-If a process is started using
+If a thread is started using
 .BR clone (2)
 with the
 .B CLONE_CHILD_SETTID
@@ -51,11 +51,11 @@ argument of that system call.
 .IP
 When
 .I set_child_tid
-is set, the very first thing the new process does
-is writing its PID at this address.
+is set, the very first thing the new thread does
+is to write its thread ID at this address.
 .TP
 .I clear_child_tid
-If a process is started using
+If a thread is started using
 .BR clone (2)
 with the
 .B CLONE_CHILD_CLEARTID
@@ -69,25 +69,25 @@ The system call
 .BR set_tid_address ()
 sets the
 .I clear_child_tid
-value for the calling process to
+value for the calling thread to
 .IR tidptr .
 .LP
-When a process whose
+When a thread whose
 .I clear_child_tid
 is not NULL terminates, then,
-if the process is sharing memory with other processes or threads,
+if the thread is sharing memory with other threads,
 then 0 is written at the address specified in
 .I clear_child_tid
 and the kernel performs the following operation:
 
     futex(clear_child_tid, FUTEX_WAKE, 1, NULL, NULL, 0);
 
-The effect of this operation is to wake a single process that
+The effect of this operation is to wake a single thread that
 is performing a futex wait on the memory location.
 Errors from the futex wake operation are ignored.
 .SH RETURN VALUE
 .BR set_tid_address ()
-always returns the PID of the calling process.
+always returns the caller's thread ID.
 .SH ERRORS
 .BR set_tid_address ()
 always succeeds.

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
