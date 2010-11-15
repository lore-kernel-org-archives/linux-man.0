From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: About thread-safety information in library functions' man-pages
Date: Mon, 15 Nov 2010 15:15:18 +0800
Message-ID: <4CE0DE06.6020009@cn.fujitsu.com>
References: <4C7C9EA6.90609@cn.fujitsu.com> <AANLkTimcJ4kSuB-vZSY2_CYDs12S0ODup9-Y9yj-uQrJ@mail.gmail.com> <4C8DEC85.8030007@cn.fujitsu.com> <AANLkTikVuuZ1N6C5T+GwbgQEH7EAxXPvqrmATZgcM-gE@mail.gmail.com> <4CE0D541.8030807@cn.fujitsu.com> <AANLkTi=3MpbEeMksjqMtM81HjhCODVRR7Y9KDo=ivnSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=3MpbEeMksjqMtM81HjhCODVRR7Y9KDo=ivnSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: pasky-AlSwsSmVLrQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

> Thanks. That looks promising. Could you elaborate on the meanings of
> the headings, and also explain how you came up with the lists?
> 

Because we have classified lots of the functions into following 
classifications: Unsafe, Safe, Safe with Exceptions, MT-Safe, 
MT-Safe with Exceptions.

The classifications are Based on the thread-safety levels defined in  
Solaris operating system, the meanings are as follows:

- Unsafe: The function contains global or static data that is not 
protected. Accesses by multiple threads will produce unpredictable 
(and probably incorrect) results.

- Safe: The function can be called by multiple threads and will return 
correct results. The function is still allowed to have global effects 
that are seen by all threads, however. It is also allowed to serialize 
all accesses, by protecting the entire function with a lock.

- Safe with Exceptions: The function is safe, except under certain 
circumstances.

- MT-Safe: The function is fully prepared for multi-threaded access. 
All global and static data is protected with locks, and some degree 
of concurrency can be achieved within the function.

- MT-Safe with Exceptions: The function is MT-Safe, except under 
certain circumstances.

-- 
Best Regards,
Peng Haitao

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
