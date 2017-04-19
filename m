From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Missing include in mbind(2) and set_mempolicy(2) manpages?
Date: Wed, 19 Apr 2017 15:28:16 +0200
Message-ID: <40f295c1-abb1-b7cf-4c9b-fd62b58117ab@gmail.com>
References: <1d46ea2d-0076-603d-d922-1f414c91cea2@suse.cz>
 <CAKgNAkhBRXm22fBS72T4CP6RutEubaqyDFUJe4gwje_irATzkQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhBRXm22fBS72T4CP6RutEubaqyDFUJe4gwje_irATzkQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>, Filipe Brandenburger <filbranden-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-numa <linux-numa-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Andi, Filipe: Ping!

Thanks,

Michael


On 01/23/2017 12:57 AM, Michael Kerrisk (man-pages) wrote:
> Andi, Filipe,
> 
> See the bug report below. I think the problem is rather that the
> header files should be fixed. Why are MPOL_F_STATIC_NODES and
> MPOL_F_RELATIVE_NODES not declared in numaif.h, whereas the other
> MPOL_* constants are?
> 
> Cheers,
> 
> Michael
> 
> 
> On 19 January 2017 at 01:05, Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org> wrote:
>> Hi,
>>
>> the two manpages state that you have to #include <numaif.h>
>> But apparently this is not enough when one wants to use the
>> MPOL_F_STATIC_NODES or MPOL_F_RELATIVE_NODES flag. With grep I found that
>> these are defined in linux/mempolicy.h.
>>
>> This is on openSUSE Tumbleweed, numaif.h comes from
>> libnuma-devel-2.0.10-5.7.x86_64 (I checked upstream 2.0.11 tarball, no
>> difference here).
>> linux/mempolicy.h is from linux-glibc-devel-4.8-1.1.noarch
>>
>> Thanks,
>> Vlastimil
> 
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
