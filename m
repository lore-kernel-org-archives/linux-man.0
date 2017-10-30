From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Documenting sigaltstack SS_AUTODISRM
Date: Mon, 30 Oct 2017 11:50:36 +0100
Message-ID: <a8ae5fc2-055c-2939-a692-2339398bf653@gmail.com>
References: <CAKgNAkjw_OBxcL627V9xMrKUei69hwjVCr6sbHbG2riBe7VVYw@mail.gmail.com>
 <08467ae1-7187-3b2a-9a78-8af0c10bf816@list.ru>
 <3907bc2a-0645-8d93-6ee5-3f99874e7022@gmail.com>
 <32d95303-5839-9279-a1d3-a06f34e3484e@list.ru>
 <CAKgNAkgw6P5RAsA2RSFJX57b=DHM=eNZ+ZOoagcO3ydSHzBcQA@mail.gmail.com>
 <50de8f3b-8a1e-df50-b5dd-d1b74cb77fad@list.ru>
 <026308b5-4e92-4439-1eb2-82b67584d548@gmail.com>
 <3a4f9f3e-fc33-cf98-2322-27087664813f@list.ru>
 <a5565692-7f23-d236-3b01-142088310741@gmail.com> <59F6FD39.40502@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59F6FD39.40502-fPG8STNUNVg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Stas Sergeev <stsp-cmBhpYW9OiY@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Walter,

On 10/30/2017 11:21 AM, walter harms wrote:
> 
> 
> Am 30.10.2017 11:04, schrieb Michael Kerrisk (man-pages):
>> [So, things fell on the floor, a while back.]
>>
>> On 05/25/2017 11:17 AM, Stas Sergeev wrote:
>>> 24.05.2017 14:09, Michael Kerrisk (man-pages) пишет:
>>>> One could do this I suppose, but I read POSIX differently from
>>>> you and, more importantly, SS_ONSTACK breaks portability on
>>>> numerous other systems and is a no-op on Linux. So, the Linux man
>>>> page really should warn against its use in the strongest terms.
>>> So how about instead of the strongest terms towards
>>> the code's author, just explain that SS_ONSTACK is a
>>> bit-value on some/many OSes, and as such, 0 is a
>>> valid value to enable sas on them, plus all the other
>>> values would give EINVAL?
>>> No strongest terms will help w/o an explanation,
>>> because people will keep looking for something that
>>> suits as a missing SS_ENABLE.
>>
>> Fair enough. I've removed the statement in the manual page
>> about "confusion". By now the page says:
>>
>>     BUGS
>>        In the lead up to the release of the Linux 2.4  kernel,  a  change
>>        was   made   to   allow  sigaltstack()  to  accept  SS_ONSTACK  in
>>        ss.ss_flags, which results in behavior that is the  same  as  when
>>        ss_flags is 0 (i.e., the inclusion of SS_ONSTACK in ss.ss_flags is
>>        a no-op).  On other implementations,  and  according  to  POSIX.1,
> 
> i am confused, i understand that:
>            ss.ss_sp = malloc(SIGSTKSZ);
> 
>            ss.ss_size = SIGSTKSZ;
>            ss.ss_flags = 0;
>            if (sigaltstack(&ss, NULL) == -1)
> 
> is equivalent to:
>            ss.ss_sp = malloc(SIGSTKSZ);
> 
>            ss.ss_size = SIGSTKSZ;
>            ss.ss_flags = SS_ONSTACK ;
>            if (sigaltstack(&ss, NULL) == -1)
> 
> but also to
>            ss.ss_sp = malloc(SIGSTKSZ);
> 
>            ss.ss_size = SIGSTKSZ;
>            ss.ss_flags = SS_ONSTACK | SOMETHING_FLAG ;
>            if (sigaltstack(&ss, NULL) == -1)
> 
> so the use of SS_ONSTACK would result in ss.ss_flags = 0 no matter what.
> OR
> SS_ONSTACK is a no-op in Linux

I see what you mean. The point is back then that SS_ONSTACK was
the only flag that could (on Linux) be specified in ss.ss_flags,
so that "SS_ONSTACK | SOMETHING_FLAG" was a nonexistent case.
These days, it's possible to specify the new SS_AUTODISARM
flag in ss.ss_flags, which I think is why you are doubtful
about the new page text. How about this, as a tightened-up 
version:

    BUGS
       In Linux 2.2 and earlier, the only flag that could be specified in
       ss.sa_flags  was SS_DISABLE.  In the lead up to the release of the
       Linux 2.4 kernel, a change was  made  to  allow  sigaltstack()  to
       allow   ss.ss_flags==SS_ONSTACK   with   the   same   meaning   as
       ss.ss_flags==0 (i.e., the inclusion of SS_ONSTACK  in  ss.ss_flags
       is  a no-op).  On other implementations, and according to POSIX.1,
       SS_ONSTACK appears only as a reported flag in old_ss.ss_flags.  On
       Linux, there is no need ever to specify SS_ONSTACK in ss.ss_flags,
       and indeed doing so should be avoided on portability grounds: var‐
       ious  other  systems  give  an error if SS_ONSTACK is specified in
       ss.ss_flags.

?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
