From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Documentation for CLONE_NEWPID
Date: Tue, 25 Nov 2008 10:46:17 -0500
Message-ID: <cfd18e0f0811250746i711205dej6b98f2fba6cecc42@mail.gmail.com>
References: <4923810B.7010201@gmail.com> <492AA241.6050004@openvz.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <492AA241.6050004-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Emelyanov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Pavel,

On Mon, Nov 24, 2008 at 7:46 AM, Pavel Emelyanov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org> wrote:
> Michael Kerrisk wrote:
>> Pavel, Kir,
>>
>> Drawing fairly heavily on your LWN.net article (http://lwn.net/Articles/259217/), plus the kernel
>> source and some experimentation, I created the patch below to document CLONE_NEWPID for the clone(2)
>> manual page.  Could you please review and let me know of any improvements or inaccuracies.
>
> Michael, sorry for the late response - I've been on vacation last week and didn't
> have chance to connect to check my mail.

No problem.

> Some comments are inline.

Thanks!

[...]

>> +This flag is intended for the implementation of control groups.
>
> Well, actually this has nothing to do with control groups. This
> flag is intended to be used to facilitate the creation of containers
> along with many other clone flags. Control groups is yet another
> way to create a container.

Yep, after an earlier mail from Eric, I already changed this to "containers".

>> +A PID namespace provides an isolated environment for PIDs:
>> +PIDs in a new namespace start at 1,
>> +somewhat like a standalone system, and calls to
>> +.BR fork (2),
>> +.BR vfork (2),
>> +or
>> +.BR clone (2)
>> +will produce processes whose PIDs within the namespace
>> +are only guaranteed to be unique within that namespace.
>
> Well, I'm not sure I understood correctly what was meant here, but after

I've simplified that sentence somewhat.  Now it just reads:

              A  PID  namespace  provides  an isolated environment for
              PIDs: PIDs in a new namespace start at 1, somewhat  like
              a  standalone system, and calls to fork(2), vfork(2), or
              clone(2) will  produce  processes  with  PIDs  that  are
              unique within the namespace.

> we have a namespace each task has two pids. And _all_ of them are unique
> in corresponding namespaces.

And I already make that point lower down in the text (see ***), but
now I extended the sentence there a little.

[...]

*** Here's where I make the point about each process having multiple PIDs"

>> +The existence of a namespace hierarchy means that each process
>> +may now have multiple PIDs:
>> +one for each namespace in which it is visible.

I added some words here:

"each of these PIDs is unique within the corresponding namespace".

>> +(A call to
>> +.BR getpid (2)
>> +always returns the PID associated with the namespace in which
>> +the process was created.)
>
> I don't thinks it's a good example - the getpid cannot be called
> for other process other than current :)

It wasn't meant as an example.  The point was, with a process
potentially being a member of multiple namespaces, the reader might
wonder: what does getpid(2) return?  This sentence was intended to
clarify that.  With that explanation, does this sentence now seem
okay?

[...]

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
