From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Tue, 21 Oct 2014 16:31:30 +0800
Message-ID: <544619E2.4060108@cn.fujitsu.com>
References: <544118FA.3070003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <544118FA.3070003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Cc: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


On 10/17/2014 09:26 PM, Michael Kerrisk (man-pages) wrote:
> Hello Haitao,
> 
> I was comparing some of the MT-Safety markings in man-pages versus the glibc
> manual (https://www.gnu.org/software/libc/manual/html_mono/libc.html)
> I found four cases that seem to contradict. Are there errors in either
> the man pages or in the glibc manual?
> 
> ==
> ctermid.3       MT-Unsafe race:ctermid/!s
> 	glibc: MT-Safe
> 
> man-pages and glibc manual disagree (man-pages seems to be more
> precise than glibc).
> 
> ==
> getcwd.3        MT-Safe env
> 	glibc: MT-Safe
> 
> man-pages and glibc manual disagree on "env" (man-pages seems 
> to be more precise than glibc).
> 

In getcwd.3 man-page:
getcwd() and getwd() are "MT-Safe"
get_current_dir_name() is "MT-Safe env"

URL: http://thread.gmane.org/gmane.linux.man/6580

The annotations are equal to glibc manual:)

> ==
> getlogin.3      MT-Unsafe race:cuserid/!string locale
> 	glibc: MT-Unsafe race:getlogin race:utent sig:ALRM timer locale
> 
> man-pages and glibc manual disagree on "race:cuserid/!string" versus
> "race:getlogin"
> 

In getlogin.3 man-page:
getlogin() is "MT-Unsafe locale"
getlogin_r() is "MT-Safe locale"
cuserid() is "MT-Unsafe race:cuserid/!string locale"

In glibc manual:
getlogin() is "MT-Unsafe race:getlogin race:utent sig:ALRM timer locale"
getlogin_r() is nonexistent
cuserid() is "MT-Safe locale"

glibc manual is more precise than man-page of getlogin().
The difference of cuserid() is similar to ctermid().

> ==
> regex.3         MT-Safe env
> 	glibc: MT-Safe locale
> 

In regex.3 man-page:
regcomp() and regexec() are "MT-Safe locale"
regerror() is "MT-Safe env"
regfree() is "MT-Safe"

URL: http://thread.gmane.org/gmane.linux.man/6609

The annotations are equal to glibc manual:)


-- 
Best Regards,
Peng

> man-pages and glibc manual disagree on "env" versus "locale"
> 
> ==
> 
> Cheers,
> 
> Michael
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
