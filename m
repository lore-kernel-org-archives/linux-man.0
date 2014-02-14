From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60807] not all the pages are encoded using utf-8
Date: Fri, 14 Feb 2014 10:22:04 +0000
Message-ID: <bug-60807-11311-MQEHsQCnOr@https.bugzilla.kernel.org/>
References: <bug-60807-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-60807-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60807

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #4 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Peter Schiffer from comment #3)
> $ ./print_encoding.sh man?/*
> 
>    Man Page               Encoding by file   Encoding by first line
> 
>  * man2/close.2           iso-8859-1         
>  * man2/getdomainname.2   iso-8859-1         
>  * man2/getrlimit.2       iso-8859-1         
>  * man2/madvise.2         iso-8859-1         
>  * man2/mount.2           utf-8              
>  * man2/sysinfo.2         iso-8859-1         
>  * man2/umask.2           iso-8859-1         
>  * man3/encrypt.3         iso-8859-1         
>  * man3/fclose.3          iso-8859-1         
>  * man3/fflush.3          iso-8859-1         
>  * man3/lockf.3           iso-8859-1         
>  * man3/rand.3            iso-8859-1         
>  * man3/strtok.3          iso-8859-1         
>  * man3/toupper.3         iso-8859-1         
>  * man3/updwtmp.3         iso-8859-1         
>  * man4/st.4              utf-8              
>  * man5/utmp.5            iso-8859-1         
>  * man7/armscii-8.7       iso-8859-1         ARMSCII-8
>  * man7/cp1251.7          unknown-8bit       CP1251
>  * man7/environ.7         iso-8859-1         
>  * man7/hier.7            iso-8859-1         
>  * man7/iso_8859-10.7     iso-8859-1         ISO-8859-10
>  * man7/iso_8859-11.7     iso-8859-1         ISO-8859-11
>  * man7/iso_8859-13.7     iso-8859-1         ISO-8859-7
>  * man7/iso_8859-14.7     iso-8859-1         ISO-8859-14
>  * man7/iso_8859-15.7     iso-8859-1         ISO-8859-15
>  * man7/iso_8859-16.7     iso-8859-1         ISO-8859-16
>  * man7/iso_8859-1.7      iso-8859-1         
>  * man7/iso_8859-2.7      iso-8859-1         ISO-8859-2
>  * man7/iso_8859-3.7      iso-8859-1         ISO-8859-3
>  * man7/iso_8859-4.7      iso-8859-1         ISO-8859-4
>  * man7/iso_8859-5.7      iso-8859-1         ISO-8859-5
>  * man7/iso_8859-6.7      iso-8859-1         ISO-8859-6
>  * man7/iso_8859-7.7      iso-8859-1         ISO-8859-7
>  * man7/iso_8859-8.7      iso-8859-1         ISO-8859-8
>  * man7/iso_8859-9.7      iso-8859-1         ISO-8859-9
>  * man7/koi8-r.7          unknown-8bit       KOI8-R
>  * man7/koi8-u.7          unknown-8bit       
>  * man7/suffixes.7        iso-8859-1         
> 
> $ ./convert_to_utf_8.sh tmp_encoded man?/*
> Converting man2/close.2            from iso-8859-1
> Converting man2/getdomainname.2    from iso-8859-1
> Converting man2/getrlimit.2        from iso-8859-1
> Converting man2/madvise.2          from iso-8859-1
> Converting man2/mount.2            from utf-8
> Converting man2/sysinfo.2          from iso-8859-1
> Converting man2/umask.2            from iso-8859-1
> Converting man3/encrypt.3          from iso-8859-1
> Converting man3/fclose.3           from iso-8859-1
> Converting man3/fflush.3           from iso-8859-1
> Converting man3/lockf.3            from iso-8859-1
> Converting man3/rand.3             from iso-8859-1
> Converting man3/strtok.3           from iso-8859-1
> Converting man3/toupper.3          from iso-8859-1
> Converting man3/updwtmp.3          from iso-8859-1
> Converting man4/st.4               from utf-8
> Converting man5/utmp.5             from iso-8859-1
> Converting man7/armscii-8.7        from armscii-8
> Converting man7/cp1251.7           from cp1251
> Converting man7/environ.7          from iso-8859-1
> Converting man7/hier.7             from iso-8859-1
> Converting man7/iso_8859-10.7      from iso_8859-10
> Converting man7/iso_8859-11.7      from iso-8859-1
> Converting man7/iso_8859-13.7      from iso-8859-1
> Converting man7/iso_8859-14.7      from iso_8859-14
> Converting man7/iso_8859-15.7      from iso_8859-15
> Converting man7/iso_8859-16.7      from iso_8859-16
> Converting man7/iso_8859-1.7       from iso_8859-1
> Converting man7/iso_8859-2.7       from iso_8859-2
> Converting man7/iso_8859-3.7       from iso_8859-3
> Converting man7/iso_8859-4.7       from iso_8859-4
> Converting man7/iso_8859-5.7       from iso_8859-5
> Converting man7/iso_8859-6.7       from iso_8859-6
> Converting man7/iso_8859-7.7       from iso_8859-7
> Converting man7/iso_8859-8.7       from iso_8859-8
> Converting man7/iso_8859-9.7       from iso_8859-9
> Converting man7/koi8-r.7           from koi8-r
> Converting man7/koi8-u.7           from koi8-u
> Converting man7/suffixes.7         from iso-8859-1
> 
> $ cd tmp_encoded/
> 
> $ ../print_encoding.sh man?/*
> 
>    Man Page               Encoding by file   Encoding by first line
> 
>  * man2/close.2           utf-8              UTF-8
>  * man2/getdomainname.2   utf-8              UTF-8
>  * man2/getrlimit.2       utf-8              UTF-8
>  * man2/madvise.2         utf-8              UTF-8
>  * man2/mount.2           utf-8              UTF-8
>  * man2/sysinfo.2         utf-8              UTF-8
>  * man2/umask.2           utf-8              UTF-8
>  * man3/encrypt.3         utf-8              UTF-8
>  * man3/fclose.3          utf-8              UTF-8
>  * man3/fflush.3          utf-8              UTF-8
>  * man3/lockf.3           utf-8              UTF-8
>  * man3/rand.3            utf-8              UTF-8
>  * man3/strtok.3          utf-8              UTF-8
>  * man3/toupper.3         utf-8              UTF-8
>  * man3/updwtmp.3         utf-8              UTF-8
>  * man4/st.4              utf-8              UTF-8
>  * man5/utmp.5            utf-8              UTF-8
>  * man7/armscii-8.7       utf-8              UTF-8
>  * man7/cp1251.7          utf-8              UTF-8
>  * man7/environ.7         utf-8              UTF-8
>  * man7/hier.7            utf-8              UTF-8
>  * man7/iso_8859-10.7     utf-8              UTF-8
>  * man7/iso_8859-11.7     utf-8              UTF-8
>  * man7/iso_8859-13.7     utf-8              UTF-8
>  * man7/iso_8859-14.7     utf-8              UTF-8
>  * man7/iso_8859-15.7     utf-8              UTF-8
>  * man7/iso_8859-16.7     utf-8              UTF-8
>  * man7/iso_8859-1.7      utf-8              UTF-8
>  * man7/iso_8859-2.7      utf-8              UTF-8
>  * man7/iso_8859-3.7      utf-8              UTF-8
>  * man7/iso_8859-4.7      utf-8              UTF-8
>  * man7/iso_8859-5.7      utf-8              UTF-8
>  * man7/iso_8859-6.7      utf-8              UTF-8
>  * man7/iso_8859-7.7      utf-8              UTF-8
>  * man7/iso_8859-8.7      utf-8              UTF-8
>  * man7/iso_8859-9.7      utf-8              UTF-8
>  * man7/koi8-r.7          utf-8              UTF-8
>  * man7/koi8-u.7          utf-8              UTF-8
>  * man7/suffixes.7        utf-8              UTF-8

Peter,

Sorry to be slow following up on this. Thanks for the scripts.

As some background, I'll just note that the current encoding markers in the
iso_8859* pages were added in response to this 2009 bug report:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=519209

It seems a reasonable idea to convert everything to UTF-8, but I have some
concerns/questions.

1. Is the encoding line: 
'\" t -*- coding: UTF-8 -*-
really needed, or does modern groff just work this out?

2. I'm concerned about backward compatibility issues. As in: what if someone
loads the man pages onto a system with old groff. Now, as far as I can work
out, groff added input unicode support in v1.20, 2009
(http://lists.gnu.org/archive/html/groff/2009-01/msg00011.html). So, perhaps
that's long enough ago that we don't need to worry too much about these issues.

Any thoughts?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
