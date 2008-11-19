From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: CLONE_IO documentation
Date: Wed, 19 Nov 2008 17:30:24 -0500
Message-ID: <cfd18e0f0811191430u761e58f3i98b169f6e8d09bc9@mail.gmail.com>
References: <cfd18e0f0804140540i1c6f035o259a7c4635194f54@mail.gmail.com>
	 <20080414171330.GP12774@kernel.dk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080414171330.GP12774-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jens,

Following up after a long time on this:

On Mon, Apr 14, 2008 at 12:13 PM, Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
> On Mon, Apr 14 2008, Michael Kerrisk wrote:
>> Hi Jens,
>>
>> Could you supply some text describing CLONE_IO suitable for inclusion
>> in the clone.2 man page?
>> ( http://www.kernel.org/doc/man-pages/online/pages/man2/clone.2.html
>> ).  In that text it would be helpful to explain what an "I/O context"
>> is.
>
> Sure, I'll see if I can come up with something. Or perhaps you can help
> me a bit, being the writer ;-)
>
> If the CLONE_IO flag is set, the process will share the same io context.
> The I/O context is the I/O scope of the disk scheduler. So if you think
> of the I/O context as what the I/O scheduler uses to map to a process,
> when CLONE_IO is set multiple processes will map to the same I/O context
> and will be treated as one by the I/O scheduler. What this means is that
> they get to share disk time. For the anticipatory and CFQ scheduler, if
> process A and process B share I/O context, they will be allowed to
> interleave their disk access. So if you have several threads doing I/O
> on behalf of the same process (aio_read(), for instance), they should
> set CLONE_IO to get better I/O performance with CFQ and AS.
>
> A man page should not mention the specific schedulers, just mention that
> it'll improve the information available to the kernel and the
> performance of the app for the scenario described. In practice, it'll
> only really apply to CFQ and AS. For deadline and noop, they'll be
> essentially zero difference as they have no concept of I/O contexts.

I took your text as a base but did some reworking, so *please check
the following carefully*,  and let me know if there are things to
change and/or add:

       CLONE_IO (since Linux 2.4.25)
              If  CLONE_IO  is set, then the new process shares an I/O
              context with the calling process.  If this flag  is  not
              set,  then (as with fork(2)) the new process has its own
              I/O context.

              The I/O context is the I/O scope of the  disk  scheduler
              (i.e, what the I/O scheduler uses to model scheduling of
              a process's I/O).  If processes share the same I/O  con-
              text,  they are treated as one by the I/O scheduler.  As
              a consequence, they get to share disk  time.   For  some
              I/O  schedulers,  if two processes share an I/O context,
              they will be allowed to interleave  their  disk  access.
              If  several  threads are doing I/O on behalf of the same
              process (aio_read(3), for instance), they should  employ
              CLONE_IO to get better I/O performance.

              If  the  kernel  is not configured with the CONFIG_BLOCK
              option, this flag is a no-op.

The patch against clone.2 is below.

Thanks,

Michael


--- a/man2/clone.2
+++ b/man2/clone.2
@@ -224,6 +223,36 @@ Calls to
 .BR umask (2)
 performed later by one of the processes do not affect the other process.
 .TP
+.BR CLONE_IO " (since Linux 2.4.25)"
+If
+.B CLONE_IO
+is set, then the new process shares an I/O context with
+the calling process.
+If this flag is not set, then (as with
+.BR fork (2))
+the new process has its own I/O context.
+
+.\" The following based on text from Jens Axboe
+The I/O context is the I/O scope of the disk scheduler (i.e,
+what the I/O scheduler uses to model scheduling of a process's I/O).
+If processes share the same I/O context,
+they are treated as one by the I/O scheduler.
+As a consequence, they get to share disk time.
+For some I/O schedulers,
+.\" the anticipatory and CFQ scheduler
+if two processes share an I/O context,
+they will be allowed to interleave their disk access.
+If several threads are doing I/O on behalf of the same process
+.RB ( aio_read (3),
+for instance), they should employ
+.BR CLONE_IO
+to get better I/O performance.
+.\" with CFQ and AS.
+
+If the kernel is not configured with the
+.B CONFIG_BLOCK
+option, this flag is a no-op.
+.TP
 .BR CLONE_NEWIPC " (since Linux 2.4.19)"
 If
 .B CLONE_NEWIPC
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
