From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] random.4: Improve discussion or urandom, blocking reads,
 and signals
Date: Fri, 11 Nov 2016 12:51:35 +0100
Message-ID: <02f85ba2-b1ec-57b0-2b47-a8086facc223@gmail.com>
References: <1461574090.32558.45.camel@redhat.com>
 <1470052099.2926.6.camel@redhat.com> <1476952646.2522.10.camel@redhat.com>
 <b07fb334-149d-cf65-74f3-1d1951e5981b@gmail.com>
 <1478768067.2642.23.camel@redhat.com>
 <e5c1f87c-aad0-b526-a346-74348a36c2a3@gmail.com>
 <1478778837.2642.26.camel@redhat.com>
 <05152136-6943-8ada-3d65-51ef4ce9c1b1@gmail.com>
 <4a8c573c-0c19-29d0-248e-74c088968806@gmail.com>
 <d5eca965-c8b9-51e5-6acb-172e47f85ba0@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d5eca965-c8b9-51e5-6acb-172e47f85ba0-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Laurent,

On 11/11/2016 11:28 AM, Laurent Georget wrote:
> Hello,
> 
> Le 10/11/2016 à 15:20, Michael Kerrisk (man-pages) a écrit :
>> Hello all,
>>
>> While reworking the text of the random(4) page, I found
>> what appear to be some inaccuracies. Could I get some feedback
>> on the patch below?
>>
>> Thanks,
>>
>> Michael
>>
>>     random.4: Improve discussion or urandom, blocking reads, and signals
>>     
>>     The text currently states that O_NONBLOCK has no effect for
>>     /dev/urandom, which is true.  It also says that reads from
>>     /dev/urandom are nonblocking.  This is at the least confusing.
>>     If one attempts large reads (say 10MB) from /dev/urandom
>>     there is an appreciable delay, and interruption by a signal
>>     handler will result in a short read. Amend the text to
>>     reflect this.
>>     
>>     Signed-off-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> diff --git a/man4/random.4 b/man4/random.4
>> index db5d0a2..736cbde 100644
>> --- a/man4/random.4
>> +++ b/man4/random.4
>> @@ -46,7 +46,6 @@ When read, the
>>  .I /dev/urandom
>>  device returns random bytes using a pseudorandom
>>  number generator seeded from the entropy pool.
>> -Reads from this device are nonblocking.
> 
> Being non blocking is not incompatible with being interruptible, though.
> Non blocking only means that the reading will never explicitly yield the
> CPU to wait for data, which is true. This is consistent with the use of
> "non blocking" elsewhere in the filesystem, as far as I understand it.

Yes, I see. Perhaps we can find a middle ground. I restored the removed 
line, but elaborated a little:

[[
Reads from this device do not block (i.e., the CPU is not yielded),
but may incur an appreciable delay when requesting
a large amount (megabytes) of data.
]]

> But I guess this can be confusing indeed, and that the precision is not
> useful in the man page.
> 
>>  When read during early boot time, this device may return
>>  data prior to the entropy pool being initialized.
>>  If this is of concern in your application, use
>> @@ -88,8 +87,11 @@ When calling
>>  .BR read (2)
>>  for the device
>>  .IR /dev/urandom ,
>> -signals will not be handled until after the requested random bytes
>> -have been generated.
>> +reads of up to 256 bytes will return as many bytes as are requested
>> +and will not be interrupted by a signal handler.
>> +Reads with a buffer over this limit may return less than the
>> +requested number of bytes or fail with the error
>> +.BR EINTR .
> 
> Yes, this is a useful precision.
> 
> This patch looks good to me.

Thanks.

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
