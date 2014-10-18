From: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH]: unix.7: mentioning SOCK_STREAM socket for ioctl_type
 of ioctl function
Date: Sat, 18 Oct 2014 17:26:31 +0200
Message-ID: <544286A7.5010508@redhat.com>
References: <53CF9457.7070409@redhat.com> <54412934.9060602@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54412934.9060602-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 10/17/2014 04:35 PM, Michael Kerrisk (man-pages) wrote:
> Hello Jan,
>
> On 07/23/2014 12:54 PM, Jan Chaloupka wrote:
>>   From https://bugzilla.redhat.com/show_bug.cgi?id=1110401.
>>
>> unix.7 is not clear about socket type of ioctl_type argument of ioctl
>> function. The description of SIOCINQ is applicable only for SOCK_STREAM
>> socket. For SOCK_DGRAM, udp(7) man page gives correct description of
>> SIOCINQ.
> Again, the intent of this patch seems correct, but some
> details need fixing, I think.
>
>> ---
>>    man7/unix.7 | 11 +++++++++--
>>    1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/man7/unix.7 b/man7/unix.7
>> index b0ade5b..6bcc8ba 100644
>> --- a/man7/unix.7
>> +++ b/man7/unix.7
>> @@ -299,7 +299,9 @@ The correct syntax is:
>>    can be:
>>    .TP
>>    .B SIOCINQ
>> -Returns the amount of queued unread data in the receive buffer.
>> +For
>> +.B SOCK_STREAM
>> +socket the function returns the amount of queued unread data in the
>> receive buffer.
>>    The socket must not be in LISTEN state, otherwise an error
>>    .RB ( EINVAL )
>>    is returned.
>> @@ -319,6 +321,10 @@ defined in
>>    .\" That number is normally larger than the number of bytes of pending
>>    .\" output. Since this info is, from userland's point of view, imprecise,
>>    .\" and it may well change, probably best not to document this now.
>> +For
>> +.B SOCK_DGRAM
>> +socket, see
>> +.BR udp (7).
> It feels a bit odd to simply point at udp(7), since that describes
> another socket domain (Internet). Maybe say something like:
>
>      For SOCK_DRAM sockets, the returned value is the same as
>      for Internet domain datagram sockets; see udp(7).
>
> What do you think?

Yeah, you are right. The reason of referring to udp(7) is stated in the 
patch but not in the man page itself.
I agree with this change.

> Cheers,
>
> Michael
>
>>    .SH ERRORS
>>    .TP
>>    .B EADDRINUSE
>> @@ -450,4 +456,5 @@ see
>>    .BR cmsg (3),
>>    .BR capabilities (7),
>>    .BR credentials (7),
>> -.BR socket (7)
>> +.BR socket (7),
>> +.BR udp (7)
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
