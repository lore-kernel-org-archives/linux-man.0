From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: About thread-safety information in library functions' man-pages
Date: Wed, 17 Nov 2010 17:06:55 +0800
Message-ID: <4CE39B2F.3030906@cn.fujitsu.com>
References: <4C7C9EA6.90609@cn.fujitsu.com> <AANLkTimcJ4kSuB-vZSY2_CYDs12S0ODup9-Y9yj-uQrJ@mail.gmail.com> <4C8DEC85.8030007@cn.fujitsu.com> <AANLkTikVuuZ1N6C5T+GwbgQEH7EAxXPvqrmATZgcM-gE@mail.gmail.com> <4CE0D541.8030807@cn.fujitsu.com> <AANLkTi=3MpbEeMksjqMtM81HjhCODVRR7Y9KDo=ivnSQ@mail.gmail.com> <4CE0DE06.6020009@cn.fujitsu.com> <AANLkTikfXyDz47VyRYMrGoAm_Qyv96PbGVnfY82KiSh_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikfXyDz47VyRYMrGoAm_Qyv96PbGVnfY82KiSh_-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: pasky-AlSwsSmVLrQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

>>> the headings, and also explain how you came up with the lists?
>>>
>>
>> Because we have classified lots of the functions into following
>> classifications: Unsafe, Safe, Safe with Exceptions, MT-Safe,
>> MT-Safe with Exceptions.
> 
> Okay -- I'll rephrase the question... ;-). By what means  did you work
> out the classifications?
> 

The classifications are based on the thread-safety levels defined in  
Solaris operating system, please refer to Sun's attr(5) page:
http://docs.sun.com/app/docs/doc/816-0220/6m6nkoroc?l=en&a=view#MT-Level

Based on the classifications and POSIX standard, I classify functions 
by reading source code.

-- 
Best Regards,
Peng Haitao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
