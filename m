From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] random.4: Document write and document the ioctl interface
 of /dev/random
Date: Fri, 15 Mar 2013 09:56:06 +0100
Message-ID: <CAMqf4EF8dtjaiJ6rDhN62YAMo9jCUuyZqtkhaE11F3fkof_1DQ@mail.gmail.com>
References: <1361125279-9359-1-git-send-email-eliedebrauwer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361125279-9359-1-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2013/2/17 Elie De Brauwer wrote:
[...]
> +.IP
> +.IN +4n
> +.NF
> +struct rand_pool_info {
> +    int    entropy_count;
> +    int    buf_size;
> +    __u32  buf[0];
> +};
> +.FI
> +.IN
> +.IP
[...]

Hello,

groff complains about undefined IN, NF and FI macros here, they must
be lowercased.
IMHO it would be better to use the same formatting sequence found in
this page, ie. drop .IP and write

[...]  The following structure is used:

.nf
    struct rand_pool_info {
        int    entropy_count;
        int    buf_size;
        __u32  buf[0];
    };
.fi

Here [...]

Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
