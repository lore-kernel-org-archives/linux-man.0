From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: pid_namespaces.7: remove duplicated 'that'
Date: Fri, 16 Jan 2015 07:48:01 +0100
Message-ID: <54B8B421.5010401@gmail.com>
References: <CALhU9t=GoW1XsZ9TfO5RaCpe2ges_xYuo8oBogChAMUMwaJ53A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9t=GoW1XsZ9TfO5RaCpe2ges_xYuo8oBogChAMUMwaJ53A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Akihiro. Applied.

Cheers,

Michael


On 01/15/2015 06:23 PM, Akihiro Motoki wrote:
> diff --git a/man7/pid_namespaces.7 b/man7/pid_namespaces.7
> index e6aaa60..c465950 100644
> --- a/man7/pid_namespaces.7
> +++ b/man7/pid_namespaces.7
> @@ -222,7 +222,7 @@ can't be combined with some other
>  flags:
>  .IP * 3
>  .B CLONE_THREAD
> -requires being in the same PID namespace in order that that
> +requires being in the same PID namespace in order that
>  the threads in a process can send signals to each other.
>  Similarly, it must be possible to see all of the threads
>  of a processes in the
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
