From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Review request: revised bindresvport() man page
Date: Thu, 4 Dec 2008 06:42:17 -0500
Message-ID: <cfd18e0f0812040342n71b6372ct5beef5de45e3f63e@mail.gmail.com>
References: <cfd18e0f0812031917t3554bc17uc7ebf3e8221ab3e1@mail.gmail.com>
	 <20081204034623.GT10491@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081204034623.GT10491-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: "Wichmann, Mats D" <mats.d.wichmann-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Petr

Thanks for reviewing this!

[...]
>> .BR bindresvport ()
>> is used to bind a socket descriptor to a privileged anonymous IP port,
>> that is, a port number arbitrarily selected from the range 512 to 1023.
>
> the range of?

No -- this is okay English.

>> .\" Glibc actually starts searching with a port # the range 600 to 1023
>
> I think this is confusing, since it will still try 512..600 if nothing
> above is available. "Glibc will start searching from number 600 above
> and try lower port numbers only if no higher port is free." perhaps?
> Though that feels like quite an implementation detail, I would
> personally expect this in the NOTES section.

Note that line is source code comment.  It won't appear in the
formatted output.  As you say, it's an implementation detail, and I
didn't think it worth including it in the formatted text.

[...]

>> .SH RETURN VALUE
>> .BR bindresvport ()
>> returns 0 on success; otherwise \-1 is returned and
>> .I errno
>> set to indicate the cause of the error.
>
> Maybe it would be better to maintain consistent wording with other
> manpages, e.g. bind(2)?
>
> "On success, zero is returned.  On error, -1 is returned, and errno is
> set appropriately."

Yes, this is one of those nagging issues that needs to be fixed up,
probably in hundreds of pages.  One day...

[...]

>> .SH NOTES
>> .LP
>> Only root can bind to a privileged port; this call will fail for any
>> other users.
>> .I sin
>> is not NULL and
>> .I sin\->sin_family
>> is not
>> .BR AF_INET .
>
> Leftover from older version?

Yes.  Thanks for catching that.  I removed that text now.

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
