From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clock_getres.2: Remove obsolete note on SMP systems
Date: Fri, 6 Sep 2013 06:11:03 +0200
Message-ID: <CAKgNAkiVoZXntTnmPXhEywLvAo08cZJNVWdvBSpCjEFN2tbWSw@mail.gmail.com>
References: <1378202731-29738-1-git-send-email-rodrigo@sdfg.com.ar>
 <1378202731-29738-2-git-send-email-rodrigo@sdfg.com.ar> <CAKgNAkj_SumnwDQ=rxSBubybzOSTS9u0RjDBSR-1=KrTK7=L_A@mail.gmail.com>
 <20130904133217.GC12620@sdfg.com.ar> <CAKgNAkjwVc3HLOL0n5upE5rOgqCN3TYGacrWMOzJ=uyv1mbHUg@mail.gmail.com>
 <00000140e9b4ede6-8b9dfd6f-7ca2-4d35-9454-389f6453031a-000000@email.amazonses.com>
 <20130904160815.GA15601@sdfg.com.ar> <00000140e9df10cd-71ca0078-fe11-4a8d-b588-93c2dfff098f-000000@email.amazonses.com>
 <20130905081018.GA25617@sdfg.com.ar> <CAKgNAki9BLKHmwJfJ6mhLtNjHf7cVEdE3bhpWXEKnhTCRt+FpA@mail.gmail.com>
 <20130905114136.GB27528@sdfg.com.ar>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130905114136.GB27528-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Cc: Christoph Lameter <cl-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

>> > If that is the case, should we change the note to say since which glibc (do we
>> > care about any other libc?) and kernel version these are safe on SMP and keep
>> > the note for people using olders version ?
>>
>> Exactly. See below.
>>
>> > Also, I didn't check if kernel support was backported to Linux 2.4...
>>
>> 2.4.x doesn't have the two CPUTIME clocks.
>
> Thanks, I didn't know that :-)
>
>>
>> How does the patch below look to you?
>
> Looks good, thanks! But I it failed to apply here as it is. And a minor question
> below

>> --- a/man2/clock_getres.2
>> +++ b/man2/clock_getres.2
>> @@ -221,12 +221,13 @@ are available.
>>  (See also
>>  .BR sysconf (3).)
>>  .SH NOTES
>> -.SS Note for SMP systems
>> -The
>> +.SS Historical note for SMP systems
>> +Before Linux added kernel support for
>>  .B CLOCK_PROCESS_CPUTIME_ID
>>  and
>> -.B CLOCK_THREAD_CPUTIME_ID
>> -clocks are realized on many platforms using timers from the CPUs
>> +.BR CLOCK_THREAD_CPUTIME_ID ,
>> +glibc implemented these clocks on many platforms using timer
>> +registers from the CPUs
>>  (TSC on i386, AR.ITC on Itanium).
>>  These registers may differ between CPUs and as a consequence
>>  these clocks may return
>> @@ -252,6 +253,15 @@ Glibc contains no provisions to deal with these
>> offsets (unlike the Linux
>>  Kernel).
>>  Typically these offsets are small and therefore the effects may be
>>  negligible in most cases.
>> +
>> +Since glibc 2.4,
>
> Is the new line here on purpose ?

It makes no difference to the output; I often break long source lines
at punctuation points.

Thanks for all your help getting to the final result, Rodrigo.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
