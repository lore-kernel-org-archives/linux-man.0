From: Florian Weimer <fw@deneb.enyo.de>
Subject: Re: linux-headers-5.2 and proper use of SIOCGSTAMP
Date: Sat, 20 Jul 2019 21:34:44 +0200
Message-ID: <87muh8a4a3.fsf@mid.deneb.enyo.de>
References: <20190720174844.4b989d34@sf> <87wogca86l.fsf@mid.deneb.enyo.de>
        <CAK8P3a3s3OeBj1MviaJV2UR0eUhF0GKPBi1iFf_3QKQyNPkuqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3s3OeBj1MviaJV2UR0eUhF0GKPBi1iFf_3QKQyNPkuqw@mail.gmail.com>
        (Arnd Bergmann's message of "Sat, 20 Jul 2019 20:50:23 +0200")
Sender: netdev-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sergei Trofimovich <slyfox@gentoo.org>, Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>, "David S. Miller" <davem@davemloft.net>, Michael Kerrisk <mtk.manpages@gmail.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

* Arnd Bergmann:

> On Sat, Jul 20, 2019 at 8:10 PM Florian Weimer <fw@deneb.enyo.de> wrote:
>>
>> * Sergei Trofimovich:
>>
>> > Should #include <linux/sockios.h> always be included by user app?
>> > Or should glibc tweak it's definition of '#include <sys/socket.h>'
>> > to make it available on both old and new version of linux headers?
>>
>> What is the reason for dropping SIOCGSTAMP from <asm/socket.h>?
>>
>> If we know that, it will be much easier to decide what to do about
>> <sys/socket.h>.
>
> As far as I can tell, nobody thought it would be a problem to move it
> from asm/sockios.h to linux/sockios.h, as the general rule is that one
> should use the linux/*.h version if both exist, and that the asm/*.h
> version only contains architecture specific definitions. The new
> definition is the same across all architectures, so it made sense to
> have it in the common file.

Most of the socket-related constants are not exposed in UAPI headers,
although userspace is expected to use them.  It seems to me that due
to the lack of other options among the UAPI headers, <asm/socket.h>
has been a dumping ground for various socket-related things in the
past, whether actually architecture-specific or not.

<linux/socket.h> does not include <asm/socket.h>, so that's why we
usually end up with including <asm/socket.h> (perhaps indirectly via
<sys/socket.h>), which used to include <asm/sockios.h> on most (all?)
architectures.  That in turn provided some of the SIOC* constants in
the past, so people didn't investigate other options.

I think we can change glibc to include <linux/sockios.h> in addition
to <asm/socket.h>.  <linux/sockios.h> looks reasonably clean to me,
much better than <asm/socket.h>.  I'm still working on the other
breakage, and I'm severely limited by the machine resources I have
access to.
