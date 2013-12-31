From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Quarantine "gets.3" into its own "do not use" manpage
Date: Tue, 31 Dec 2013 22:31:19 +1300
Message-ID: <52C28EE7.9020807@gmail.com>
References: <1384370434.15325.33.camel@surprise>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384370434.15325.33.camel@surprise>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Malcolm <dmalcolm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello David,

On 11/14/13 08:20, David Malcolm wrote:
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

Seems reasonable to me. Applied, with a few tweaks.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
