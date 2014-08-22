From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: mtrace(1) man page
Date: Fri, 22 Aug 2014 18:07:28 -0500
Message-ID: <53F7CD30.2020002@gmail.com>
References: <53C8E24E.3040704@redhat.com> <1777637.kUP8sTC8nC@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1777637.kUP8sTC8nC@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/02/2014 11:57 AM, Mike Frysinger wrote:
> On Fri 18 Jul 2014 11:01:02 Jan Chaloupka wrote:
>> mtrace(1) command is not documented. All informations come from the script.
>>
>> Feel free to comment or ask any question.
> 
> it doesn't feel right for truly glibc-specific tools to have their man pages 
> hosted in the Linux man-pages project, especially when you consider 
> functionality/flags/etc... skew across glibc versions trying to be tracked in 
> an unrelated git repo.

Well, from a man-pages perspective, this doesn't seem terribly different from
the Section 3 APIs. Also, a number of glibc commands are already (in many cases,
since long ago) documented in man1 and man8.

Cheers,

Michael



> the GNU standard doesn't say that we can't include them in GNU projects, just 
> that they should be secondary to info pages.  so i think things like mtrace(1) 
> are better in glibc itself.
> 
> how else do people feel in this regard ?
> -mike
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
