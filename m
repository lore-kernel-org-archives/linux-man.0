From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [PATCH] Quarantine "gets.3" into its own "do not use" manpage
Date: Tue, 19 Nov 2013 15:13:11 +0100
Message-ID: <528B71F7.5070802@bfs.de>
References: <1384370434.15325.33.camel@surprise>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384370434.15325.33.camel@surprise>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Malcolm <dmalcolm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 13.11.2013 20:20, schrieb David Malcolm:
> Currently man3/gets.3 documents various safe I/O functions, along with
> the toxic "gets" function.
> 
> At the risk of being melodramatic, this strikes me as akin to storing
> rat poison in a food cabinet, in the same style of packaging as the
> food, but with a post-it note on it saying "see warnings below".
> 
> I think such "never use this" functions should be quarantined into their
> own manpages, rather than listing them alongside sane functions.
> 
> The attached patch does this for "gets", moving the documentation of the
> good functions from man3/gets.3 into man3/fgetc.3, updating the SO links
> in the relevant functions to point at the latter.
> 
> It then rewrites man3/gets.3 to spell out that "gets" is toxic and
> should never be used (with a link to CWE-242 for good measure).
> 
> Thoughts?
> Dave
> 
> [Note to self: I filed this downstream as:
> https://bugzilla.redhat.com/show_bug.cgi?id=1030030 ]
> 
> 

This is a good idea, it would also be helpful to have a list of
do-not-use function *including* the rational why in its own page.
We already have pages like 'undocumented' so it is not uniq.

re,
 wh


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
