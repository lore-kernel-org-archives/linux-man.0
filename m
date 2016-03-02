From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: patch getaddrinfo.3 with "protocol independent" information
Date: Wed, 2 Mar 2016 09:00:43 +0100
Message-ID: <CAKgNAkiC9Cykcb3-xwBJ3JKKVSj=ZpbK6yyvvJOz-3-z5F+dAg@mail.gmail.com>
References: <56CFC01F.60702@pan.org> <CAKgNAkj_QsPTqUdoKgmZpEuotSoQuzykZyoDyKxaL4r7eNeZ0A@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkj_QsPTqUdoKgmZpEuotSoQuzykZyoDyKxaL4r7eNeZ0A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bill Kerr <bilker-7Y6McbBI5zQ@public.gmane.org>
Cc: Jerry Cooperstein <coop-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Pill,

Ping + one or two clarifications below...

On 26 February 2016 at 20:51, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Bill,
>
> On 26 February 2016 at 04:01, Bill Kerr <bilker-7Y6McbBI5zQ@public.gmane.org> wrote:
>> Michael,
>>
>> I'm one of the instructors for the Linux Foundation.  Jerry Cooperstein
>> posted a note to the instructor's mailing list that he's going to update the
>> network programming chapters of LFD312.  A couple of us suggested that he
>> retire the exercises that use the obsolete library calls gethostbyname(3)
>> and friends, replacing with with code using getaddrinfo(3).
>>
>> I noted that a lot of example code out there, including (sigh) early
>> editions of the Richard Stevens book "UNIX  Network Programming, Vol. 1"
>
> But later editions of UNP also do not seem to do this in the code...

What I meant here was: it looks like the code from later editions of
UNPv1 also does not employ the technique you suggest below.

>> fail to accomplish what Stevens says is a goal of network programming:
>> "protocol independence."
>>
>> A "protocol independent" server exposes the server's socket at ALL of the
>> server's IP addresses:  IPv4 and IPv6, local and remote.
>>
>> The current getaddrinfo(3) man page gets PART of the way to instructing how
>> to do this.
>>
>> The missing part is that after setting the "hints" struct to ai_family =
>> AF_UNSPEC and ai_flags = AI_PASSIVE, the code needs to CHECK the "ai_family"
>> of each candidate address in the list returned by getaddrinfo(3) to
>> preferentially choose AF_INET6 over AF_INET.
>>
>> If the server (preferentially) binds to an IPv6 address, qualified as
>> "AF_UNSPEC" and "AI_PASSIVE" in the hints, then the resulting socket will be
>> visible at ANY and ALL of the server's IP addresses. If the server binds to
>> an IPv4 address candidate (because the address candidates in the list aren't
>> checked before trying to bind), then the socket is unavailable to clients
>> trying any of the server's IPv6 addresses.  This is arguably an inferior
>> result.
>
> Okay -- I see the point, I think; but see below.
>
>> I attach a patch file against the top of  the man-pages tree (version 4.05)
>> with modifications to two parts of man3/getaddrinfo.3:
>>
>>   -> the section describing AF_UNSPEC is expanded with a "programming note"
>> describing how to write a "protocol independent" server.
>>
>>   -> the "server" example code has about 6 lines of code added, PLUS an
>> expansion of the block comment before the loop that walks the list returned
>> by getaddrinfo(3).
>>
>> Thanks for considering this patch.  Please let me know what I've done
>> horribly wrong, and I'll try to fix it.  I think this is somewhat important,
>> as writing "protocol independent" servers is fairly important, and MOST of
>> the code examples out on the Web and elsewhere don't CHECK the address
>> candidates when walking the list returned by getaddrinfo(3).   That's all
>> that needs to be done to make network servers better.
>>
>>  == Bill Kerr
>>         bilker-7Y6McbBI5zQ@public.gmane.org
>>         503 781-7946
>
> Thanks for raising this. But I am a bit doubtful. I've not seen this
> advice anywhere else, and I've not at a quick (far from exhaustive)
> search found any code that does this. Can you point me at some real
> project/production code that does this?

I grepped a little more through various source code, but have still
yet to find some projects that follow the approach described above.
So, I'd be interested in pointers to such code.

> My main thought here is: isn't
> this what /etc/gai.conf
> (http://man7.org/linux/man-pages/man5/gai.conf.5.html) is about? That
> is, the choice of preferred protocol is something that should be
> configured at system level, rather than application level, and in
> cases where it matters, /etc/gai.conf should be defined so that IPv6
> addresses are returned first.

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
