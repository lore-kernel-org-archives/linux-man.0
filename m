From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] seccomp.2: document changed interaction with ptrace
Date: Tue, 8 Nov 2016 14:16:10 +0100
Message-ID: <2a097967-5d7a-7a05-7389-0b14de825b74@gmail.com>
References: <1478378436-7368-1-git-send-email-jann@thejh.net>
 <CAGXu5jK8+vbnww=YovZKo-j=Quwv_rkx-KrjP9TH9FBBG-R9xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5jK8+vbnww=YovZKo-j=Quwv_rkx-KrjP9TH9FBBG-R9xg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/08/2016 01:18 AM, Kees Cook wrote:
> On Sat, Nov 5, 2016 at 2:40 PM, Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org> wrote:
>> Signed-off-by: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
> 
> Thanks Jann! I realize it's already applied, but FWIW:
> 
> Acked-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> :)

Thanks for checking this, Kees!

Cheers,

Michael


>> ---
>>  man2/seccomp.2 | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/man2/seccomp.2 b/man2/seccomp.2
>> index dc3d87d..8d36fdc 100644
>> --- a/man2/seccomp.2
>> +++ b/man2/seccomp.2
>> @@ -455,8 +455,13 @@ requested by changing the system call to a valid system call number.
>>  If the tracer asks to skip the system call, then the system call will
>>  appear to return the value that the tracer puts in the return value register.
>>
>> -The seccomp check will not be run again after the tracer is notified.
>> -(This means that seccomp-based sandboxes
>> +.\" This was changed in ce6526e8afa4.
>> +.\" A related hole, using PTRACE_SYSCALL instead of SECCOMP_RET_TRACE, was
>> +.\" changed in arch-specific commits, e.g. 93e35efb8de4 for X86 and
>> +.\" 0f3912fd934c for ARM.
>> +Before kernel 4.8, the seccomp check will not be run again after the tracer is
>> +notified.
>> +(This means that, on older kernels, seccomp-based sandboxes
>>  .B "must not"
>>  allow use of
>>  .BR ptrace (2)\(emeven
>> --
>> 2.1.4
>>
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
