From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] resolv.conf.5: Timeout does not map to resolver API
 calls.
Date: Mon, 5 Dec 2016 17:31:40 +0100
Message-ID: <648a017f-a338-306d-0c35-6fc2e2deded2@redhat.com>
References: <42e0e498-3e74-867f-4651-e378bc0d7e34@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <42e0e498-3e74-867f-4651-e378bc0d7e34-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/05/2016 05:09 PM, Carlos O'Donell wrote:

> diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
> index 553f093..241565d 100644
> --- a/man5/resolv.conf.5
> +++ b/man5/resolv.conf.5
> @@ -161,7 +161,10 @@ The value for this option is silently capped to 15.
>  .\" Since glibc 2.2
>  Sets the amount of time the resolver will wait for a
>  response from a remote name server before retrying the
> -query via a different name server.
> +query via a different name server. This may
> +.BR not
> +be the total time taken by any resolver API call and there is no
> +guarantee that a single resolver API call maps to a single timeout.
>  Measured in seconds,
>  the default is
>  .BR RES_TIMEOUT

Looks reasonable to me.

Thanks,
Florian

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
