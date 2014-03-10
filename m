From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man 2 stat
Date: Mon, 10 Mar 2014 12:23:10 +0100
Message-ID: <CAKgNAkitCsaT_sWw-jr1qN5g_dG1LPn=zCuL=TjatPNg7ckvug@mail.gmail.com>
References: <20140309202120.GA2447@zeus.siriusdev.com> <20140309202449.GB2447@zeus.siriusdev.com>
 <CAKgNAkjcvRBqXC-Zemwap0Kt5PJLBL4SXA0ZOGYPOYSgqmvqoA@mail.gmail.com>
 <20140310100110.GA7155@zeus.siriusdev.com> <CAKgNAkiNYcL2rcmRm=PTGC76PhevQaYgZMERg9tYkmszmsx8+w@mail.gmail.com>
 <20140310111526.GC7263@zeus.siriusdev.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140310111526.GC7263-/zl7Sl5F5BR9OMYREy7PttBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marius Gaubas <marius-PI1xv8u4z2FbJaZ9Qiajs9BPR1lH4CV8@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

>> Now, trying to document all of the architecture-specific details in
>> the man page is difficult, and would probably be confusing to the
>> reader. But, a warning to the reader is probably in order. I've added
>> the following text below the structure definition:
>>
>>        Note: the order of fields in the stat structure varies somewhat
>>        across  architectures.   In addition, the definition above does
>>        not show the padding bytes that may  be  present  between  some
>>        fields  on  various  architectures.   Consult the the glibc and
>>        kernel source code if you need to know the details.
>>
>> Seem okay to you?

> I do appreciate your point. And I agree it is very valid. Man page is
> not and should not become an overloaded document with all the platform
> specific caveats. But I also see it valuable to clearly explain where
> the document is not absolutely precise and what sources should be
> further consulted for the details.
>
> Your proposed change looks perfect to me.
>
> Thank you very much for you time!

Your welcome. Thanks for the report.

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
