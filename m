Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0831B4156
	for <linux-man@vger.kernel.org>; Mon, 27 Jul 2026 02:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.66.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119985; cv=none; b=uKjBoCOwn8k450xHlXNv6DtdC8CN8lYYWpDUB8JGbiVWnBxhbV/RLs12FdyzLPcJ+RSBw7yZvui4wqdSU4PNM8+1DMrIQ7khlNI2xtD5AV1UImRw01GrmwCvAHfHSsrSLP++4Vmy/l/zhWVoAbU0lYHtyHwIoEzMXH49SUbupeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119985; c=relaxed/simple;
	bh=OyM409sM2cF0lf+XjgJj30m2r8OG8P4qKlP3LfhBu9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6U5RPdQy12YR61RkCKroeoCShWtI3sZccG2pKG7xqQ4I/YtuGajVnwzk80is9Xb7+lckSHsmo50tz488wph5ZWbRTbgCqaeIj4MWa0JUlN91Ey6vGUEHU9P5gDxECtVXIH+667DtXjhQ05Tg7n7l1imFPY7kXEqf8aF1nQpMDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hallyn.com; spf=pass smtp.mailfrom=mail.hallyn.com; dkim=pass (2048-bit key) header.d=hallyn.com header.i=@hallyn.com header.b=AHbx7C88; arc=none smtp.client-ip=178.63.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hallyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.hallyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hallyn.com header.i=@hallyn.com header.b="AHbx7C88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hallyn.com; s=mail;
	t=1785119974; bh=OyM409sM2cF0lf+XjgJj30m2r8OG8P4qKlP3LfhBu9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AHbx7C88SB0yZC7dTZHjsq6htdWyqMYn1Oks81FlMk+LFN/jZfqEIJ50VVNfaxZgi
	 6gFRpJgXwvSFY6/VufogatPjR3WWMYrkGlQDZLxZ5qMYbUcaCv5kaV3F5RDCZc0Csc
	 yeBt4tOXwBcEXuAQDyq+Rq2knhyHigdWQWFUk/GAfBUC0fP30J/CoLmc9q+WyRLtjm
	 ovBmSULM39GRMXGrbJ9q5nLbM3S93JfaUjDlLDNcvTUTVJzxD5TeIObI9peu4OQY+E
	 5CLe+1SELA/85ovZ7ZDw/INB7JuK1zLYZEoNJP9No8MmBp4c3XhEweP8hUZ8tiKpSS
	 8fjRenUOkGFJw==
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id 4329A5B7; Sun, 26 Jul 2026 21:39:34 -0500 (CDT)
Date: Sun, 26 Jul 2026 21:39:34 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, "Serge E. Hallyn" <serge@hallyn.com>,
	Mark Harris <mark.hsj@gmail.com>,
	"G. Branden Robinson" <g.branden.robinson@gmail.com>,
	Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: [PATCH v2 1/4] man/man3/str*.3: NAME: Explain the names
Message-ID: <ambE5rIikTuHudR4@mail.hallyn.com>
References: <e1446fbce9d76cea797cf058f74ab0a63b744205.1782995502.git.alx@kernel.org>
 <cover.1783523064.git.alx@kernel.org>
 <b17a1548f3ab96216e6165bdd3194a80363e99f6.1783523064.git.alx@kernel.org>
 <amO0Wtmi4tpaGUKr@AUS2MQ6190Y76.amd.com>
 <amUw8ArFwmnsIKl1@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amUw8ArFwmnsIKl1@devuan>

On Sun, Jul 26, 2026 at 12:09:19AM +0200, Alejandro Colomar wrote:
> Hi Serge,
> 
> On 2026-07-24T13:52:10-0500, sergeh@kernel.org wrote:
> > On Wed, Jul 08, 2026 at 05:09:10PM +0200, Alejandro Colomar wrote:
> > > Reported-by: "Serge E. Hallyn" <serge@hallyn.com>
> > > Cc: Mark Harris <mark.hsj@gmail.com>
> > > Cc: "G. Branden Robinson" <g.branden.robinson@gmail.com>
> > > Cc: Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
> > > Signed-off-by: Alejandro Colomar <alx@kernel.org>
> > 
> > Most of these look good to me, just a few notes:
> 
> Thanks!
> 
> [...]
> > > @@ -6,7 +6,7 @@
> > >  .\"
> > >  .TH strdup 3 (date) "Linux man-pages (unreleased)"
> > >  .SH NAME
> > > -strdup, strndup \- duplicate a string
> > > +strdup, strndup \- string duplicate
> > 
> > string [bounded] duplicate
> > maybe?
> 
> I think for consistency with the other strn*() functions, the following
> would be better:
> 
> 	string [nonstring] duplicate
> 
> [...]
> > > @@ -6,7 +6,7 @@
> > >  .\"
> > >  .TH strfry 3 (date) "Linux man-pages (unreleased)"
> > >  .SH NAME
> > > -strfry \- randomize a string
> > > +strfry \- string fry
> > 
> > Maybe at least 'string fry (randomize)' ?  Because while stirfry
> > is amusing, it's confusing if you haven't heard it before.
> 
> Hmmm, randomize seems to generous, and one may think it is kind of
> a shred(1), while it isn't.  Maybe 'string fry (reorder)'?
> 
> [...]
> > > @@ -5,10 +5,7 @@
> > >  .\"
> > >  .TH strncat 3 (date) "Linux man-pages (unreleased)"
> > >  .SH NAME
> > > -strncat
> > > -\-
> > > -append non-null bytes from a source array to a string,
> > > -and null-terminate the result
> > > +strncat \- nonstring catenate
> > 
> > why nonstring?  The source string doesn't *have* to be a string,
> > but can be, right?
> 
> Yup, it can be a string, although it would be useless (if you want
> a string, you can use strcat(3)).

If the destination is 10 bytes long and has a 5 character string now,
and the source is a valid string that's 15 characters long, it's still
not safe to use strcat.

> >  (IIRC, you define a nonstring as an array
> > of given length that doesn't necessarily end in \0?  I could be
> > mis-remembering)
> 
> Yes, a nonstring is a character array that doesn't necessarily end in
> \0.  That's why a string is a valid nonstring, but not the other way
> around.
> 
> > string bounded concatente maybe?
> 
> Nope; that's what makes people misunderstand these functions, and
> confuse them with safe truncating functions (e.g., strscpy(9)).
> 
> I'll send you a copy of a paper I'm writing for the C Committee.
> 
> > I think it helps the quick association in the mind if the start
> > of the string matches more closely (str).
> 
> In this specific case, it's not a good idea.  strn*() are NOT string
> functions.
> 
> [...]
> > > @@ -6,7 +6,7 @@
> > >  .\"
> > >  .TH strnlen 3 (date) "Linux man-pages (unreleased)"
> > >  .SH NAME
> > > -strnlen \- determine the length of a fixed-size string
> > > +strnlen \- nonstring length
> > 
> > string bounded length?
> 
> Nope.  It doesn't handle strings.
> 
> [...]
> > > @@ -6,7 +6,7 @@
> > >  .\"
> > >  .TH strpbrk 3 (date) "Linux man-pages (unreleased)"
> > >  .SH NAME
> > > -strpbrk \- search a string for any of a set of bytes
> > > +strpbrk \- string search characters
> > 
> > does the p stand for returning pointer?
> 
> <https://stackoverflow.com/a/501005/6872717>
> 
> People say it was "string pointer break".  It was a weird name, and
> I ignore why they called it like that.  It seems to come from 4.3BSD;
> blame them.  :)
> 
> I expanded it as if it were called strchrs(), which is what it should
> have been called.  It's also the name used in Plan9 internally (in some
> cases).
> 
> 
> Have a lovely night!
> Alex
> 
> -- 
> <https://www.alejandro-colomar.es>


