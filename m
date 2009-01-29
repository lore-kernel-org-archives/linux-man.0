From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: open(2) says O_DIRECT works on 512 byte boundries?
Date: Thu, 29 Jan 2009 15:59:12 +1300
Message-ID: <cfd18e0f0901281859u250f202fj3ef40fb8531f1dc3@mail.gmail.com>
References: <20090128213322.GA15789@kroah.com> <4980FB4D.9090009@shaw.ca>
	 <20090129011758.GA26534@kroah.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090129011758.GA26534-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Cc: Robert Hancock <hancockr-fVOoFLC7IWo@public.gmane.org>, Greg KH <public-greg-U8xfFu+wG4EAvxtiuMwx3w-z5DuStaUktnZ+VzJOa5vwg@public.gmane.org>, public-mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w-z5DuStaUktnZ+VzJOa5vwg@public.gmane.org, public-linux-man-u79uwXL29TY76Z2rM5mHXA-z5DuStaUktnZ+VzJOa5vwg@public.gmane.org, public-linux-kernel-u79uwXL29TY76Z2rM5mHXA-z5DuStaUktnZ+VzJOa5vwg@public.gmane.org
List-Id: linux-man@vger.kernel.org




On Thu, Jan 29, 2009 at 2:17 PM, Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org> wrote:
>
>
>
> On Wed, Jan 28, 2009 at 06:41:49PM -0600, Robert Hancock wrote:
>>
>>
>> Greg KH wrote:
>>> In looking at open(2), it says that O_DIRECT works on 512 byte boundries
>>> with the 2.6 kernel release:
>>>      Under Linux 2.4, transfer sizes, and the alignment of the user
>>>      buffer and  the file offset must all be multiples of the logical
>>>      block size of the file system.  Under Linux 2.6, alignment  to
>>>      512-byte  boundaries suffices.
>>> However if you try to access an O_DIRECT opened file with a buffer that
>>> is PAGE_SIZE aligned + 512 bytes, it fails in a bad way (wrong data is
>>> read.)
>>> Is this just a mistake in the documentation?  Or am I reading it
>>> incorrectly?
>>> I have a test program that shows this if anyone wants it.
>>
>> Well, it sounds like a bug to me.. even if it's not supported, if you do
>> such an access, surely the kernel should detect that and return EINVAL or
>> something rather than reading corrupted data..
>
> It doesn't.  It says the read is successful, yet the data is not really
> read into the buffer.  Portions of it is, but not the amount we asked
> for.

Greg,

Can you post your test program?

Cheers,

Michael

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
