From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ip.7: add IP_BIND_ADDRESS_NO_PORT description
Date: Wed, 3 Feb 2016 15:49:22 +0100
Message-ID: <56B21372.8030001@gmail.com>
References: <1454369722.7627.191.camel@edumazet-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454369722.7627.191.camel-XN9IlZ5yJG9HTL0Zs8A6p/gx64E7kk8eUsxypvmhUTTZJqsBc5GL+g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Dumazet <eric.dumazet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Eric,

On 02/02/2016 12:35 AM, Eric Dumazet wrote:
> From: Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> 
> Documentation for IP_BIND_ADDRESS_NO_PORT socket option
> added in linux-4.2
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=90c337da1524863838658078ec34241f45d8394d

Thanks for the patch. I've applied, and tweaked a little.
It would be good to add a couple of sentences about
why this option is useful and what use case it allows.
Could you come up with something?

Thanks,

Michael

PS How about a patch for SO_MAX_PACING_RATE for the socket(7) page :-) ?

> Signed-off-by: Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  man7/ip.7 |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man7/ip.7 b/man7/ip.7
> index 1c51a50..f8d4e63 100644
> --- a/man7/ip.7
> +++ b/man7/ip.7
> @@ -338,6 +338,11 @@ application wants to receive data from.
>  This option can be used multiple times to allow
>  receiving data from more than one source.
>  .TP
> +.BR IP_BIND_ADDRESS_NO_PORT " (since Linux 4.2)
> +Instruct kernel to not reserve an ephemeral port at bind() time.
> +The port will be automatically chosen at connect() time, in a way
> +that allows sharing a source port as long as the 4-tuples are unique.
> +.TP
>  .BR IP_BLOCK_SOURCE " (since Linux 2.4.22 / 2.5.68)"
>  Stop receiving multicast data from a specific source in a given group.
>  This is valid only after the application has subscribed
> 
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
