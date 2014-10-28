From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: Correct description of null-termination in PR_[GS]ET_NAME
Date: Tue, 28 Oct 2014 14:26:46 +0100
Message-ID: <544F9996.7090906@gmail.com>
References: <mvmr3y1u1t8.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <mvmr3y1u1t8.fsf-8jEJWzg51KSXcDkGTvBoYw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Andreas,

On 10/21/2014 12:58 PM, Andreas Schwab wrote:
> The size of the process name has always been at most 16 byte _including_
> the null terminator.  This also means that the name returned by
> PR_GET_NAME is always null-terminated.

Thanks. I applied this. One comment below.


> Signed-off-by: Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
> ---
>  man2/prctl.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index 1199891..4351ff9 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -240,7 +240,7 @@ using the value in the location pointed to by
>  .IR "(char\ *) arg2" .
>  The name can be up to 16 bytes long,
>  .\" TASK_COMM_LEN in include/linux/sched.h
> -and should be null-terminated if it contains fewer bytes.
> +including the terminating null byte.

I added here:

  (If the length of the string, including the terminating null byte,
  exceeds 16 bytes, the string is silently truncated.)

Okay?

Cheers,

Michael


>  This is the same attribute that can be set via
>  .BR pthread_setname_np (3)
>  and retrieved using
> @@ -256,7 +256,7 @@ Return the name of the calling thread,
>  in the buffer pointed to by
>  .IR "(char\ *) arg2" .
>  The buffer should allow space for up to 16 bytes;
> -the returned string will be null-terminated if it is shorter than that.
> +the returned string will be null-terminated.
>  .TP
>  .BR PR_SET_NO_NEW_PRIVS " (since Linux 3.5)"
>  Set the calling process's
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
