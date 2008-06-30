From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [manpages]: First stab at a udplite(7) manpage
Date: Mon, 30 Jun 2008 15:03:13 +0200
Message-ID: <cfd18e0f0806300603g38cc4222r37996404390dfcbf@mail.gmail.com>
References: <20080517155916.34622BD22@poczta.oswiecenia.net>
	 <20080617111638.GA14409@gerrit.erg.abdn.ac.uk>
	 <200806172228.06801.tomasz@grobelny.oswiecenia.net>
	 <Pine.LNX.4.64.0806171344370.25191@shark.he.net>
	 <cfd18e0f0806180207x783d83d0j3d5e42987be24ea6@mail.gmail.com>
	 <20080618092707.GC23684@gerrit.erg.abdn.ac.uk>
	 <cfd18e0f0806180248g35bec32n7977c46cbcf4142@mail.gmail.com>
	 <20080624133625.GA16424@gerrit.erg.abdn.ac.uk>
	 <cfd18e0f0806270203p4305cd2jae9cb8a79d7c33e9@mail.gmail.com>
	 <20080630112751.GB5040@gerrit.erg.abdn.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080630112751.GB5040-w6qhtmnlW2CgJ32XgR7WtTYRy0cijUJx@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerrit Renker <gerrit-VsoRXqaLlyfQzY9nttDBhA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Jun 30, 2008 at 1:27 PM, Gerrit Renker <gerrit-VsoRXqaLlyfQzY9nttDBhA@public.gmane.org> wrote:
> |
> | The groff was fine.  I made a few light edits to the page.  I also
> | added some comments to the page with some "FIXME(gr)" pointing to
> | places where I think some work is needed.
> Thanks a lot for the review. It was particularly useful since it brought
> to light an unresolved issue: when the coverage > 65535, then unexpected
> things will happen since the internal fields are u16 and the
> setsockopt() argument is `int'.

Writing man pages tends to turn up bugs pretty often, I find.

> Will submit a bug-fix to netdev and resubmit the updated manpage when this
> issue has been resolved.

Thanks.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
