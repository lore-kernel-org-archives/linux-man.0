From: "Michael Kerrisk (man-opages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] io_submit.2: Add IOCB_FLAG_IOPRIO
Date: Mon, 13 Aug 2018 18:39:57 +0200
Message-ID: <aa1c919e-e2c2-6bee-2db6-72c097436c0f@gmail.com>
References: <20180713205831.8134-1-adam.manzanares@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180713205831.8134-1-adam.manzanares@wdc.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: adam.manzanares@wdc.com
Cc: mtk.manpages@gmail.com, jmoyer@redhat.com, rgoldwyn@suse.com, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Hello Adam,

On 07/13/2018 10:58 PM, adam.manzanares@wdc.com wrote:
> From: Adam Manzanares <adam.manzanares@wdc.com>
> 
> The newly added IOCB_FLAG_IOPRIO aio_flag introduces
> new behaviors and return values.
> 
> The details of this new feature are posted here:
> https://lkml.org/lkml/2018/5/22/809

Thanks for this patch. I've applied it, but I have a question below 
about a detail that probably needs fixing.

> Signed-off-by: Adam Manzanares <adam.manzanares@wdc.com>
> ---
>   man2/io_submit.2 | 34 +++++++++++++++++++++++++++-------
>   1 file changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/man2/io_submit.2 b/man2/io_submit.2
> index d17e3122a..15e1ecdea 100644
> --- a/man2/io_submit.2
> +++ b/man2/io_submit.2
> @@ -164,14 +164,26 @@ This is the size of the buffer pointed to by
>   This is the file offset at which the I/O operation is to be performed.
>   .TP
>   .I aio_flags
> -This is the flag to be passed iocb structure.
> -The only valid value is
> -.BR IOCB_FLAG_RESFD ,
> -which indicates that the asynchronous I/O control must signal the file
> +This is the set of flags associated with the iocb structure.
> +The valid values are:
> +.RS
> +.TP
> +.BR IOCB_FLAG_RESFD
> +Asynchronous I/O control must signal the file
>   descriptor mentioned in
>   .I aio_resfd
>   upon completion.
>   .TP
> +.BR IOCB_FLAG_IOPRIO " (since Linux 4.18)"
> +.\" commit d9a08a9e616beeccdbd0e7262b7225ffdfa49e92
> +Interpret the
> +.I aio_reqprio
> +field as an
> +.B IOPRIO_VALUE
> +as defined by
> +.IR linux/ioprio.h.
> +.RE
> +.TP
>   .I aio_resfd
>   The file descriptor to signal in the event of asynchronous I/O completion.
>   .SH RETURN VALUE
> @@ -196,13 +208,21 @@ The AIO context specified by \fIctx_id\fP is invalid.
>   \fInr\fP is less than 0.
>   The \fIiocb\fP at
>   .I *iocbpp[0]
> -is not properly initialized,
> -or the operation specified is invalid for the file descriptor
> -in the \fIiocb\fP.
> +is not properly initialized, the operation specified is invalid for the file
> +descriptor in the \fIiocb\fP, or the value in the
> +.I aio_reqprio
> +field is invalid.
>   .TP
>   .B ENOSYS
>   .BR io_submit ()
>   is not implemented on this architecture.
> +.TP
> +.B EPERM
> +The aio_reqprio field is set with the class
> +.B IOPRIO_CLASS_RT
> +, but the submitting context does not have the

What does "submitting context" mean? Threads/tasks/processes have
capabilities. Can you rephrase in terms of processes/threads?

Thanks,

Michael

> +.B CAP_SYS_ADMIN
> +privilege.
>   .SH VERSIONS
>   .PP
>   The asynchronous I/O system calls first appeared in Linux 2.5.
> 
