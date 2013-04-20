From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] socket.7: Add info about SO_PEEK_OFF option
Date: Sat, 20 Apr 2013 08:47:34 +0200
Message-ID: <CAKgNAkiT7sCgB=o0c7BUcPw_dUxQVt4DrsQHKCiRcYrDmUUTvA@mail.gmail.com>
References: <5123CE11.5060900@parallels.com> <CAKgNAkhoStgFnweOABOx3GQnq4Y9NaOambo2UKHcA_7DZiA7SA@mail.gmail.com>
 <516E5197.3030708@parallels.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <516E5197.3030708-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Apr 17, 2013 at 9:39 AM, Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org> wrote:
> On 04/17/2013 10:45 AM, Michael Kerrisk (man-pages) wrote:
>> On Tue, Feb 19, 2013 at 8:10 PM, Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org> wrote:
>>> Since Linux 3.4 there appeared an ability to specify the
>>> offset in bytes from which the data will be MSG_PEEK-ed.
>>> Describe this socket option in the socket(7) page, where
>>> all the other socket options are described.
>>>
>>> Signed-off-by: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
>>
>> Pavel, I have applied this patch, but would like to clarify some
>> details. See below.
>>
>>> ---
>>>
>>> diff --git a/man7/socket.7 b/man7/socket.7
>>> index 2f915da..6177ab1 100644
>>> --- a/man7/socket.7
>>> +++ b/man7/socket.7
>>> @@ -618,6 +618,33 @@ for details on control messages.
>>>  Gets the socket type as an integer (e.g.,
>>>  .BR SOCK_STREAM ).
>>>  This socket option is read-only.
>>> +.TP
>>> +.BR SO_PEEK_OFF " (since Linux 3.4)"
>>> +This option controls the behavior of
>>> +.BR recv(2)
>>> +system call when used with
>>> +.BR MSG_PEEK
>>> +flag.
>>> +
>>> +When this value is negative (kernel sets -1 to all new sockets by default)
>>> +the behavior of the
>>> +.BR recv(2)
>>> +is not affected at all.
>>> +When it's set to zero or positive value, peeking the data would occur from
>>> +the respective position in bytes. At the same time this offset will be
>>> +incremented on the amount of bytes peeked from queue, so that the
>>> +subsequent attempt to peek the data would result in next data in queue
>>
>> So, if I set SO_PEEK_OFF to 5 and do a recv(fs, buf, 10, MSG_PEEK),
>> then the offset will end up at 15, and the next MSG_PEEK would
>> retrieve at offset 15, right?
>
> Exactly.
>
>>> +(similarly, receiving the data from queue without the
>>> +.BR MSG_PEEK
>>> +flag will result in respectively decreased offset value).
>>
>> What does this mean? Is it correct that if I set SO_PEEK_OFF to 5 and
>> do a recv(fs, buf, 10, 0), then the offset will end up at 0, and the
>> next MSG_PEEK would retrieve at offset 0?
>
> Yes.
>
>> Or, rather, does a recv()
>> without MSG_PEEK leave the offset unchanged, so that the next MSG_PEEK
>> would retrieve at offset 5?
>
> No. The logic behind that is -- if you set peek-offset and _receive_ some message
> (removing it from the queue) the peek-offset is adjusted (decreased) so that the
> next message you will _peek_ after that would be the same as if it was if you
> didn't do the receive before. (sorry for my English, subjunctive is bad :( ).
>
> IOW, here's the queue:
>
>    msg0, msg1, msg2, msg3, msg4
>
> You set peek off to 2 (^ below)
>
>    msg0, msg1, msg2, msg3, msg4
>                 ^(2)
>
> Now you peek a message, get msg2 and the queue is updated like this:
>
>    msg0, msg1, msg2, msg3, msg4
>                       ^(3)
>
> i.e. -- peek-off is increased. Next message peek-ed will be msg3.
> Now what happens if you receive a message:
>
>   msg1, msg2, msg3, msg4
>                ^(2)
>
> msg0 is removed from the queue and the peek-off is decreased down to
> 2 to still point to the msg3, since you haven't yet peek-ed one.
>
> Hope this makes things more clear.

Yep, that helps considerably. I've extensively reworked your text,
adding quite a bit more detail. Could you check the text below please?

Cheers,

Michael

  SO_PEEK_OFF (since Linux 3.4)
         This option, which is currently supported only for unix(7)
         sockets,  sets  the  value  of  the  "peek offset" for the
         recv(2) system call when used with MSG_PEEK flag.

         When this option is set to a negative value (it is set  to
         -1 for all new sockets), traditional behavior is provided:
         recv(2) with the MSG_PEEK flag will  peek  data  from  the
         front of the queue.

         When the option is set to a value greater than or equal to
         zero, then the next peek at data queued in the socket will
         occur  at  the  byte offset specified by the option value.
         At the same time, the "peek offset" will be incremented by
         the  number  of  bytes that were peeked from the queue, so
         that a subsequent peek will return the next  data  in  the
         queue.i

         If  data is removed from the front of the queue via a call
         to recv(2) (or similar) without  the  MSG_PEEK  flag,  the
         "peek  offset"  will  be  decreased by the number of bytes
         removed.  In  other  words,  receiving  data  without  the
         MSG_PEEK  flag will cause the "peek offset" to be adjusted
         to maintain the correct relative position  in  the  queued
         data,  so  that  a  subsequent peek will retrieve the data
         that would have been  retrieved  had  the  data  not  been
         removed.

         For  datagram  sockets, if the "peek offset" points to the
         middle of a packet, the data returned will be marked  with
         the MSG_TRUNC flag.

         The  following  example  serves  to  illustrate the use of
         SO_PEEK_OFF.  Suppose a stream socket  has  the  following
         queued input data:

             aabbccddeeff

         The  following  sequence  of  recv(2) calls would have the
         effect noted in the comments:

             int ov = 4;                  // Set peek offset to 4
             setsockopt(fd, SOL_SOCKET, SO_PEEK_OFF, &ov, sizeof(ov));

             recv(fd, buf, 2, MSG_PEEK);  // Peeks "cc"; offset set to 6
             recv(fd, buf, 2, MSG_PEEK);  // Peeks "dd"; offset set to 8
             recv(fd, buf, 2, 0);         // Reads "aa"; offset set to 6
             recv(fd, buf, 2, MSG_PEEK);  // Peeks "ee"; offset set to 8
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
