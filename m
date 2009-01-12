From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] ld.so.8: Document LD_AUDIT
Date: Mon, 12 Jan 2009 19:08:20 +1300
Message-ID: <cfd18e0f0901112208w6a323214w8344b31192a9cb01@mail.gmail.com>
References: <cfd18e0f0812191320o54724999l622b1b3ea59755da@mail.gmail.com>
	 <20090107182554.GA21648@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090107182554.GA21648-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Petr,

On Thu, Jan 8, 2009 at 7:25 AM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> Hi!
>
> On Fri, Dec 19, 2008 at 04:20:31PM -0500, Michael Kerrisk wrote:
>> On Sun, Dec 7, 2008 at 1:28 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
>> > +.TP
>> > +.B LD_AUDIT
>> > +(glibc since 2.4)
>> > +A colon-separated list of additional,
>>
>> Why the word "additional" here?
>
> Copy'n'paste oversight, sorry.

No problem.\

>> > user-specified, ELF shared libraries
>>
>> The word "libraries" is interesting.  The glibc sources imply that
>> multiple auditing libraries is supported, but a brief play with this
>> led to crashes for me.  (That could easily be because I'm doing things
>> wrong.)  Did you try this, or see an example anywhere?
>
> I have not tested this, just assumed from the code.

I did some testing on Solaris, which did what I would have expected.
But GNU's API fails for th same situation.  I filed
http://sources.redhat.com/bugzilla/show_bug.cgi?id=9733

> Maybe 'shared
> objects' would be more appropriate, too?

Changed.

As you will have seen already,  I wrote an rtld-audit(7) page
describing the API, so I've trimmed this patch somewhat (basically I
removed the list of functions in the API, replacing it with a pointer
to the new page).

[...]

> Acked-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

Thanks.

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
