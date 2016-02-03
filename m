From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] Consistency fix: Use "saddr" as the postfix for "struct
 sockaddr"-based type names.
Date: Wed, 3 Feb 2016 10:24:06 -0500
Message-ID: <56B21B96.9020505@redhat.com>
References: <56A917A8.9010007@redhat.com> <56B214E5.8070809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B214E5.8070809-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/03/2016 09:55 AM, Michael Kerrisk (man-pages) wrote:
> Hi Carlos,
> 
> On 01/27/2016 08:16 PM, Carlos O'Donell wrote:
>> The goal is to make it easier for a reader to follow along with the
>> documentation, prototypes, and examples that use "struct sockaddr".
>> We achieve this by using a consistent naming for "struct sockaddr"
>> -based types. Instead of using "sa", or "name" or "local" we use
>> "saddr", "name_saddr" and "local_saddr". We avoid variable names
>> like "sa" which are used for "sigaction" examples.
>>
>> Instead of the generic "addr" we use "saddr" in places where we accept
>> "struct sockaddr" as an argument, either the struct or a pointer to the
>> struct. Where the eventual goal is to cast the variable to a 
>> "struct sockaddr"-based type, such variable names are adjusted. So for
>> example if we have a "struct sockaddr_un" variable we call it 
>> "local_saddr" if it will eventually be cast to "struct sockaddr *".
>>
>> We might have standardized on just "addr" but that's ambiguous
>> and I'd like to use, where appropriate, slightly different variable
>> names for the various forms of "struct sockaddr" like "sockaddr_un",
>> "sockaddr_in", "sockaddr_storage" and others, so "addr" is a poor
>> choice when helping the reader follow along (not to mention the
>> confusion with virtual memory addresses and mmap).
>>
>> Please apply.
>>
>> Patch against master.
> 
> I'm not quite convinced about this patch. Some thoughts:
> 
> * Consistency is a good thing. Names such as 'a' or 'sa' are
>   not very helpful. And I'm happy to see that stuff go away.

Agreed.

> * I'm reluctant about the odd name 'saddr'. It's not consistent with
>   the BSDs, or much existing documentation. Also, I'm not convinced
>   that the possible confusion with VM addresses or mmap().) So, if
>   standardizing, I'd prefer to stick with 'addr' (which is also 
>   consistent with 'addrlen').
> 
> I applied the patch below. Perhaps that's enough change to make
> you happy. I'm not dead set against renaming 'addr' and so
> forth, but the argument for the benefit would need to be fairly
> convincing.

Your patch looks great. Any consistency is a step forward.

Regarding 'addr' vs 'saddr', your argument for consistency with
BSD is the strongest one I've heard so I'm happy to see us use 
'addr.'

Cheers,
Carlos.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
