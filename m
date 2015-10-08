From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/1] pthread_detach.3: remove invalid and confusing
 statement
Date: Thu, 08 Oct 2015 23:10:12 +0200
Message-ID: <5616DBB4.7060903@gmail.com>
References: <1443247457-3507-1-git-send-email-rahulbedarkar89@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443247457-3507-1-git-send-email-rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Rahul,

On 09/26/2015 07:04 AM, Rahul Bedarkar wrote:
> In notes section, statement
> 
> "(But note that the resources of all threads are freed when the
> process terminates.)"
> 
> is confusing and invalid. In Linux, we don't really need to wait
> until application termination for system resources to be freed unless
> there is bug in application logic.

While I'm not sure that that sentence is essential, it does serve
to remind the reader that all resources are freed on process
termination, regardless of whether pthread_detach() and pthread_join()
are used. 

It's not clear to me why you find it confusing or invalid.
Can you say more?

Thanks,

Michael


> Signed-off-by: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man3/pthread_detach.3 | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/man3/pthread_detach.3 b/man3/pthread_detach.3
> index 106914b..2c53409 100644
> --- a/man3/pthread_detach.3
> +++ b/man3/pthread_detach.3
> @@ -101,8 +101,6 @@ or
>  .BR pthread_detach ()
>  should be called for each thread that an application creates,
>  so that system resources for the thread can be released.
> -(But note that the resources of all threads are freed when the
> -process terminates.)
>  .SH EXAMPLE
>  The following statement detaches the calling thread:
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
