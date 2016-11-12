From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] random.4: Improve discussion or urandom, blocking reads,
 and signals
Date: Sat, 12 Nov 2016 11:54:02 +0100
Message-ID: <e1ca5a80-c49f-8aed-d631-4adb161d6ac1@gmail.com>
References: <1461574090.32558.45.camel@redhat.com>
 <1470052099.2926.6.camel@redhat.com> <1476952646.2522.10.camel@redhat.com>
 <b07fb334-149d-cf65-74f3-1d1951e5981b@gmail.com>
 <1478768067.2642.23.camel@redhat.com>
 <e5c1f87c-aad0-b526-a346-74348a36c2a3@gmail.com>
 <1478778837.2642.26.camel@redhat.com>
 <05152136-6943-8ada-3d65-51ef4ce9c1b1@gmail.com>
 <4a8c573c-0c19-29d0-248e-74c088968806@gmail.com>
 <20161111160514.yrlfteowdz4qar76@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161111160514.yrlfteowdz4qar76-AKGzg7BKzIDYtjvyW6yDsg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Ted,

On 11/11/2016 05:05 PM, Theodore Ts'o wrote:
> On Thu, Nov 10, 2016 at 03:20:59PM +0100, Michael Kerrisk (man-pages) wrote:
>>     random.4: Improve discussion or urandom, blocking reads, and signals
>>     
>>     The text currently states that O_NONBLOCK has no effect for
>>     /dev/urandom, which is true.  It also says that reads from
>>     /dev/urandom are nonblocking.  This is at the least confusing.
>>     If one attempts large reads (say 10MB) from /dev/urandom
>>     there is an appreciable delay, and interruption by a signal
>>     handler will result in a short read. Amend the text to
>>     reflect this.
> 
> Nonblocking has a very clear and definied meaning in kernel
> programming.  So it's technically a true statement.  As far as whether
> it is confusing, I wonder if there are any other statements we discuss
> what "non-blocking" means where we might want change things.
> 
> as far as deleting this line:
> 
>> --- a/man4/random.4
>> +++ b/man4/random.4
>> @@ -46,7 +46,6 @@ When read, the
>>  .I /dev/urandom
>>  device returns random bytes using a pseudorandom
>>  number generator seeded from the entropy pool.
>> -Reads from this device are nonblocking.
>>  When read during early boot time, this device may return
>>  data prior to the entropy pool being initialized.
>>  If this is of concern in your application, use
> 
> Meh.  I don't really care one way or another.  We have a *huge* amount
> of detail about the internal implementation of /dev/urandom, so a
> novice programmer who doesn't understand the formal meaning of what it
> means for an OS system call to block is likely going to be confused by
> other things anyway.
> 
> There's sort of a larger philosophical question of how much detail to
> include, and how much tutorial instruction to include.  For example, we could say:
> 
>     The O_NONBLOCK flag has no effect when opening /dev/urandom or if
>     set by fcntl(2), since all reads and writes are non-blocking ---
>     that is, the process will not lose control of the CPU and some
>     other process will not be scheduled to run during the read or
>     write system call.
> 
>     *However*, if the user program requests a large number of bytes
>     (which is an abuse of the interface, and if a user program does
>     this the use program is bad and should feel bad, and we reserve
>     the right to artifically cap the number of bytes returned by a
>     read to /dev/urandom in the future), the kernel may spend a long
>     time doing precisely what the user program requested, and so the
>     system call may not return for a long time.
> 
> ... but some might argue that's probably too much information.  :-)

Well, as noted in another reply, I did restore that line, but
elaborated a little:

[[
Reads from this device do not block (i.e., the CPU is not yielded),
but can incur an appreciable delay when requesting large amounts 
of data.
]]

> OTOH, given how much other exhaustive detail is in the man page today,
> perhaps it's OK.  I dunno.  Sorry, it's hard for me to get too excited
> one way or another, especially since I continuously get questions and
> see debates where it's obvious people aren't reading the man page as
> it exists today, so I sometimes get a little cynical about too much
> bike-sheddding on man pages.  :-/

Possible confirmation bias? Perhaps the people that *do* read the
man page don't bother with debates?

> 
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
>>
> 
> Yes, that's a good change to make.

Thanks for checking it.

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
