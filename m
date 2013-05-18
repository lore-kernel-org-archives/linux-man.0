From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] io_setup.2: Clarify the nr_events parameter.
Date: Sat, 18 May 2013 21:21:18 +0200
Message-ID: <5197D4AE.9060806@gmail.com>
References: <20130514161955.GA15213@rei.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130514161955.GA15213-J5syqNJeCN7twjQa/ONI9g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cc: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/14/13 18:19, Cyril Hrubis wrote:
> Currently the io_setup.2 man page describes what the kernel really does,
> i.e. that the resulting context may be able to hold more than the
> nr_events operations because the memory allocated in kernel is rounded
> to be multiple of page size.
> 
> It is be better not to expose this implementation detail and simply
> state that the resulting context is suitable for nr_events operations.
> 
> Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> Acked-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Tanks, Cyril. Applied.

Cheers,

Michael



> ---
>  man2/io_setup.2 |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/io_setup.2 b/man2/io_setup.2
> index 81b9a8b..ffa3972 100644
> --- a/man2/io_setup.2
> +++ b/man2/io_setup.2
> @@ -21,8 +21,8 @@ There is no glibc wrapper for this system call; see NOTES.
>  The
>  .BR io_setup ()
>  system call
> -creates an asynchronous I/O context capable of of concurrently processing
> -at least \fInr_events\fP.
> +creates an asynchronous I/O context suitable for concurrently processing
> +\fInr_events\fP operations.
>  The
>  .I ctx_idp
>  argument must not point to an AIO context that already exists, and must
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
