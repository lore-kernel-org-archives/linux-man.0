From: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Subject: Re: [man-pages PATCH 5/5] man2: describe s390_guarded_storage
 s390-specific system call
Date: Sat, 20 Jan 2018 13:23:49 +0100
Message-ID: <20180120122349.GE6287@osiris>
References: <20180114185643.GA23919@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180114185643.GA23919-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jan Glauber <jang-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Jan 14, 2018 at 07:56:43PM +0100, Eugene Syromyatnikov wrote:
> ---
>  man2/s390_guarded_storage.2 | 150 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 man2/s390_guarded_storage.2
> 
> diff --git a/man2/s390_guarded_storage.2 b/man2/s390_guarded_storage.2
> +.B GS_ENABLE
> +Enable the guarded storage facility for the current task.
> +The initial content of the guarded storage control block will be all zeros.
> +After the enalement, the user space code can use the "Load Guarded Storage

enablement

> +.SH ERRORS
> +.TP
> +.B EFAULT
> +.I command
> +was
> +.BR GS_SET_BC_CB
> +and the copying of the guarded storage control block structure pointed by the
> +.I gs_cb
> +argument has failed.
> +.TP
> +.B EINVAL
> +The value of
> +.I command
> +is not recognised.

Maybe: "The value specified for command is not a valid command." ?

> +.B EOPNOTSUPP
> +The guarded storage is not supported by the hardware.

"The guarded storage facility is not available."

Thanks for providing the man page!

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
