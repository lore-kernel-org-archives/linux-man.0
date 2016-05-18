From: Egmont Koblinger <egmont-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getlogin(3): mention loginuid
Date: Wed, 18 May 2016 22:48:09 +0200
Message-ID: <CAGWcZkKy8BU-aak=cPX4buGYSFB+WXadJ=aCM1o3HhYZSrCYNw@mail.gmail.com>
References: <CAGWcZkJFZZQgCAs4JnnGBj1jSh9aYdBiDUhRA+yj1Wx64H0xXA@mail.gmail.com>
 <8ee6ef8b-c976-0410-e525-42689b4bdf94@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8ee6ef8b-c976-0410-e525-42689b4bdf94-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

I'm sorry but I hardly know anything about it, basically just what the
mentioned link contains.

loginuid is something that may or may not be compiled into the kernel.
If available, it's initially -1, inherited on fork(), can be changed
from -1 to any arbitrary value by anyone, but if it's not -1 then it
can only be changed by root. Supposedly login programs (e.g. sshd,
graphical display manager, etc., the one that changes from a system
daemon to a user process) sets this to the user who logs in (probably
via a pam module), for auditing (whatever it means) purposes. The
value is supposed to be preserved across a su/sudo, that is, still
contain the user who originally logged in, rather than the user su/sudo
changes to.

I came across this at
https://bugzilla.gnome.org/show_bug.cgi?id=747046 which discusses the
removal of utmp logging from gnome-terminal. Quite a few utilities
rely on getlogin(3) which in turn looks at utmp and hence returns
incorrect result there. On the other hand, as discussed there, utmp is
unreliable and broken by design.

I was surprised to learn about the existence of loginuid, as well as
the fact that getlogin(3) actually first looks as loginuid, and only
if it's unavailable or unset (-1) then it goes on to utmp. For the
gnome-terminal utmp discussion I wish I had known this earlier.

Sorry, I know this is nowhere close to the style and precision that a
manpage requires.

cheers,
egmont

On Wed, May 18, 2016 at 10:36 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 04/23/2016 11:00 PM, Egmont Koblinger wrote:
>> Hi,
>>
>> I just got to know about /proc/self/loginuid, as well as getlogin(3)
>> referring to this file prior to utmp, by browsing this bug:
>> https://bugzilla.redhat.com/show_bug.cgi?id=1328947 (esp. comments
>> 13-17 are relevant).
>>
>> getlogin(3)'s manual page does not mention this at all. (And, for the
>> record, neither does proc(5), it has a FIXME comment about it).
>>
>> Could you please fill in this gap?
>
> Hello Egmont,
>
> Can you provide some information about this field? If not a patch
> to the man page, then at least some descriptive text?
>
> Thanks,
>
> Michael
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
