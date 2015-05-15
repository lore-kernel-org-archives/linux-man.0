From: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: ptrace.2: BUGS (missing WIFEXITED notification)
Date: Fri, 15 May 2015 12:12:42 +0200
Message-ID: <5555C69A.3070509@oracle.com>
References: <55520EAC.2010003@oracle.com> <5554A6B0.2090409@gmail.com> <5554A8A4.7060404@redhat.com> <20150514162807.GA13385@chrystal.uk.oracle.com> <5554CFDF.6070602@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5554CFDF.6070602-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Quentin Casasnovas <quentin.casasnovas-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/14/2015 06:39 PM, Denys Vlasenko wrote:
> On 05/14/2015 06:28 PM, Quentin Casasnovas wrote:
>> On Thu, May 14, 2015 at 03:52:36PM +0200, Denys Vlasenko wrote:
>>> On 05/14/2015 03:44 PM, Michael Kerrisk (man-pages) wrote:
>>>> Hi Denys,
>>>>
>>>> Do you have any thoughts on the below?
>>>
>>> Yes, the poster is right: this part needs fixing, the behavior is
>>> the same on any kind of process termination.
>>>
>>>
>>>> On 05/12/2015 04:31 PM, Vegard Nossum wrote:
>>>>> We hit another edge case in the ptrace() interface and after several
>>>>> hours of chasing it down, we found that it was already described in the
>>>>> "BUGS" section:
>>>>>
>>>>> "If a thread group leader is traced and exits by calling _exit(2), a
>>>
>>> I think a possible fix is just to replace "exits by calling _exit(2)" part
>>> of the above text with "terminates".
>>>
>>
>> Should we also add a little paragraph detailing that waitpid() would hang
>> indefinitely if one thread terminates while the others are in ptrace-stop?
>
> It implies this by saying "but the subsequent WIFEXITED notification
> will not be delivered until all other threads exit".
>
> If another thread is in ptrace-stop, it did not exit yet. Therefore,
> WIFEXITED notification to the thread group leader will not be delivered.
> Therefore, waitpid() on it would hang.

While I agree that the information in the current man page is strictly
speaking sufficient, I personally still think it would be an improvement
to mention it explicitly (i.e. my proposed change #2 in the original
e-mail). Just because I think it's a sort of non-obvious pitfall; out of
hand, you don't expect a call to waitpid() on a process that has exited
to hang. That's just my opinion, though.


Vegard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
