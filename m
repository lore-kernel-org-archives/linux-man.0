From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: hier.7: tfix
Date: Mon, 23 Oct 2017 06:44:33 +0200
Message-ID: <e787f7d1-94c9-8b05-7ef8-e081569c26e0@gmail.com>
References: <20171022100831.vxwhm47j5ylrvukb@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171022100831.vxwhm47j5ylrvukb-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Branden. Applied.

Cheers,

Michael




On 10/22/2017 12:08 PM, G. Branden Robinson wrote:
> Escape hyphen in man page cross reference.
> 
> diff --git a/man7/hier.7 b/man7/hier.7
> index 519debb1f..23a891162 100644
> --- a/man7/hier.7
> +++ b/man7/hier.7
> @@ -645,7 +645,7 @@ differently.
>   .BR find (1),
>   .BR ln (1),
>   .BR proc (5),
> -.BR file-hierarchy (7),
> +.BR file\-hierarchy (7),
>   .BR mount (8)
>   .PP
>   The Filesystem Hierarchy Standard
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
