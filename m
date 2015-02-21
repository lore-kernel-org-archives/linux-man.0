From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: restart_syscall.2: remove section number
Date: Sat, 21 Feb 2015 08:56:59 +0100
Message-ID: <54E83A4B.90505@gmail.com>
References: <CALhU9t=kM7Z7uO==e6vQ8eZJx1Vq9Gx+T1idTx8k80qMk0whrQ@mail.gmail.com> <20150217084326.GG20008@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150217084326.GG20008@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/17/2015 09:43 AM, Mike Frysinger wrote:
> On 27 Jan 2015 01:21, Akihiro Motoki wrote:
>> diff --git a/man2/restart_syscall.2 b/original/man2/restart_syscall.2
>> index a71b618..33081b7 100644
>> --- a/man2/restart_syscall.2
>> +++ b/man2/restart_syscall.2
>> @@ -115,7 +115,7 @@ In the case of system calls that take a timeout argument and
>>  automatically restart after a stop signal plus
>>  .BR SIGCONT ,
>>  but which do not have the
>> -.BR restart_syscall (2)
>> +.BR restart_syscall ()
>>  mechanism built in, then, after the process resumes execution,
>>  the time that the process spent in the stop state is
>>  .I not
>> @@ -127,7 +127,7 @@ and
>>  .BR pselect (2).
>>
>>  From user space, the operation of
>> -.BR restart_syscall (2)
>> +.BR restart_syscall ()
>>  is largely invisible:
>>  to the process that made the system call that is restarted,
>>  it appears as though that system call executed and
> 
> lgtm
> 
> (posting mostly because your e-mail was flagged as spam by gmail, so want to 
> make sure Michael sees it too)

Indeed, both my gmail and Thunderbird marked this as spam.
Thanks, Mike. Patch applied; thanks, Akihiro.

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
