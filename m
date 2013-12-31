From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Quarantine "gets.3" into its own "do not use" manpage
Date: Tue, 31 Dec 2013 22:35:27 +1300
Message-ID: <52C28FDF.3060307@gmail.com>
References: <1384370434.15325.33.camel@surprise> <20131115185455.GA20757@aym.net2.nerim.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131115185455.GA20757-956IwFboN44acnK+F/IuxqxOck334EZe@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Andre,

Thanks for reviewing this patch.

On 11/16/13 07:54, Andre Majorel wrote:
> On 2013-11-13 14:20 -0500, David Malcolm wrote:
> 
>> Currently man3/gets.3 documents various safe I/O functions, along with
>> the toxic "gets" function.
>>
>> At the risk of being melodramatic, this strikes me as akin to storing
>> rat poison in a food cabinet, in the same style of packaging as the
>> food, but with a post-it note on it saying "see warnings below".
>>
>> I think such "never use this" functions should be quarantined into their
>> own manpages, rather than listing them alongside sane functions.
>>
>> The attached patch does this for "gets", moving the documentation of the
>> good functions from man3/gets.3 into man3/fgetc.3, updating the SO links
>> in the relevant functions to point at the latter.
>>
>> It then rewrites man3/gets.3 to spell out that "gets" is toxic and
>> should never be used (with a link to CWE-242 for good measure).
>>
>> Thoughts?
> 
> For what my opinion's worth, I like this patch. it makes it
> harder to miss the warnings.
> 
> Two objections :
> 
> 1. Seems C89, C99 and POSIX.1-2001 have been dropped from the
>    CONFORMING TO section. If that is deliberate, I would like to
>    know the rationale behind this change.

Good catch. It should not have been, and I've restored it.

> 2. Rather than
> 
>      gets() is supposed to return s on success, and NULL on
>      error or when end of file occurs while no characters have
>      been read. However, given the lack of buffer overrun
>      checking, there can be no guarantees that the function will
>      even return.
> 
>    how about
> 
>      gets() returns s on success and NULL on error or when end
>      of file occurs while no characters have been read. Unless
>      the buffer is overrun, in which case there is no guarantee
>      that the function will even return.
> 
>    The idea is to avoid "is supposed to", which feels out of
>    place in a reference document. Refreshingly sarcastic as it
>    may be. :->

Agreed. I made the first of your suggested changes, but left the 
second sentence unchanged.

> The "For more information, see CWE-242" bit is in the BUGS
> section, right ? Can't tell from the diff alone.

Yes, it's in BUGS.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
