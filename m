From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Include <sys/types.h> in SYNOPSIS for pid_t
Date: Mon, 13 Nov 2017 18:06:52 +0100
Message-ID: <CAKgNAkhRSjX-NDc_Y4bJTuNhyw6rzy1FFEaPBx74n-iQ78ih=g@mail.gmail.com>
References: <20171112132921.78840-1-ahmad@a3f.at> <CAKgNAkivPv2499L7zOt7iPnG9n6aoRGq+DtAXHuM1sZrN9m0aw@mail.gmail.com>
 <6B5BB556-4D50-43CA-8565-930F2E50616E@a3f.at>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6B5BB556-4D50-43CA-8565-930F2E50616E-WDeAlZut61o@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ahmad Fatoum <ahmad-WDeAlZut61o@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Ahmad

On 13 November 2017 at 17:48, Ahmad Fatoum <ahmad-WDeAlZut61o@public.gmane.org> wrote:
> Hello Michael,
>
> whether <unistd.h> defines pid_t is dependent on feature macros
> (_GNU_SOURCE or _POSIX_C_SOURCE >= 200112L).
> If the user compiles with -std=c11 for example, neither of those are set.
> I think it would be better to have the man pages SYNOPSIS
> not assume the user code uses a particular version of POSIX
> and be as widely applicable as possible.

Good point! Thanks for spotting that. I reverted my change, and
applied your patch. Thanks!

Cheers,

Michael

>> On 13Nov 2017, at 17:39, Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> Hello Ahmad
>>
>> On 12 November 2017 at 14:29, Ahmad Fatoum <ahmad-WDeAlZut61o@public.gmane.org> wrote:
>>> vfork(2), getpid(2) and others which return pid_t already do this.
>>
>> Thanks for the patch. But the fix should go the other way: POSIX says
>> that <unistd.h> should also define 'pid_t', so that vfork() and
>> getpid() do *not* need <sys/types.h>. So, I've updates those two pages
>> accordingly.
>>
>> Thanks
>>
>> Michael
>>
>>
>>> Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Signed-off-by: Ahmad Fatoum <ahmad-WDeAlZut61o@public.gmane.org>
>>> ---
>>> man2/fork.2    | 2 ++
>>> man2/getsid.2  | 2 ++
>>> man2/setpgid.2 | 2 ++
>>> man2/setsid.2  | 2 ++
>>> 4 files changed, 8 insertions(+)
>>>
>>> diff --git a/man2/fork.2 b/man2/fork.2
>>> index 931e8f76f..235a88e50 100644
>>> --- a/man2/fork.2
>>> +++ b/man2/fork.2
>>> @@ -40,6 +40,8 @@
>>> .SH NAME
>>> fork \- create a child process
>>> .SH SYNOPSIS
>>> +.B #include <sys/types.h>
>>> +.br
>>> .B #include <unistd.h>
>>> .PP
>>> .B pid_t fork(void);
>>> diff --git a/man2/getsid.2 b/man2/getsid.2
>>> index 9f2bf9f8d..a912b651f 100644
>>> --- a/man2/getsid.2
>>> +++ b/man2/getsid.2
>>> @@ -28,6 +28,8 @@
>>> .SH NAME
>>> getsid \- get session ID
>>> .SH SYNOPSIS
>>> +.B #include <sys/types.h>
>>> +.br
>>> .B #include <unistd.h>
>>> .PP
>>> .BI "pid_t getsid(pid_t" " pid" );
>>> diff --git a/man2/setpgid.2 b/man2/setpgid.2
>>> index 03a83a845..be451e765 100644
>>> --- a/man2/setpgid.2
>>> +++ b/man2/setpgid.2
>>> @@ -49,6 +49,8 @@
>>> .SH NAME
>>> setpgid, getpgid, setpgrp, getpgrp \- set/get process group
>>> .SH SYNOPSIS
>>> +.B #include <sys/types.h>
>>> +.br
>>> .B #include <unistd.h>
>>> .PP
>>> .BI "int setpgid(pid_t " pid ", pid_t " pgid );
>>> diff --git a/man2/setsid.2 b/man2/setsid.2
>>> index 91150da77..d2f4cc3b2 100644
>>> --- a/man2/setsid.2
>>> +++ b/man2/setsid.2
>>> @@ -33,6 +33,8 @@
>>> setsid \- creates a session and sets the process group ID
>>> .SH SYNOPSIS
>>> .ad l
>>> +.B #include <sys/types.h>
>>> +.br
>>> .B #include <unistd.h>
>>> .PP
>>> .B pid_t setsid(void);
>>> --
>>> 2.14.3
>>>
>>
>>
>>
>> --
>> Michael Kerrisk
>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>> Linux/UNIX System Programming Training: http://man7.org/training/
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
