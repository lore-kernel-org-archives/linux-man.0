From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] exit.3: ATTRIBUTES: Note function that is not thread-safe
Date: Sat, 18 May 2013 20:30:28 +0200
Message-ID: <5197C8C4.3060205@gmail.com>
References: <1367572694-21931-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1367572694-21931-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Peng,

NOTE: I have not yet applied this patch. See comments below.

On 05/03/13 11:18, Peng Haitao wrote:
> The function exit() is not thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/exit.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/exit.3 b/man3/exit.3
> index 51163e4..5e607b1 100644
> --- a/man3/exit.3
> +++ b/man3/exit.3
> @@ -87,6 +87,11 @@ termination, respectively.
>  The
>  .BR exit ()
>  function does not return.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR exit ()
> +uses a global variable that is not protected, so it is not thread-safe.

Ouch! Really? so one cannot call exit(3) from a multithreaded program?
This seems a clear violation of the standard. 

Could you provide some pointers to more information on this point (e.g., URL
of mail thread archive discussions.)

Thanks,

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
