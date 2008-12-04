From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: stat(2) can return EOVERFLOW
Date: Thu, 4 Dec 2008 15:48:21 -0500
Message-ID: <cfd18e0f0812041248t2154fcfbk23f6c42742f818a7@mail.gmail.com>
References: <20081204155355.GI16402@aym.net2.nerim.net>
	 <cfd18e0f0812041052v113510bbg389e8167758d1947@mail.gmail.com>
	 <1228419679.22091.58.camel@linux.heathens.co.nz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1228419679.22091.58.camel-DBi1IKlRe8YXiSwHZUBl+UgmxNRb6L7S@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-2022-JP?B?Q2hyaXMgIhskQiUvGyhCIiBIZWF0aA==?= <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
Cc: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Dec 4, 2008 at 2:41 PM, Chris "ク" Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org> wrote:
> Michael,
>
>> +This can occur when an application compiled on a 32-bit platform without
>> +.I -D_FILE_OFF_SET_BITS=64
>> +calls
>> +.BR stat ()
>> +on a file whose size exceeds
>> +.I (2<<31)-1
>> +bits.
>
> That should be _FILE_OFFSET_BITS.  :-)

Thanks Chris!

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
