From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: open.2: tfix
Date: Mon, 23 Oct 2017 06:34:40 +0200
Message-ID: <11ef7d2b-73c4-aa75-d3e4-6a211af47b05@gmail.com>
References: <20171022095158.77nf4r7hjhodt5zn@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171022095158.77nf4r7hjhodt5zn-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Branden. Applied.

Cheers,

Michael


On 10/22/2017 11:52 AM, G. Branden Robinson wrote:
> This one crept in during the first bit of the "will fail" -> "fails"
> migration.
> 
> diff --git a/man2/open.2 b/man2/open.2
> index 02a62a255..44bf3d1cb 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -1636,7 +1636,7 @@ a flag of the same name, but without alignment restrictions.
>   .B O_DIRECT
>   support was added under Linux in kernel version 2.4.10.
>   Older Linux kernels simply ignore this flag.
> -Some filesystems may not implement the flagC, in which case
> +Some filesystems may not implement the flag, in which case
>   .BR open ()
>   fails with the error
>   .B EINVAL
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
