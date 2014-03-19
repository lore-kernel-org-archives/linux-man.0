From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Documenting the kernel-user-space ABI
Date: Wed, 19 Mar 2014 09:40:07 +0100
Message-ID: <532957E7.6000100@gmail.com>
References: <53285F85.3000807@gmail.com> <2468582.tM5WcKAPFo@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2468582.tM5WcKAPFo@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/19/2014 08:41 AM, Mike Frysinger wrote:
> On Tue 18 Mar 2014 16:00:21 Michael Kerrisk wrote:
>> You raised a question at the bottom of a bug report
>> (https://bugzilla.kernel.org/show_bug.cgi?id=70801#c4)
>> that I though might better go to the list, since I
>> think it merits some wider discussion:
>>
>>     i'd like to have a master location to document all
>>     this stuff at the kernel ABI level.  can we do that
>>     with the man-pages project somehow without violating
>>     the C library API tenet?
>>
>> First though, I'd like to check: what do you mean by "all this stuff"?
>> Am I correct to understand your question as something like:
>>
>>     Can man-pages become a place where the kernel-user-space ABI
>>     (as distinct from the glibc wrappers on top) is consistently
>>     and thoroughly documented?
> 
> the linux-man-pages project is great at meeting the needs of the majority of 
> developers -- those that live in userland with the C library between them and 
> the kernel.
> 
> but i think there is not an insignificant number of developers who live at the 
> direct kernel ABI level and do not want to see any C library details at all.  
> like the people who write C libraries, or low level debugging utilities (i.e. 
> anyone who touches ptrace -- gdb, qemu, strace just to name a few), or kernel 
> developers themselves, or arch porters (who live in all the aforementioned 
> sections), or test writers (like LTP), or researchers (academic, security, 
> etc...), or the stubbornly curious.  i've worn most of these hats at some 
> point in time and have been frustrated way more times than i can remember 
> after trying to follow the man page for a function only to find out the kernel 
> was slightly different.  doing `man foo` is a lot easier than going into the 
> kernel and tracking down the actual function's source (and then tracing it 
> through all the various subsystems to see how the diff args get treated).
> 
> basically i want this:
> 	http://thread.gmane.org/gmane.linux.kernel.cross-arch/21821

Yup, me too.

> and i want documentation :).
> 
> the linux-man-pages project is already filling the critical documentation gap 
> and rather than bootstrap another project, i was hoping we could find some way 
> to integrate.  i understand the perfectly reasonable desire to not have to 
> maintain multiple man pages that cover a lot of the same content (upwards of 
> 90%) when the functions are pretty one-to-one in flags/behavior (like the 
> openat() syscall and the openat() C library function).  so maybe we need a 
> technical solution to be able to split off the kernel-specific bits ?

I'd be perfectly happy for man-pages to become the home of this sort 
of information. We just need to work out the best way of doing it.

So, as you're probably aware, man pages do try to document differences between
the base kernel ABI and what is provided by (g)libc wrappers. However, this is
not done in a consistent and rigorous fashion:

* Some pages simply don't document the differences.

* Various other pages document the differences, but not in a consistent way.
  Perhaps there's a piece of text in the DESCRIPTION, or, more commonly, 
  in the NOTES, but there's no easy way for the reader to zoom in on that 
  information, because it's not written up in a standard way on each page.

Could this just be a simple as creating a new standard .SH section 
("KERNEL ABI") in the Section 2 pages, or a heading under NOTES called, 
say, "Kernel ABI differences" or some such? This would allow readers to 
find the required information in a consistent fashion.

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
