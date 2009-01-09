From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: regex.7 manpage is awful
Date: Fri, 9 Jan 2009 12:38:53 +0100
Message-ID: <20090109113852.GB21648@machine.or.cz>
References: <20090109102208.GA22747@atcmpg.ATComputing.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090109102208.GA22747-earCsCjlB1dYz1uS2RbbqIS2ikGnqaxS@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Oosthoek <simon-Hf+EfML1qzhUecB6AVeNQA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jan Christiaan van Winkel <jc-Hf+EfML1qzhUecB6AVeNQA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  Hi,

On Fri, Jan 09, 2009 at 11:22:09AM +0100, Simon Oosthoek wrote:
> If I were on the POSIX committee, I'd propose perl REs as the next
> "modern" RE, but I'd not obsolete the basic RE at all, because in 95%
> of the uses they are sufficient.
> Perl REs are easy to type, well documented and powerful. Also
> implementations already exist and are very well tested on probably all
> Unix platforms.

I doubt that you will succeed in adding a third regexp mode at this
point, but the POSIX development process seems very open, so feel free
to propose this: http://www.opengroup.org/austin/

> Anyway, the point of this e-mail:
> - the current page is awful, hard to read and ambiguous
> - the implied POSIX decision to obsolete basic REs is bad
> - I would not recommend this manpage to anyone trying to understand
>   REs

I agree with most of your points, but I'm sure Michael is aware of the
issues as well - what would probably help were actual patches. ;-)
A random set of working item ideas:

	* Don't use modern/obsolete terms since they are unwarranted and
	  confusing - they seem to push an agenda that has nothing to do
	  with the reality
	* Avoid (!) since they disturb the text severly, IMHO - discuss
	  extensions at the end; this is something that's even very
	  difficult to do for me since I don't actually understand many
	  of the (!)s
	* The page should be divided into subsections, with examples
	  at the end of each subsection
	* Atom should be explained before bound
	* Back reference should be mentioned before basic regexes
	  (glibc supports it for ERE too)
	* | is supported in BRE too in glibc
	* SEE ALSO should have perlre(1) (sic) reference
	* The AUTHOR paragraph hidden might violate the page licence?
	* Wound boundaries syntax is commented out, but a real one
	  is supported, using \b, \B, \< and \>
	* Plenty of other extensions available too, e.g. \w and \s
	  (see regcomp.c:peek_token())
	* On a related note, re_set_syntax() should be documented

(grep(1) has nice, concise and incomplete regex description.)

-- 
				Petr "Pasky" Baudis
The average, healthy, well-adjusted adult gets up at seven-thirty
in the morning feeling just terrible. -- Jean Kerr
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
