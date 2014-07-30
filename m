From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sigaltstack.2: tfix
Date: Wed, 30 Jul 2014 08:41:04 +0200
Message-ID: <53D89380.9000203@gmail.com>
References: <CAMqf4EFSuwzxeW==8eAe2+s-vaZ3PKkeZd_43UdX=cTk8gMwSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EFSuwzxeW==8eAe2+s-vaZ3PKkeZd_43UdX=cTk8gMwSw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/29/2014 07:53 PM, D. Barbier wrote:
> Fix typo introduced in 0c892e5.

Thanks, Denis. Applied.

Cheers,

Michael


> 
> diff --git a/man2/sigaltstack.2 b/man2/sigaltstack.2
> index 69b663a..fb58593 100644
> --- a/man2/sigaltstack.2
> +++ b/man2/sigaltstack.2
> @@ -148,7 +148,7 @@ a nonzero value other than
>  .B ENOMEM
>  The specified size of the new alternate signal stack
>  .I ss.ss_size
> -as less than
> +was less than
>  .BR MINSTKSZ .
>  .TP
>  .B EPERM
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
