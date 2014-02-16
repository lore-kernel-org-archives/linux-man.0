From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Converting man-pages to UTF-8
Date: Sun, 16 Feb 2014 08:41:45 +0100
Message-ID: <53006BB9.40604@gmail.com>
References: <CAKgNAkh5tHmJc2DrcoAJsDWWFao6bPckd2sN1dw-CZDSFNi5kQ@mail.gmail.com> <20140214114216.GE6397@riva.ucam.org> <52FE360B.9050302@gmail.com> <20140214163035.GF6397@riva.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140214163035.GF6397-K2jUmMR1UYV4cg9Nei1l7Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Watson <cjwatson-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bruno Haible <bruno-nWNVUoHt2MvYtjvyW6yDsg@public.gmane.org>, Werner Lemberg <wl-mXXj517/zsQ@public.gmane.org>, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/14/2014 05:30 PM, Colin Watson wrote:
> On Fri, Feb 14, 2014 at 04:28:11PM +0100, Michael Kerrisk (man-pages) wrote:
>> Thanks for the extensive reply! One final point. For the pages that
>> have non-ASCII characters only in source comments, not in rendered
>> input source, does it matter whether or not the "coding:" tag is added?
>> I ask because, simply for documentary purposes, I'm wondering whether
>> we should add that tag only in the pages that have UTF-8 in the rendered
>> input.
> 
> I don't *believe* it will make a difference to groff's preconv, since
> all the other encodings people might be using will at worst only mangle
> UTF-8 characters in comments in ways that preserve their comment status.
> It might allow man-db to be marginally more efficient, but I think any
> difference would be negligible.

Thanks, Colin. Then, for now, I'm adding the "coding:" tag only to
pages with UTF-8 characters in the rendered text.

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
