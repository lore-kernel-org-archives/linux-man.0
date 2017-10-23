From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man-pages.7: add use case for real minus character
Date: Mon, 23 Oct 2017 06:45:42 +0200
Message-ID: <28a5c448-b84b-d1ee-8138-2b82e2e6cdce@gmail.com>
References: <20171022101127.lxygv747m6ignifk@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171022101127.lxygv747m6ignifk-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Good idea. Thanks, Branden. Applied.

Cheers,

Michael




On 10/22/2017 12:11 PM, G. Branden Robinson wrote:
> diff --git a/man7/man-pages.7 b/man7/man-pages.7
> index 674762723..0b4647a79 100644
> --- a/man7/man-pages.7
> +++ b/man7/man-pages.7
> @@ -868,6 +868,8 @@ Finally, note that "re-create" and "recreate" are two different verbs,
>   and the former is probably what you want.
>   .SS Real minus character
>   Where a real minus character is required (e.g., for numbers such as \-1,
> +for man page cross references such as
> +.BR utf\-8 (7),
>   or when writing options that have a leading dash, such as in
>   .IR "ls\ \-l"),
>   use the following form in the man page source:
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
