From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: shmget.2: typo fix
Date: Tue, 06 Jan 2015 08:07:52 +0100
Message-ID: <54AB89C8.5060401@gmail.com>
References: <CALhU9tm2fRebgJz=a6u3ow277aHNsqP-eF3jtV1FtLXtkRBtpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tm2fRebgJz=a6u3ow277aHNsqP-eF3jtV1FtLXtkRBtpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Akihiro Motoki,

Patch applied. Thank you!

Cheers,

Michael

On 01/04/2015 10:36 PM, Akihiro Motoki wrote:
> diff --git a/man2/shmget.2 b/man2/shmget.2
> index 01a44a8..213a451 100644
> --- a/man2/shmget.2
> +++ b/man2/shmget.2
> @@ -209,7 +209,7 @@ but a shared memory segment already exists for
>  A new segment was to be created and
>  .I size
>  is less than
> -.B SHMIN
> +.B SHMMIN
>  or greater than
>  .BR SHMMAX .
>  .TP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
