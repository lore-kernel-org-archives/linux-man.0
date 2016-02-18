From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: SEE ALSO: func based or man page based?
Date: Thu, 18 Feb 2016 12:10:18 +0100
Message-ID: <56C5A69A.7050001@gmail.com>
References: <20160216222613.GJ7732@vapier.lan> <56C44463.105@gmail.com>
 <20160217162815.GM7732@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160217162815.GM7732-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/17/2016 05:28 PM, Mike Frysinger wrote:
> On 17 Feb 2016 10:58, Michael Kerrisk (man-pages) wrote:
>> On 02/16/2016 11:26 PM, Mike Frysinger wrote:
>>> grepping shows that at
>>> least select_tut(2) is out of sync ...
>>
>> I'm not sure what you mean here. Can you elaborate please?
> 
> select_tut lists all the sigop funcs by name and does not list the
> sigops manpage.  conversely, sigprocmask doesn't list any sigop of
> the funcs by name and only lists the sigops manpage.

That's just one of the minor problems with that page :-). It's
irritating that the page duplicates so much info from select(2).
One day I'll get irritated enough to merge the two or seriously
trim select_tut(2).

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
