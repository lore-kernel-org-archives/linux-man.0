From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: ffix timer_stats output
Date: Sun, 03 Aug 2014 12:39:25 +0200
Message-ID: <53DE115D.7090709@gmail.com>
References: <1407015543-32164-1-git-send-email-spaillard@debian.org> <20140802234755.GP32136@mraw.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140802234755.GP32136-xazfMhTT2R0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/03/2014 01:47 AM, Simon Paillard wrote:
> Hi,
> 
> Actually I think this part could be even removed instead of reformatted,
> because it's almost a copy of the later enumeration of the columns of
> /proc/timer_stats format some lines below.

Yes, I think that's the right thing. I think I accidentally left that
in when editing the original patch. I've removed.

Cheers,

Michael


> Best regards.
> 
> On Sat, Aug 02, 2014 at 11:39:03PM +0200, Simon Paillard wrote:
>> ---
>>  man5/proc.5 | 20 +++++++++++++-------
>>  1 file changed, 13 insertions(+), 7 deletions(-)
>>
>> diff --git a/man5/proc.5 b/man5/proc.5
>> index 942156b..d721a3b 100644
>> --- a/man5/proc.5
>> +++ b/man5/proc.5
>> @@ -4042,13 +4042,19 @@ sampled information.
>>  
>>  timer_stats collects information about the timer events which are fired in a
>>  Linux system over a sample period:
>> -
>> -- the pid of the task(process) which initialized the timer
>> -- the name of the process which initialized the timer
>> -- the function where the timer was initialized
>> -- the callback function which is associated to the timer
>> -- the number of events (callbacks)
>> -
>> +.RS
>> +.IP * 3
>> +the pid of the task(process) which initialized the timer
>> +.IP *
>> +the name of the process which initialized the timer
>> +.IP *
>> +the function where the timer was initialized
>> +.IP *
>> +the callback function which is associated to the timer
>> +.IP *
>> +the number of events (callbacks)
>> +.RE
>> +.IP
>>  The timer_stats functionality is inactive on bootup.
>>  A sampling period can be started using the following command:
>>  
>> -- 
>> 2.0.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-man" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
