From: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Subject: Re: POSIX.1-2013 man pages for review
Date: Tue, 01 Oct 2013 18:16:16 -0500
Message-ID: <1380669376.1974.124@driftwood>
References: <523AAEEE.5090602@gmail.com> <523AB978.2080607@barfooze.de>
	<CAKgNAki+jTS9rkORvcPNxWcStNjnNTnt_jqBYcfoaYm7d4GxqQ@mail.gmail.com>
	<523C48EF.5080309@barfooze.de> <20130920175410.GA1092@gauss>
	<523D8F06.9060801@barfooze.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523D8F06.9060801-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org> (from maillist-musl-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org
	on Sat Sep 21 07:20:22 2013)
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Felix Janda <felix.janda-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, John Spencer <maillist-musl-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Josey <ajosey-7882/jkIBncuagvECLh61g@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Matthew Dempsky <matthew-bfSpyvURsAhAfugRpC6u6w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09/21/2013 07:20:22 AM, John Spencer wrote:
> On 09/20/2013 07:54 PM, Felix Janda wrote:
>> John Spencer wrote:
...
>> much more likely to me that one can produce output
>> which makes your man implementation happy. The equations are already
>> hacked to make them better suitable for nroff.
> 
> i agree that the output of tbl is even worse...
> 
> btw my research on http://www.troff.org/papers.html revealed that tbl  
> and eqn preprocessors existed back in the troff days, so this seems  
> to be a historical mistake rather than groff's fault ;)

Eric Raymond's doclifter project was a python script that parsed man  
pages to produce docbook output. There's more horrible domain-specific  
knowledge encoded into that than you can possibly imagine, you might  
want to poke esr-4uCgticg2UFBDgjK7y7TUQ@public.gmane.org to see if he wants to comment on your  
thing.

Rob--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
