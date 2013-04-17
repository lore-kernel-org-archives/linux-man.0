From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: clone(2) should be clone(3)
Date: Wed, 17 Apr 2013 08:45:56 +0200
Message-ID: <CAKgNAkhpNzcDWr5gOP12mV8Avr7U+_xbdWKYv+ZbuKcdVN0MaQ@mail.gmail.com>
References: <515EF542.8090200@redhat.com> <201304071503.07751.vapier@gentoo.org>
 <CAKgNAkjQ1PfvrVgJ_UXUerG9MzLAoUt9ixgS07L9LAroCW7_Jw@mail.gmail.com> <201304161137.49482.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304161137.49482.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Apr 16, 2013 at 5:37 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Tuesday 16 April 2013 01:42:56 Michael Kerrisk (man-pages) wrote:
>> On Sun, Apr 7, 2013 at 9:03 PM, Mike Frysinger wrote:
>> > also, the quoted syscall signature isn't the whole story.  there's
>> > actually more variants:
>> > #ifdef __ARCH_WANT_SYS_CLONE
>> > #ifdef CONFIG_CLONE_BACKWARDS
>> > SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
>> >          int __user *, parent_tidptr,
>> >          int, tls_val,
>> >          int __user *, child_tidptr)
>> > #elif defined(CONFIG_CLONE_BACKWARDS2)
>> > SYSCALL_DEFINE5(clone, unsigned long, newsp, unsigned long, clone_flags,
>> >          int __user *, parent_tidptr,
>> >          int __user *, child_tidptr,
>> >          int, tls_val)
>> > #else
>> > SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
>> >          int __user *, parent_tidptr,
>> >          int __user *, child_tidptr,
>> >          int, tls_val)
>> > ...
>>
>> I've worked in some of the above detail; see the Git copy of the page.
>>
>> > these arches don't define __ARCH_WANT_SYS_CLONE:
>> >         blackfin ia64 m68k sparc
>>
>> I'm not sure of the significance of the above; can you explain?
>
> the three clone variants i posted above are bracketed by the define
> __ARCH_WANT_SYS_CLONE.  so if the arch doesn't define that, it means it has its
> own implementation of clone() in its arch/$ARCH/ tree, so the exact prototype
> has to be tracked down from there.


Thanks Mike. I'll add a short subsection noting that these
architectures are different.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
