From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] open_wmemstream(3): Describe (as part of fmemopen.3)
Date: Sat, 6 Dec 2008 12:04:25 -0500
Message-ID: <cfd18e0f0812060904n70faa5c0vdb13bafa6378106c@mail.gmail.com>
References: <20081204232328.GJ10491@machine.or.cz>
	 <cfd18e0f0812050953l4b0a6ca0mf2994623474b149f@mail.gmail.com>
	 <20081206095414.GX10491@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081206095414.GX10491-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Dec 6, 2008 at 4:54 AM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
>  Hi,
>
>  thanks for all the comments.
>
> On Fri, Dec 05, 2008 at 12:53:26PM -0500, Michael Kerrisk wrote:
>> One thing that also is good to include is version information.
>> Unfortunately the page was lacking a VERSIONS section, when it really
>> should have had one.  I added the following:
>>
>> diff --git a/man3/fmemopen.3 b/man3/fmemopen.3
>> index 2b87b69..0d540b5 100644
>> --- a/man3/fmemopen.3
>> +++ b/man3/fmemopen.3
>> @@ -160,6 +160,13 @@ pointer.
>>  Otherwise, NULL is returned and the global variable
>>  .I errno
>>  is set to indicate the error.
>> +.SH VERSIONS
>> +.BR fmemopen ()
>> +is available since glibc 2.2.
>> +.BR open_memstream ()
>> +is available since glibc 2.0.
>> +.BR open_wmemstream ()
>> +is available since glibc 2.4.
>>  .SH "CONFORMING TO"
>>  These functions are GNU extensions.
>>  .\" Jan 06: But they appear to be going up for standardization by
>>
>> Look right to you?
>
> open_wmemstream() yes. fmemopen() is much much older (bear in mind that
> there was old GNU stdio library before GNU libio, and it contained
> fmemopen() too - I have no idea which libc version "Thu Aug 8 00:39:56
> 1991 +0000" is in, though) and same for open_memstream (Sun Jul 28
> 00:22:19 1991 +0000).

Thanks for catching that.  I made the text

.BR fmemopen ()
and
.BR open_memstream ()
were already available in glibc 1.0.x.
.BR open_wmemstream ()
is available since glibc 2.4.

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
