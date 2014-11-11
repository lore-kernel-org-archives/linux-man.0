From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ioctl_list.2: complete overhaul needed
Date: Tue, 11 Nov 2014 09:18:53 +0100
Message-ID: <CAKgNAkiy_HZcWQLfR0amYQfOSW1gjY1ABF346RfEFCDp=B3Gxw@mail.gmail.com>
References: <545F8D2E.5030308@gmx.de> <5461B768.7040603@gmail.com> <20141111075242.GB28132@vapier.wh0rd.info>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141111075242.GB28132-eAEk4k+vi/E8xmjh+jFwDmGXanvQGlWp@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Tue, Nov 11, 2014 at 8:52 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On 11 Nov 2014 08:14, Michael Kerrisk (man-pages) wrote:
>> On 11/09/2014 04:50 PM, Heinrich Schuchardt wrote:
>> > The list contains hex values of different constants. I just wonder for
>> > which architecture (alpha, i386, mips, or sparc at that time). No
>> > information is supplied.
>> >
>> > Current values depend on the architecture, e.g.
>> >
>> > On amd64
>> > 0x82307201      VFAT_IOCTL_READDIR_BOTH
>> > 0x82307202      VFAT_IOCTL_READDIR_SHORT
>> > 0x80047210      FAT_IOCTL_GET_ATTRIBUTES
>> > 0x40047211      FAT_IOCTL_SET_ATTRIBUTES
>> > 0x80047213      FAT_IOCTL_GET_VOLUME_ID
>> >
>> > On mips
>> > 0x42187201      VFAT_IOCTL_READDIR_BOTH
>> > 0x42187202      VFAT_IOCTL_READDIR_SHORT
>> > 0x40047210      FAT_IOCTL_GET_ATTRIBUTES
>> > 0x80047211      FAT_IOCTL_SET_ATTRIBUTES
>> > 0x40047213      FAT_IOCTL_GET_VOLUME_ID
>> >
>> > Hence hex values should be removed.
>>
>> It sounds like you are right that the hex values should be
>> removed. But, how did you determine those different
>> hex values above? Grepping the sources, it's not
>> obvious that amd64 and mips should be different.
>
> ioctl's can integrate the type size right ?  so wouldn't be surprised if it
> changed across arches.

Yes. I'd actually noticed that detail,and should have said so. I
suppose what I really meant was: is that the only source of the
difference in the constants?

> fwiw, strace carries a script to try and do all this magic automatically:
> http://sourceforge.net/p/strace/code/ci/master/tree/linux/ioctlent.sh
> of course it misses out on ioctls that aren't exported in headers and are
> internal to specific drivers.  i.e. it's not perfect at all, but that's because
> ioctls are a goddamn mess :).

Thanks for that pointer.

> i agree though that the man page should drop hex values as they aren't useful.
> if you're using a "standard" ioctl, you should get it from the relevant header
> file.  if you're using a "non-standard" ioctl, then you get the pieces.

Agreed.

>> > I further suggest to remove all documentation of structure details.
>>
>> Could you elaborate this point a little. Some examples, and
>> why you think they should be removed. I'm not disagreeing, just
>> looking to clarify what you mean.
>
> i think for the common/standard ioctls, it's useful to have manpages that delve
> down into the details.  but for the fringe ones, it's a waste of time for the
> vast majority of people.
>
> maybe one way to determine whether it's worth documenting, see if strace has a
> decoder for it :).

Sounds like a reasonable idea to me.

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
