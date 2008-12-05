From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] man3/getaddrinfo.3: Document results ordering and /etc/gai.conf
Date: Fri, 5 Dec 2008 12:23:16 -0500
Message-ID: <cfd18e0f0812050923n2739cbc9g43a7b43365c1420b@mail.gmail.com>
References: <20081204232200.GG10491@machine.or.cz>
	 <cfd18e0f0812050909o3556a118p25138870a3745ad8@mail.gmail.com>
	 <20081205171506.GT10491@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081205171506.GT10491-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Petr,

On Fri, Dec 5, 2008 at 12:15 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
>  Hi,
>
> On Fri, Dec 05, 2008 at 12:09:44PM -0500, Michael Kerrisk wrote:
>> Hi Petr,
>>
>> On Thu, Dec 4, 2008 at 6:22 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
>> > This patch documents the order of the getaddrinfo(3) results (RFC 3484), how
>> > should the application deal with that, mentions the extremely common cause of
>> > having multiple results per query (both IPv4 and IPv6 addresses available)
>> > and mentions /etc/gai.conf.
>>
>> Thanks for this!  I've applied this for 3.15, but with tweaks as noted below.
>
>  thanks! (Purely out of curiosity, how often do you push out your git
> tree? Only on releases?)

It varies.  (Maybe I don't push it out quite as often as I should.
I'm open to input on that point.)  It does get pushed out at least on
every release, and I try to do it mor often if there's a lot of stuff
since the last push.

>> > @@ -293,15 +295,26 @@ and returns a pointer to the start of the list in
>> >  The items in the linked list are linked by the
>> >  .I ai_next
>> >  field.
>> > +.PP
>>
>> This change is not relevant to the subject of the patch, and unneeded.  Dropped.
>  I simply think that with the addition, the whole paragraph is too big
> and hard to read. But this is of course matter of personal preference.

D'oh!  I agree.  Changed now.

>> >  There are several reasons why
>> >  the linked list may have more than one
>> >  .I addrinfo
>> > -structure, including: the network host is multi-homed; or the same service
>> > -is available from multiple socket protocols (one
>> > +structure, including: the network host is multi-homed, accessible
>> > +over multiple protocols (e.g. both
>> > +.BR AF_INET
>> > +and
>> > +.BR AF_INET6 );
>> > +or the same service is available from multiple socket types (one
>> >  .B SOCK_STREAM
>> >  address and another
>> >  .B SOCK_DGRAM
>> > -address, for example).
>> > +address, for example).  Normally, the application should try
>>
>> My preference (see man-pages(7) is to start new sentences on new line.
>>  This is because (later) diffs at least sometimes operate at the
>> sentence level.
>
>  Thanks, I did not actually read man-pages(7) yet, I will do that.

Thanks.

>> > +using the addresses in the order they are returned in.
>> > +The sorting function used within
>> > +.BR getaddrinfo ()
>> > +is defined in RFC\ 3484; the order can be tweaked for a particular
>> > +system by editing
>> > +.IR /etc/gai.conf .
>>
>> Here, it is good to mention the glibc version that first started
>> supporting gai.conf.  It looks like it was 2.5, and I've added that
>> information.
>
>  Yes, glibc-2.5 introduced this.

Thanks for the ACK.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
