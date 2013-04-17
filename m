From: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] socket.7: Add info about SO_PEEK_OFF option
Date: Wed, 17 Apr 2013 11:39:03 +0400
Message-ID: <516E5197.3030708@parallels.com>
References: <5123CE11.5060900@parallels.com> <CAKgNAkhoStgFnweOABOx3GQnq4Y9NaOambo2UKHcA_7DZiA7SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhoStgFnweOABOx3GQnq4Y9NaOambo2UKHcA_7DZiA7SA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/17/2013 10:45 AM, Michael Kerrisk (man-pages) wrote:
> On Tue, Feb 19, 2013 at 8:10 PM, Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org> wrote:
>> Since Linux 3.4 there appeared an ability to specify the
>> offset in bytes from which the data will be MSG_PEEK-ed.
>> Describe this socket option in the socket(7) page, where
>> all the other socket options are described.
>>
>> Signed-off-by: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
> 
> Pavel, I have applied this patch, but would like to clarify some
> details. See below.
> 
>> ---
>>
>> diff --git a/man7/socket.7 b/man7/socket.7
>> index 2f915da..6177ab1 100644
>> --- a/man7/socket.7
>> +++ b/man7/socket.7
>> @@ -618,6 +618,33 @@ for details on control messages.
>>  Gets the socket type as an integer (e.g.,
>>  .BR SOCK_STREAM ).
>>  This socket option is read-only.
>> +.TP
>> +.BR SO_PEEK_OFF " (since Linux 3.4)"
>> +This option controls the behavior of
>> +.BR recv(2)
>> +system call when used with
>> +.BR MSG_PEEK
>> +flag.
>> +
>> +When this value is negative (kernel sets -1 to all new sockets by default)
>> +the behavior of the
>> +.BR recv(2)
>> +is not affected at all.
>> +When it's set to zero or positive value, peeking the data would occur from
>> +the respective position in bytes. At the same time this offset will be
>> +incremented on the amount of bytes peeked from queue, so that the
>> +subsequent attempt to peek the data would result in next data in queue
> 
> So, if I set SO_PEEK_OFF to 5 and do a recv(fs, buf, 10, MSG_PEEK),
> then the offset will end up at 15, and the next MSG_PEEK would
> retrieve at offset 15, right?

Exactly.

>> +(similarly, receiving the data from queue without the
>> +.BR MSG_PEEK
>> +flag will result in respectively decreased offset value).
> 
> What does this mean? Is it correct that if I set SO_PEEK_OFF to 5 and
> do a recv(fs, buf, 10, 0), then the offset will end up at 0, and the
> next MSG_PEEK would retrieve at offset 0?

Yes.

> Or, rather, does a recv()
> without MSG_PEEK leave the offset unchanged, so that the next MSG_PEEK
> would retrieve at offset 5?

No. The logic behind that is -- if you set peek-offset and _receive_ some message
(removing it from the queue) the peek-offset is adjusted (decreased) so that the
next message you will _peek_ after that would be the same as if it was if you
didn't do the receive before. (sorry for my English, subjunctive is bad :( ).

IOW, here's the queue:

   msg0, msg1, msg2, msg3, msg4

You set peek off to 2 (^ below)

   msg0, msg1, msg2, msg3, msg4
                ^(2)

Now you peek a message, get msg2 and the queue is updated like this:

   msg0, msg1, msg2, msg3, msg4
                      ^(3)

i.e. -- peek-off is increased. Next message peek-ed will be msg3.
Now what happens if you receive a message:

  msg1, msg2, msg3, msg4
               ^(2)

msg0 is removed from the queue and the peek-off is decreased down to 
2 to still point to the msg3, since you haven't yet peek-ed one.

Hope this makes things more clear.

> Thanks,
> 
> Michael

Thanks,
Pavel
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
