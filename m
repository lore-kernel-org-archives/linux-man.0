From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] send.2: Add EALREADY to ERRORS
Date: Sun, 19 Nov 2017 10:07:38 +0100
Message-ID: <0a6638aa-a46e-3c54-7301-ac09ff24ba0c@gmail.com>
References: <CAKQVHKg1yNB5Zpo-sJwckMWiM+TTmggF71wpARWzEzpc0StUnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKQVHKg1yNB5Zpo-sJwckMWiM+TTmggF71wpARWzEzpc0StUnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Gr=c3=a9gory_Vander_Schueren?= <gregory.vanderschueren-g9H5/arvmg7k1uMJSBkQmQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Grégory

On 10/24/2017 05:21 PM, Grégory Vander Schueren wrote:
> Hi,
> 
> Found by looking at kernel source:
> http://elixir.free-electrons.com/linux/v4.14-rc6/source/net/ipv4/tcp.c#L1134

Thanks. Patch applied.

Cheers,

Michael


> --- man2/send.2 2017-10-24 17:13:12.503137552 +0200
> +++ man2/send.2.fix     2017-10-17 17:14:32.260107294 +0200
> @@ -353,6 +353,9 @@
>  in
>  .BR ip (7).
>  .TP
> +.B EALREADY
> +Another Fast Open is in progress.
> +.TP
>  .B EBADF
>  .I sockfd
>  is not a valid open file descriptor.
> 
> Regards,
> Gregory
> 
> (Sorry for duplicate, forgot to send as plaintext)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
