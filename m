From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Revised add_key(2) man page for review
Date: Tue, 13 Dec 2016 12:23:23 +0100
Message-ID: <2ed8ebca-e971-f9f5-a791-28f2604344c4@gmail.com>
References: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1@gmail.com>
 <24646.1481626688@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <24646.1481626688-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello David

Thanks for the review!

On 12/13/2016 11:58 AM, David Howells wrote:
> Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>>        The destination keyring serial number may be that  of  a  valid
>>        keyring for which the caller has write permission, or it may be
>>        one of the following special keyring IDs:
> 
> No comma before "or".

Actually, I think its okay with the comma. But I decided anyway to 
reword this into two sentences.

>>        "user" This is a general purpose key type whose payload may  be
>> ...
>>       "keyring"
> 
> It probably makes sense to put keyring either first or last.

Done.

> 
>>        "keyring"
>>               Keyrings are special key types that may contain links to
>>               sequences  of other keys of any type.  If this interface
>>               is used to create a keyring, then a NULL payload  should
>>               be specified, and plen should be zero.
> 
> I think "then payload should be NULL and plen should be zero." sounds better.

Agreed. Fixed.

>>        "logon" (since Linux 3.3)
>>               This  key type is essentially the same as "user", but it
>>               does not provide reading.
> 
> "permit the key to be read" rather than "provide reading", I think.

Fixed.

>>        "big_key" (since Linux 3.13)
>>               This  key type is similar to "user", but may hold a pay‐
>>               load of up to 1 MiB.  If the key payload is large,  then
>>               it  may  be stored in swap space rather than kernel mem‐
>>               ory.
> 
> "stored encrypted in swap space".

Fixed.

>>            printf("Key ID is %lx\n", (long) key);
> 
> key_serial_t is an int.  It doesn't really need casting to long.

Well, this is a common way of dealing with opaque integer system data
types, so that one does not encode a representational dependency into
printf(). (Relies on the assumption that the underlying type is no
bigger than long. The alternative these days is a cast to (intmax_t) 
plus %jd.) [So, for the moment, I'll leave the text as is.]

Cheers,

Micael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
