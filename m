From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: fanotify API: FMODE_NONOTIFY, FMODE_EXEC, FMODE_NOCMTIME
Date: Sun, 13 Apr 2014 16:05:24 +0200
Message-ID: <534A99A4.7000003@gmx.de>
References: <5330A257.9080100@gmail.com> <1396742468-4752-1-git-send-email-xypron.glpk@gmx.de> <5341461A.3090405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5341461A.3090405-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06.04.2014 14:18, Michael Kerrisk (man-pages) wrote:
>> ==
>> >
>> >  >> I notice that the FDs returned by read()s from the FAN FD have the
>> >  >> FMODE_NONOTIFY flag (fcntl(F_GETFL)) flag set. If you know what that's
>> >  >> about, it would be good to say something about. But, if not, do not
>> >  >> worry--just place a FIXME in the page source of fanotify(7)
>> >
>> >Fixed in fanotify.7
>> >If the listener accesses the file through the file descriptor provided
>> >no additional events are created.
> Ahh -- thanks for filling in that piece. I see that you refer to
> fcntl(2) when discussing that flag. But fcntl(2) does not
> mention that flag. I would rather see an explanation of this flag
> in the fanotify pages.
>

I wrote a small test program and found:

The flag FMODE_NONOTIFY can be read by function fcntl from userspace.
int flag = fcntl(fd, F_GETFL)

In include/uapi/asm-generic/fcntl.h I found the following comment:

/*
  * FMODE_EXEC is 0x20
  * FMODE_NONOTIFY is 0x1000000
  * These cannot be used by userspace O_* until internal and external open
  * flags are split.
  * -Eric Paris
  */

The definition of FMODE_NONOTIFY is in include/linux/fs.h but this
include is only used to compile the Kernel and not supposed to be used 
by userspace.

I think it is quite annoying that fcntl can return a flag that is not
described in the manpage of fcntl and that is not defined in fcntl.h.

But FMODE_NONOTIFY is not the only flag:

I was able to pass
0x20 (FMODE_EXEC), and
0x800 (FMODE_NOCMTIME)
to fanotify_init and received them as flag in the file descriptors for 
the fanotify events.
I wonder why fanotify_init does not check import parameter event_f_flags 
and return an error if any inappropriate value is set.

Should I put this into the BUGS section?

Should the name of the flag FMODE_NONOTIFY be mentioned at all in the 
man pages?

Or should we write:

.I fd
This is an open file descriptor for the object being accessed or
.B FAN_NOFD
if a queue overflow occurred.
The file descriptor can be used to access the contents of the monitored 
file or
directory.
It has an internal flag set, that suppresses fanotify event generation.
Hence when the receiver of the fanotify event accesses the notified file or
directory using this file descriptor no additional events will be created.
The reading application is responsible for closing the file descriptor.

Best regards

Heinrich Schuchardt
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
