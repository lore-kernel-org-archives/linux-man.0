From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: regex.7 manpage is awful
Date: Mon, 12 Jan 2009 23:17:53 +1300
Message-ID: <cfd18e0f0901120217t4fac4ad8q35b944433905be2d@mail.gmail.com>
References: <20090109102208.GA22747@atcmpg.ATComputing.nl>
	 <20090109113852.GB21648@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090109113852.GB21648-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: Simon Oosthoek <simon-I2/4/b2VdYhUecB6AVeNQA@public.gmane.org>, Jan Christiaan van Winkel <jc-I2/4/b2VdYhUecB6AVeNQA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Jan 10, 2009 at 12:38 AM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
>  Hi,
>
> On Fri, Jan 09, 2009 at 11:22:09AM +0100, Simon Oosthoek wrote:
>> If I were on the POSIX committee, I'd propose perl REs as the next
>> "modern" RE, but I'd not obsolete the basic RE at all, because in 95%
>> of the uses they are sufficient.
>> Perl REs are easy to type, well documented and powerful. Also
>> implementations already exist and are very well tested on probably all
>> Unix platforms.
>
> I doubt that you will succeed in adding a third regexp mode at this
> point, but the POSIX development process seems very open, so feel free
> to propose this: http://www.opengroup.org/austin/
>
>> Anyway, the point of this e-mail:
>> - the current page is awful, hard to read and ambiguous
>> - the implied POSIX decision to obsolete basic REs is bad
>> - I would not recommend this manpage to anyone trying to understand
>>   REs
>
> I agree with most of your points, but I'm sure Michael is aware of the
> issues as well - what would probably help were actual patches. ;-)

Yes.

> A random set of working item ideas:
>
>        * Don't use modern/obsolete terms since they are unwarranted and
>          confusing - they seem to push an agenda that has nothing to do
>          with the reality
>        * Avoid (!) since they disturb the text severly, IMHO - discuss
>          extensions at the end; this is something that's even very
>          difficult to do for me since I don't actually understand many
>          of the (!)s
>        * The page should be divided into subsections, with examples
>          at the end of each subsection
>        * Atom should be explained before bound
>        * Back reference should be mentioned before basic regexes
>          (glibc supports it for ERE too)
>        * | is supported in BRE too in glibc
>        * SEE ALSO should have perlre(1) (sic) reference
>        * The AUTHOR paragraph hidden might violate the page licence?

Yes, that's probably true.  I reinstated that text.

[...]

Cheers,

Michael

PS Petr: Many other good ideas for fixes; maybe someone will pick this
up.  Not me, at the moment.


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
