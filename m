From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] random.4: Document write and document the ioctl interface
 of /dev/random
Date: Fri, 15 Mar 2013 14:10:02 +0100
Message-ID: <CAKgNAkj2mYo64SnaEdPJUdk9xa-FGsGBXWq9nmiEMH3W9zqRFw@mail.gmail.com>
References: <1361125279-9359-1-git-send-email-eliedebrauwer@gmail.com> <CAMqf4EF8dtjaiJ6rDhN62YAMo9jCUuyZqtkhaE11F3fkof_1DQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EF8dtjaiJ6rDhN62YAMo9jCUuyZqtkhaE11F3fkof_1DQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Mar 15, 2013 at 9:56 AM, D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 2013/2/17 Elie De Brauwer wrote:
> [...]
>> +.IP
>> +.IN +4n
>> +.NF
>> +struct rand_pool_info {
>> +    int    entropy_count;
>> +    int    buf_size;
>> +    __u32  buf[0];
>> +};
>> +.FI
>> +.IN
>> +.IP
> [...]
>
> Hello,
>
> groff complains about undefined IN, NF and FI macros here, they must
> be lowercased.
> IMHO it would be better to use the same formatting sequence found in
> this page, ie. drop .IP and write
>
> [...]  The following structure is used:
>
> .nf
>     struct rand_pool_info {
>         int    entropy_count;
>         int    buf_size;
>         __u32  buf[0];
>     };
> .fi
>
> Here [...]

Thanks. Fixed as you suggest.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
