From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Possible vdso(7) man page
Date: Mon, 8 Apr 2013 11:26:06 +0200
Message-ID: <CAKgNAkirXkq2OEOD2ucw2jKpzxvk85+AmqPumQ7xWJTu3ua3qA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC += Andy Lutomirksi]

On Sun, Apr 7, 2013 at 8:43 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Sunday 07 April 2013 06:00:50 Michael Kerrisk (man-pages) wrote:
>> On Wed, Apr 3, 2013 at 1:17 AM, Mike Frysinger wrote:
[...]
>> Mike, any chance that I could interest you in writing a vdso(7) man
>> page? I've felt the lack of such a page for a while (it need not be
>> too long), but am not deep enough into the details to write it easily
>> (I am not sure if you are).
>
> i might take a stab at it.  it's annoying to constantly have to refer to the
> kernel source when looking something up.

That would be great, Mike. I added Andy to the CC since he might be
willing to review or help (his name is attached to the reference VDSO
parser in the kernels source, so I'm guessing he's familiar with at
least a few architectures w.r.t. VDSO.)

> in order to be useful, i think there will have to be arch-specific sections
> which document the funcs each port provides.

Sure, though I think just getting x86 and perhaps ARM for a start
would be great. Just to give you a picture, I'd be hoping for a short
overview of the VDSO and its purpose and brief lists of entry points
for each of the architectures you decided to cover.

Thanks,

Michael

--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
